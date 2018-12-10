use chrono::prelude::*;
use std::num::ParseIntError;
use chrono::ParseResult;

const EVENT_DATE_FORMAT: &str = "%Y-%m-%d %H:%M";

#[derive(Debug, PartialEq)]
enum EventType {
    ShiftStart
}

#[derive(Debug)]
struct Event {
    date: NaiveDateTime,
    guard_id: u64,
    event_type: EventType,
}

fn parse(s: &str) -> Result<Event, &'static str> {
    let date = parse_event_date(s).map_err(|_| "Date error")?;
    let guard_id = parse_guard_id(s).map_err(|_| "Guard id error")?;
    let event_type = EventType::ShiftStart;
    Ok(Event {
        date,
        guard_id,
        event_type,
    })
}

fn parse_guard_id(s: &str) -> Result<u64, ParseIntError> {
    let sharp_index = s.chars().position(|c| c == '#').unwrap();
    let sub = &s[sharp_index + 1..];
    let space_index = sub.chars().position(|c| c == ' ').unwrap();
    (&sub[..space_index]).parse()
}

fn parse_event_date(s: &str) -> ParseResult<NaiveDateTime> {
    let date_as_string = &s[1..=16];
    NaiveDateTime::parse_from_str(date_as_string, EVENT_DATE_FORMAT)
}

#[cfg(test)]
mod should {
    use super::*;
    use spectral::prelude::*;

    #[test]
    fn parse_a_shift() {
        let line = "[1518-11-01 00:00] Guard #10 begins shift";
        let result = parse(line).unwrap();
        asserting!("date").that(&result.date)
            .is_equal_to(
                NaiveDate::from_ymd(1518, 11, 1).and_hms(0, 0, 0));
        asserting!("guard id")
            .that(&result.guard_id).is_equal_to(10);
        asserting!("event type")
            .that(&result.event_type).is_equal_to(EventType::ShiftStart);
    }

    #[test]
    fn parse_a_shift_with_single_digit_id() {
        let line = "[1518-11-01 00:00] Guard #1 begins shift";
        let result = parse(line).unwrap();
        asserting!("guard id")
            .that(&result.guard_id).is_equal_to(1);
    }
}
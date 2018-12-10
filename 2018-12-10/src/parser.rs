use chrono::prelude::*;
use chrono::NaiveDateTime;
use chrono::Utc;
use regex::Regex;

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

fn parse(s: &str) -> Event {
    let date_as_string = &s[1..=16];
    let sharp_index = s.chars().position(|c| c == '#').unwrap();
    let id = (&s[sharp_index + 1..=sharp_index + 2])
        .parse().unwrap();
    Event {
        date: NaiveDateTime::parse_from_str(date_as_string, EVENT_DATE_FORMAT).unwrap(),
        guard_id: id,
        event_type: EventType::ShiftStart,
    }
}

#[cfg(test)]
mod should {
    use super::*;
    use spectral::prelude::*;

    #[test]
    fn parse_a_shift() {
        let line = "[1518-11-01 00:00] Guard #10 begins shift";
        let result = parse(line);
        asserting!("date").that(&result.date)
            .is_equal_to(
                NaiveDate::from_ymd(1518, 11, 1).and_hms(0, 0, 0));
        asserting!("guard id")
            .that(&result.guard_id).is_equal_to(10);
        asserting!("event type")
            .that(&result.event_type).is_equal_to(EventType::ShiftStart);
    }
}
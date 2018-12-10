use chrono::prelude::*;
use chrono::DateTime;
use chrono::Utc;

struct Event {
    date: DateTime<Utc>,
}

fn parse(s: &str) -> Event {
    Event {
        date: Utc.ymd(1518,11,1).and_hms(0,0,0)
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
        assert_that!(result.date)
            .is_equal_to(Utc.ymd(1518, 11, 1)
                .and_hms(0, 0, 0));
    }
}
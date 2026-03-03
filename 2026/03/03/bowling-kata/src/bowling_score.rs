#[derive(Clone, Copy)]
struct Frame {
    rolls: [u16; 2],
}

impl Frame {
    fn new(rolls: [u16; 2]) -> Self {
        Self { rolls: rolls }
    }
    
    fn frame_score(&self) -> u16 {
        self.rolls.iter().sum::<u16>()
    }
    
    fn first_roll(&self) -> u16 {
        self.rolls[0]
    }
}

fn bowling_score(frames: &[Frame; 10]) -> u16 {

    let mut result = 0 as u16;
    let frame_number = frames.len();

    for i in 0..frame_number {
        let frame = frames[i];
        let frame_score = frame.frame_score();
        result += frame_score;
        if frame_score == 10 && i+1 < frame_number {
            let next_frame = frames[i + 1];
            result += next_frame.first_roll();
        } 
    }
    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn no_pin_down_score_is_zero() {
        let frames = [Frame::new([0, 0]); 10];

        let result = bowling_score(&frames);

        assert_eq!(result, 0);
    }

    #[test]
    fn one_pin_down_score_is_one() {
        let mut frames = [Frame::new([0, 0]); 10];
        frames[0] = Frame { rolls: [1, 0] };

        let result = bowling_score(&frames);

        assert_eq!(result, 1);
    }

    #[test]
    fn one_pin_down_in_two_rolls_score_is_two() {
        let mut frames = [Frame::new([0, 0]); 10];
        frames[0] = Frame { rolls: [1, 1] };

        let result = bowling_score(&frames);

        assert_eq!(result, 2);
    }

    #[test]
    fn one_pin_down_in_two_rolls_in_two_frames_score_is_four() {
        let mut frames = [Frame::new([0, 0]); 10];
        frames[0] = Frame { rolls: [1, 1] };
        frames[1] = Frame { rolls: [1, 1] };

        let result = bowling_score(&frames);

        assert_eq!(result, 4);
    }
    #[test]
    fn one_spare_the_two_pins_down_in_frame_score_is_13() {
        let mut frames = [Frame::new([0, 0]); 10];
        frames[0] = Frame { rolls: [5, 5] };
        frames[1] = Frame { rolls: [1, 1] };

        let result = bowling_score(&frames);

        assert_eq!(result, 13);
    }
}


type Position = (f64, f64);

type Line = (Position, Position);

pub struct Turtle {
    position: Position,
    direction: f64,
    path: Vec<Line>,
    writing: bool,
}


impl Turtle {
    pub fn new() -> Self {
        Turtle {
            position: (0.0, 0.0),
            direction: 0.0,
            path: vec![],
            writing: true,
        }
    }

    pub fn position(&self) -> Position {
        self.position
    }

    pub fn direction(&self) -> f64 {
        self.direction
    }

    pub fn forward(&mut self, distance: f64) {
        let (x, y) = self.position;
        let old_position = (x,y);
        let theta = self.direction.to_radians();
        let dx = distance * theta.cos();
        let dy = distance * theta.sin();
        self.position = (x + dx, y + dy);
        if self.writing {
            self.path.push((old_position, self.position));
        }
    }

    pub fn turn_right(&mut self, angle_in_degrees: f64) {
        self.direction += angle_in_degrees;
    }

    pub fn path(&self) -> &Vec<Line> {
        &self.path
    }

    pub fn pen_up(&mut self) {
        self.writing = false;
    }

    pub fn pen_down(&mut self) {
        self.writing = true;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn initially_turtle_is_at_0_0_direction_is_0() {
        let turtle = Turtle::new();
        assert_eq!((0.0, 0.0), turtle.position());
        assert_eq!(0.0, turtle.direction());
    }

    #[test]
    fn after_forward_in_direction_0_x_is_increased() {
        let mut turtle = Turtle::new();
        turtle.forward(100.0);
        assert_eq!((100.0, 0.0), turtle.position());
    }

    #[test]
    fn after_forward_two_times_in_direction_0_x_is_increased() {
        let mut turtle = Turtle::new();
        turtle.forward(100.0);
        turtle.forward(100.0);
        assert_eq!((200.0, 0.0), turtle.position());
    }
    #[test]
    fn after_turn_right_direction_changes() {
        let mut turtle = Turtle::new();
        let position = turtle.position();
        turtle.turn_right(45.0);
        turtle.turn_right(45.0);
        assert_eq!(90.0, turtle.direction());
        assert_eq!(position, turtle.position());
    }

    #[test]
    fn after_turn_right_and_forward_position_changes() {
        let mut turtle = Turtle::new();
        turtle.turn_right(90.0);
        turtle.forward(100.0);
        let (x,y) = turtle.position();
        assert_eq!(x.floor(), 0.0);
        assert_eq!(y.floor(), 100.0);
    }

    #[test]
    fn after_some_instructions_can_give_the_list() {
        let mut turtle = Turtle::new();
        turtle.turn_right(90.0);
        turtle.forward(100.0);
        turtle.turn_right(45.0);
        turtle.forward(50.0);
        let path = turtle.path();
        assert_eq!(2, path.len());
    }
    #[test]
    fn turtle_can_rise_pen_and_not_draw_lines() {
        let mut turtle = Turtle::new();
        turtle.pen_up();
        turtle.forward(100.0);
        turtle.pen_down();
        turtle.forward(50.0);
        let path = turtle.path();
        assert_eq!(1, path.len());
        let ((x0,y0),(x1,y1)) = path[0];
        assert_eq!(100.0, x0);
        assert_eq!(150.0, x1);
    }
}

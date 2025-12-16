use crate::turtle::Turtle;
use gtk4::prelude::*;
use gtk4::{Application, ApplicationWindow, DrawingArea};

mod turtle;

fn main() {
    let app = Application::builder()
        .application_id("com.example.gtk4-trace")
        .build();

    app.connect_activate(build_ui);
    app.run();
}

fn build_ui(app: &Application) {
    let window = ApplicationWindow::builder()
        .application(app)
        .title("Turtle Graphics")
        .default_width(800)
        .default_height(600)
        .build();

    let drawing_area = DrawingArea::builder().hexpand(true).vexpand(true).build();

        let mut turtle = Turtle::new();
        turtle.forward(100.0);
        turtle.turn_right(90.0);
        turtle.pen_up();
        turtle.forward(100.0);
        turtle.pen_down();
        turtle.turn_right(45.0);
        turtle.forward(50.0);

    drawing_area.set_draw_func(move |_, ctx, _width, _height| {
        ctx.set_line_width(12.0);
        ctx.set_source_rgba(0.0, 1.0, 0.0, 1.0);
        for line in turtle.path() {
            let ((x0,y0), (x1,y1)) = line;
            ctx.move_to(*x0, *y0);
            ctx.line_to(*x1, *y1);
        }
        ctx.stroke().expect("can't stroke!");
    });

    window.set_child(Some(&drawing_area));
    window.show();
}


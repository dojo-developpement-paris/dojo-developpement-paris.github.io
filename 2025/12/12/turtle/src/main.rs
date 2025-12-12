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

    drawing_area.set_draw_func(move |_, ctx, _width, _height| {
        let mut turtle = Turtle::new();
        ctx.set_line_width(42.0);

        let (x, y) = turtle.position();
        ctx.move_to(x, y);
        turtle.forward(100.0);
        let (x1, y1) = turtle.position();
        ctx.line_to(x1, y1);
        ctx.stroke().expect("can't stroke!");
    });

    window.set_child(Some(&drawing_area));
    window.show();
}

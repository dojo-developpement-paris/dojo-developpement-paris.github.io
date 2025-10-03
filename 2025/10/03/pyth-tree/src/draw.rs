use gtk::DrawingArea;
use gtk::prelude::DrawingAreaExt;
use gtk::cairo::Context;

pub fn draw(drawing_area: &DrawingArea, context: &Context, _width: i32, _height: i32) {
    context.set_source_rgb(
        0.2,
        0.5,
        0.3,
    );
    println!("{}", drawing_area.content_width());
    let x = (drawing_area.content_width() as f64 - 100.0) / 2.0;
    let y = drawing_area.content_height() as f64 - 100.0;
    context.translate(x, y);
   // context.rotate(std::f64::consts::PI/4.0);
    context.rectangle(10.0, 10.0, 100.0, 100.0);
    let _ = context.fill();
    context.move_to(10.0, 10.0);
    context.line_to(60.0, -40.0);
    context.line_to(10.0, 100.0);
    context.line_to(10.0, 10.0);
    let _ = context.fill();

}


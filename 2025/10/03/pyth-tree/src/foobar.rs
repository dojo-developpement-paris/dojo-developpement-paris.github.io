use crate::glib::Propagation;
use crate::glib::clone;
use rand::Rng;
use std::cell::RefCell;
use gtk::prelude::*;
use gtk::{self, glib, Application, ApplicationWindow, DrawingArea, EventControllerKey, Frame};

const APP_ID: &str = "org.gtk_rs.pyth-tree";

fn main() -> glib::ExitCode {
    // Create a new application
    let app = Application::builder().application_id(APP_ID).build();

    // Connect to "activate" signal of `app`
    app.connect_activate(build_ui);

    // Run the application
    app.run()
}

fn build_ui(application: &Application) {

    let drawing_area = DrawingArea::builder()
        .content_width(300)
        .content_height(200)
        .build();
    let mut rng_rc = RefCell::new(rand::thread_rng());
    drawing_area.set_draw_func(move |_, cr, _w,_h| {
        let mut rng = rng_rc.borrow_mut();
        cr.set_source_rgb(
            rng.random_range(0.0 .. 1.0),
            rng.random_range(0.0 .. 1.0),
            rng.random_range(0.0 .. 1.0),
        );
        cr.rectangle(10.0, 10.0, 290.0, 190.0);
        cr.fill();

    });

    // Create a window
    let window = ApplicationWindow::builder()
        .application(application)
        .title("My GTK App")
        .child(&drawing_area)
        .build();

    let event_controller_key = EventControllerKey::new();
    event_controller_key.connect_key_pressed(clone!(#[strong] window, move |_,_,_,_| {
        window.close();
        Propagation::Stop
    }));
    window.add_controller(event_controller_key);
    // Present the window
    window.present();
}

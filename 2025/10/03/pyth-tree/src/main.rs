use crate::draw::draw;
use crate::glib::{Propagation, clone};
use gtk::prelude::*;
use gtk::{self, glib, Application, EventControllerKey, Orientation};

const APP_ID: &str = "org.gtk_rs.pyth-tree";

mod draw;

fn main() -> glib::ExitCode {
    let application = Application::builder()
        .application_id(APP_ID)
        .build();

    application.connect_activate(build_user_interface);
    application.run()
}

fn build_user_interface(application: &Application) {

    let drawing_area = gtk::DrawingArea::builder()
        .content_width(500)
        .content_height(300)
        .build();

    drawing_area.set_draw_func(draw);

    let application_box = gtk::Box::builder()
        .orientation(Orientation::Vertical)
        .build();

    application_box.append(&drawing_area);

    let application_window = gtk::ApplicationWindow::builder()
        .application(application)
        .title("Pyth-Tree")
        .child(&application_box)
        .build();

    let event_controller_key = EventControllerKey::new();
    event_controller_key.connect_key_pressed(clone!(#[strong] application_window, move |_,_,_,_| {
        application_window.close();
        Propagation::Stop
    }));
    application_window.add_controller(event_controller_key);

    application_window.present()
}

use debug::PrintTrait;

#[derive(Copy, Drop)]
struct Rectangle {
    width: u32,
    height : u32,
}

trait RectangleTrait {
    fn area(self: @Rectangle) -> u32;
}

impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u32 {
       ( *self.width ) * (*self.height)
    }

}

fn main() {
    calc_area(2, 4);
}

fn calc_area(w: u32, h: u32) {
    let rect1 = Rectangle {width: w, height: h};

    rect1.area().print();
}
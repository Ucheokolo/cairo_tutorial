use debug::PrintTrait;

#[derive(Copy, Drop)]
struct Rectangle {
    width: u32,
    height : u32,
}

// instead of creating separate trait and implementation blolcks, we can have multiple of both stored in one. see line21 and line29.....

// trait RectanglesTrait {
//     fn square(size: u32) -> Rectangle;
// }

// impl RectanlesImpl of RectanglesTrait {
//     fn square(size: u32) -> Rectangle {
//         Rectangle {width: size, height: size}
//     }
// }

trait RectangleTrait {
    fn area(self: @Rectangle) -> u32;

    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool;

    fn square(size: u32) -> Rectangle;
}

impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u32 {
       ( *self.width ) * (*self.height)
    }

    fn can_hold(self: @Rectangle, other: @Rectangle) ->  bool{
        *self.width > *other.width && *self.height > *other.height
    }

    fn square(size: u32) -> Rectangle {
        Rectangle {width: size, height: size}
    }

}

trait WidthTrait {
    fn width(self: @Rectangle) -> bool;
}

impl WidthTraitImpl of WidthTrait {
    fn width(self: @Rectangle) -> bool{
        (*self.width) > 0
    }
}

// instead of creating separate trait and implementation blolcks, we can have multiple of both stored in one. see line21 and line29.....

// trait Can_holdTrait{
//     fn can_hold(self: @Rectangle, other: @Rectangle) -> bool;
// }


// impl Can_holdTraitImpl of Can_holdTrait {
//     fn can_hold(self: @Rectangle, other: @Rectangle) ->  bool{
//         *self.width > *other.width && *self.height > *other.height
//     }
// }

fn main() {
    calc_area(2, 4);
    confirm_width(0, 5);
    method_comp();
    build_square(3);
}

fn confirm_width(w: u32, h: u32) -> bool {
    let rect1 = Rectangle {width: w, height: h};
    rect1.width().print();
    rect1.width()
}

fn calc_area(w: u32, h: u32) {
    let two_words = (30, 40);
    let rect1 = Rectangle {width: w, height: h};

    rect1.area().print();

}

fn method_comp() {
    let rect1 = Rectangle {width: 20, height: 4};
    let rect2 = Rectangle {width: 11, height: 3};
    let rect3 = Rectangle {width: 15, height: 2};

    'can rect1 hold rect2'.print();
    rect1.can_hold(@rect2).print();

    'can rect3 hold rect1'.print();
    rect3.can_hold(@rect1).print();
}

fn build_square(parameter: u32) -> u32 {
   let square1 =  RectangleImpl::square(parameter);
   'the area of this square is'.print();
   square1.area().print();
   square1.area()
}

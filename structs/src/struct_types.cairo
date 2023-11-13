use debug::PrintTrait;

#[derive(Copy, Drop)]
struct User {
    active: bool,
    username: felt252,
    email: felt252,
    sign_in_count: u64,
}





fn main() {
    let mut count: u64 = 0;
    let rectangle = (2, 4);
    let my_rect = my_rectangle(2, 3);
    count = count + 1;
    record_user_details('ucheboy248', 'uche.binance@gmail.com', count);
    init_record(false, 'Ucheboy', 'uchena@yahoo.com', count );

    area_rect(30, 10);
    area_tuple(rectangle);
    struct_area(my_rect);



}

fn record_user_details(_username: felt252, _email: felt252, _count: u64) -> User{
    let user1 = User {active: true, username: _username, email: _email, sign_in_count: _count };
    user1.email.print();
    user1

}

// instead of calling each key identifier when initializing a struct we could do this....

fn init_record(active: bool, username: felt252, email: felt252, sign_in_count: u64) -> User {
    let User2 = User {active, username, email, sign_in_count };
    let mut user_name: felt252 = User2.username;
    user_name.print();
    User2.active.print();
    User2
}

// Working with structs
fn area_rect(width: u64, height: u64) {
    let result = area_formular(width, height);
    'print area here'.print();
    result.print();
}

fn area_formular(width: u64, height: u64) -> u64{
    width * height
}

// using tuple
fn area_tuple(dimension: (u64, u64)) -> u64{
    let (x, y) = dimension;
    let area =  x * y;
    area.print();
    area

}

// using a struct
fn struct_area(rect: Rectangle) -> u64 {
    let area = rect.width * rect.height;
    area.print();
    area
}

fn my_rectangle(width: u64,  height: u64) -> Rectangle {
    let rectangle = Rectangle{width, height};
    'impl print'.print();
    rectangle.print();
    rectangle
}






#[derive(Copy, Drop)]
struct Rectangle {
    width: u64,
    height: u64,
}

impl RectanglePrintImpl of PrintTrait<Rectangle> {
    fn print(self: Rectangle) {
        self.width.print();
        self.height.print();
    }
}



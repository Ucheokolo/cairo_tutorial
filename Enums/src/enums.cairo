use debug::PrintTrait;

#[derive(Copy, Drop)]
enum Direction {
    North,
    South,
    East,
    West,
}

#[derive(Copy, Drop)]
enum message {
    Quit,
    Echo: felt252,
    Move: (u128, u128),
}


// Read up on Option Enums.............
// #[derive(Copy, Drop)]
// enum Option<T> {
//     Some: T,
//     None: (),
// }

trait processing {
    fn process(self: message);

    fn gps(self: Direction);
}

impl processingImpl of processing {
    fn process(self: message) {
        match self {
            message::Quit => {'quiting'.print(); },
            message::Echo(value) => {value.print(); },
            message::Move((x,y)) => {'moving'.print(); },
        }
    }

    fn gps(self: Direction) {
        match self{
            Direction::North => {'North'.print(); },
            Direction::South => {'South'.print(); },
            Direction::East => {'East'.print(); },
            Direction::West => {'West'.print(); },
        }
    }
}

fn main() {
    set_msg();
    set_direction();

}

// fn find_value_recursive(arr: @Array<felt252>, value: felt252, index: usize) -> Option<usize>{
//     if index >= arr.len() {
//         return Option::None;
//     }
//     if *arr.at(index) == value {
//         return Option::Some(index);
//     }

//     find_value_recursive(arr, value, index + 1);
// }

fn set_msg() {
    let msg: message = message::Quit;
    'the message is'.print();
    msg.process();
}

fn set_direction() {
    let direction = Direction::South;
    'current position is'.print();
    direction.gps();
}

// fn return_tuple() -> (u32, u32) {
//     let height = 2;
//     let width = 5;
//     let the_tuple = (width, height);
//     // the_tuple.print();
//     the_tuple
    
// }

// impl tupleImpl of PrintTrait<(u32, u32)> {
//     fn print(self: (u32, u32)){
//         self.print();
//     }
// }


use debug::PrintTrait;

fn main() {
    let mut number = 32_u32;
    let_if();
    if number >= 5 {
        'condition was true'.print();
    } else if number == 10 {
        'condition was false'.print();
    } else if number - 10 == 22 {
        'condition met'.print();
    } else {
        'forget it'.print();
    }
}

fn let_if() {
    let condition: bool = true;
    let number = if condition {
        5
    } else {
        6
    };

    if number == 5 {
        'condition was true oooo'.print();
    }
}
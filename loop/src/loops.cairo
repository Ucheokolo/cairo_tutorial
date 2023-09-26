use debug::PrintTrait;

fn main() {
    return_values_from_loop();
    let mut i: usize = 0;
    loop {
        if i >= 10 {
            break;
        }
        if i == 5 {
            i += 1;
            continue;
        }
        i.print();
        i += 1;
    }
}

fn return_values_from_loop() {
    let mut counter = 0;

    let result = loop {
        if counter == 4 {
            break counter *2;
        }
        counter += 1;
    };
    'The result is '.print();
    result.print();
}


use debug::PrintTrait;
use debug::Into;

const ONE_HOUR_IN_SECONDS: u32 = 3600;
fn main() {
    let x = 5;
    let x = x + 1;
    
    {
        let x = x * 2;
        'Inner scope x value is:'.print();
        x.print()
    }
    'outer scope x value is:'.print();
    x.print();

    'seconds conv is printed here:'.print();
    ONE_HOUR_IN_SECONDS.print();

    let mut x: u64 = 2;
    x.print();
    let x: felt252 = x.into(); // converts x to a felt, type annotation is required
    x.print();

    let x = 6 * 4;
    'last x value is:'.print();
    x.print();

}

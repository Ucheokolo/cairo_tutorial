use debug::PrintTrait;
use traits::TryInto;
use option::OptionTrait;
fn subs_u8s(x: u8, y: u8) -> u8{
    x-y
}
fn main() {
    let x: felt252 = 3;
    let y: u32 = x.try_into().unwrap();
    'Data type code:'.print();
    y.print();
    let result: u8 = subs_u8s(3, 1);
    'help:'.print();
    result.print();

    //addtition
    let sum = 5_u128 + 4_u128;

    //change data type
    let sumDtype: u8 = sum.try_into().unwrap();
    'Addition:'.print();
    sum.print();
    sumDtype.print();

    //Subtraction
    let difference = 95_u8 - 5_u8;
    'Subtraction:'.print();
    difference.print();
    

    //multiplication
    let product = 6_u8 * 7_u8;
    'multiplication:'.print();
    product.print();

    // division
    let quotient = 26_u8 / 5_u8;
    let quotient2 = 18_u8 / 2_u8;

    'Division:'.print();
    quotient.print();
    quotient2.print();


    // Modulo
    let remainder = 40_u128 % 7_u128;
    'modulo:'.print();
    remainder.print();

    // boolean
    // booleans are also by default felt252 in size
    let t = true;
    t.print();

    let f: bool = false;
    f.print();

    // Tupples
    let tup: (felt252, u8, bool) = ('Uchenna', 10, true);
    

    let (a, b, c) = tup;

    if b == 10 {
        'true'.print();
    } else {
        'false'.print();
    }

    a.print();
    b.print();
    c.print();

    // we can also declare tuple with values and types

    let (a, b): (u32, u32) = (6, 24);
    a.print();
    b.print();





}
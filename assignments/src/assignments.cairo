use debug::PrintTrait;
// use alexandria::math::sha512::sha512;
use traits::{Into, TryInto};


fn first_assg(integer: u32){
    let factor = 2_u32;
    let result: u32 = integer + factor;
    result.print();
}

fn main() {
    first_assg(3);
}
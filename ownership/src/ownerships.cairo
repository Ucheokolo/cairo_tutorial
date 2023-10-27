use debug::PrintTrait;
use nullable::{nullable_from_box, match_nullable, FromNullableResult};
use clone::Clone;
use array::ArrayTCloneImpl;

fn main() {
    let mut first_array = ArrayTrait::<u128>::new();
    ownership_with_arr();
    A {};
    B {dict: Default::default()};
    array_data();
    return_value();
    multi_return(first_array);
}

fn simpledata_type() {
    let mut first_arr = ArrayTrait::<u128>::new();
    let mut uche = 9_u128;
    let mut nono = 8_u128;
    first_arr.append(nono);
    first_arr.append(uche);

    let mut second_arr = ArrayTrait::<u128>::new();
    second_arr.append(uche);
    second_arr.append(nono); 

    test_1(first_arr);
    // test_2(first_arr);
}

fn test_1(array: Array<u128>){}
fn test_2(array: Array<u128>){}


fn ownership_with_arr() {
    let mut arr = ArrayTrait::<u128>::new();
    arr.append(1);
    arr.append(5);

    foo(arr);
    // bar(arr); // The ownership system thus prevents us from using the same instance of arr in foo.


    // as a result of the copy implementation we are able to use p1 in multiple function arguments.
    let p1 = point{x:5, y:8, z:2};
    dad(p1);
    mom(p1);
    
}

fn foo(arr: Array<u128>) {}
fn bar(arr: Array<u128>) {}

fn dad(d: point) {}
fn mom(m: point) {}

// because array and dictionaries can't be copied, we can implement a copy trait in occassions that requires passing in more than one value in multiple fuction within a scope

#[derive(Copy, Drop)]
struct point {
    x: u128,
    y: u128,
    z: u32,
}

// experimenting the Drop implementation
#[derive(Drop)]
struct A {

}

#[derive(Drop)]
struct C {}

// Dictionaries by default hav the destruct trait and are dropped as a consequence at the end of every scope.
// However when used inside a struct keep in mind that the default destruct does not apply neither would the Drop trait work. so the [derive(Destruct)] is used to squash the dictionary in this case. eg....

#[derive(Destruct)]
struct B {
    dict: Felt252Dict<u128>
}

// copy an array data with clone
fn array_data(){
    let mut arr1 = ArrayTrait::<u128>::new();
    arr1.append(2);
    arr1.append(5);

    let arr2 = arr1.clone();
    let arr2First = *arr2.at(1);
    arr2First.print();
}

fn return_value() -> point{
    let t1 = point{x: 7, y: 8, z: 4};
    t1
}

fn return_args(pointer: point) -> point{
    pointer
}

fn multi_return(arr: Array<u128>) -> (Array<u128>, usize) {
    let length = arr.len();
    return(arr, length);
}

// I've tried this for testnet and works for me
//     const provider = new Provider({
//       sequencer: "https://alpha4.starknet.io"
//     })



// Easy command to get ABI from your file:

// 1. scarb build
// 2. jq ".abi" ./target/dev/mypackage_contract.sierra.json


// npm install --legacy-peer-deps
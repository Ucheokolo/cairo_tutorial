use debug::PrintTrait;

fn sub_function() {
    'subfunction'.print();

}

fn main() {
    'Hello world!'.print();
    sub_function();
    pro_function();
    function_args(3);
    multiply(2, 2);

    let y = {
        let x = 3;
        let x=  x + 4; 
        x - 4 //Expressions do not include ending semicolons
    };
    y.print();
    let u = return_fuct();
    u.print();
    let div = divide(9, 3);
    'The return function result'.print();
    div.print();
}

fn pro_function(){
    'profunction'.print();
}

fn function_args(x: felt252) {
    x.print();
}

fn multiply(x: u16, y: u16){
    let t: u16 = x * y;
    t.print();
}

fn return_fuct() -> u32 {
   return 5;
}

fn divide(x: u32, v: u32) -> u32 {
    let t = {
        let i = x;
        x/v
    };
    t // see how i did not use semicolon here. this is done to signify that t is an expression. only expressions can be returned.
}
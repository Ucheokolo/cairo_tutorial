use debug::PrintTrait;

fn sub_function() {
    'subfunction'.print();

}

fn main() {
    'Hello world!'.print();
    sub_function();
    pro_function();
}

fn pro_function(){
    'profunction'.print();
}
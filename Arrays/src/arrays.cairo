use debug::PrintTrait;
use debug::ArrayTrait;
use traits::TryInto;
use option::OptionTrait;
use box::BoxTrait;

fn main() {
    first_arr();
    at_method();
    // arr_data_type();
    get_method();
    

}

fn first_arr() {
    let mut a = ArrayTrait::new();
    a.append(9);
    a.append(1);
    a.append(2);

    // lets pop an item from "first_arr"
    let first_pop = a.pop_front().unwrap();
    a.append(first_pop);

    'first print'.print();
    first_pop.print(); // this should return the popped item from the array.
    'second print'.print();
    a.print();
}

fn arr_data_type() {
    let mut arr_type = ArrayTrait::<felt252>::new();
    // this can also be written as
    let mut arry_type:Array<u32> = ArrayTrait::new();

    arr_type.append(1);
    arry_type.append(2);
    arr_type.append(3);
    arry_type.append(5);

    // arry_type.print();

    let first = *arr_type.at(1);
    first.print();
    // let mut atp:Array<felt252> = arr_type.into();
    arr_type.print();
    arry_type.boundary();
    
}

fn at_method() {
    // Reading Elements from an array witt get() or at()
    // get() returns none and doesn't throw an error when index is out of bound
    // at() unboxes the item to be fetched and incase of out of bound, it throws an error message...

    // at() method
    let mut get_array = ArrayTrait::new();
    get_array.append(1);
    get_array.append(7);
    get_array.append(9);

    let first_element = *get_array.at(0);
    let third_element = *get_array.at(2);

    'the get_at function'.print();
    first_element.print();
    third_element.print();

    // To determine the number of elements in an array, use the len() method. The return is of type usize.
    // If you want to check if an array is empty or not, you can use the is_empty() method, which returns true if the array is empty and false otherwise.
    let arraySize:usize = get_array.len();
    arraySize.print();
    let validity:bool = get_array.is_empty();
    validity.print();

}

fn get_method() -> u128 {
    // Reading Elements from an array witt get() or at()
    // get() returns none and doesn't throw an error when index is out of bound
    // at() unboxes the item to be fetched and incase of out of bound, it throws an error message...
    let mut get_array = ArrayTrait::<u128>::new();
    get_array.append(100);
    let index_to_access = 0; // Change this value to see different results, what would happen if the index doesn't exist?

    match get_array.get(index_to_access) {
        Option::Some(x) => {
            *x.unbox()
        },
        Option::None(_) => {
            let mut data = ArrayTrait::new();
            data.append('out of bound');
            panic(data)
        }
    }

}

#[generate_trait]
impl Arry_imp of array_imp_Trait {
    fn boundary(self: Array<u32>) {
        let mut i: usize = 0;
        loop {
        if i > self.len() {
            break;
        }       
        match self.get(i) {
                Option::Some(x) => {
                  let res =  *x.unbox();
                    res.print();
                },
                Option::None(_) => {
                    let mut data = ArrayTrait::new();
                    data.append('Run finished');
               panic(data)
                },
        }
        i +=1;
        }
    }
}

#[derive(Copy, Drop)]
enum Data{
    Name: felt252,
    Age: u128,
    LGA_height: (felt252, u32),
}

fn enum_array() {
    let mut biodata: Array<Data> = ArrayTrait::new();
    biodata.append(Data::Name('Uchenna'));
    biodata.append(Data::Age(33));
    biodata.append(Data::LGA_height(('Onitsha North', 176)));

    // let bioprint = biodata.span();
    
}     
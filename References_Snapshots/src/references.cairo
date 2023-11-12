use debug::PrintTrait;

fn main() {
    let mut rec = Rectangle {height: 8, width: 4};
    rec.height.print();
    rec.width.print();
    working_flip(ref rec);
    rec.height.print();
    rec.width.print();
    first_array();
    area_rectangle();
    
    // first_snapshot.print();
}

fn first_array() {
    let mut arr1 = ArrayTrait::<u128>::new();
    arr1.append(4);
    arr1.append(7);
    let first_snapshot = @arr1; // this takes the snapshot of the array at this time
    let first_length = calc_length(first_snapshot); // remember line 36, calc_length takes the snapshot of an array
    first_length.print();

    arr1.append(8);
    let second_snapshot = @arr1;
    let second_length = calc_length(second_snapshot);
    second_length.print();

}

fn area_rectangle(){
    let rect_angle = Rectangle{height: 3, width: 10};
    let area = calc_area(@rect_angle);
    area.print();
}

fn calc_area(rec: @Rectangle) -> u64{
    *rec.height * *rec.width
    // Rectangle is a struct containing the parameters of a rectangle...
    // rec is a snapshot of that rectangle
    // we use '*' to desnap the struct in other to use the each variable for the calculation in line 32..
}


fn calc_length(arr: @Array<u128>) -> usize {
    arr.len()
}

// fn flip(rec: @Rectangle) {
//     let temp = rec.height; // throws an error because compiler prevents the modifying of snapshots...
//     rec.height = rec.width;
//     rec.width = temp;
// }

fn working_flip(ref rec: Rectangle) {
    let temp = rec.height;
    rec.height = rec.width;
    rec.width = temp;
    
}


#[derive(Copy, Drop)]
struct Rectangle{
    height: u64,
    width: u64,
}

#[generate_trait]
impl Arry_imp of array_imp_Trait {
    fn boundary(self: Array<u128>){
        let mut i: usize = 0;
        loop {
            if i > self.len(){
                break;
            }
        

        match self.get(i) {
            Option::Some(x) => {
                let res = *x.unbox();
                res.print();
            },
            Option::None(_) => {
                let mut data = ArrayTrait::new();
                data.append('Run Finished');
                panic(data)
            }
        }
        i +=1;
        }
    }
}
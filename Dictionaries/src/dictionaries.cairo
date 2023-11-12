use debug::PrintTrait;
use dict::Felt252DictTrait;
use dict::Felt252DictEntryTrait;
// use nullable::{nullable_from_box, match_nullable, FromNullableResult};

fn main() {
    _dict();
    dictMutable();
    dict_2(108, 7, 9);
}



fn _dict() {
    let mut balances: Felt252Dict<u64> = Default::default();

    balances.insert('Alex', 4);
    balances.insert('Uche', 500);
    balances.insert('Kenny', 8);
    // balances.entry('uche');

    let alex_bal = balances.get('Alex');
    assert(alex_bal < 120, 'Balance is not 120');
    alex_bal.print();

    balances.insert('Alex', alex_bal + 5);
    let alex_bal_2 = balances.get('Alex');
    alex_bal_2.print();

    let uche_bal = balances.get('Uche');
    assert(uche_bal == 500, 'Balance tampered');

    balances.get('Kenny').print();

}

fn dict_2(_firstScore: u32, _secondScore: u32, _thirdScore: u32) {
    let mut points: Felt252Dict<u32> = Default::default();
    points.insert('Nono', _firstScore);
    points.insert('Kenny', _secondScore);
    points.insert('Uche', _thirdScore);


    let Nono_point = points.get('Nono');
    assert(Nono_point < 100, 'greater than 100');

    'Nono scores'.print();
    Nono_point.print();

}

fn dictMutable() {
    let mut scores: Felt252Dict<u32> = Default::default();
    scores.insert('Tboy', 26);
    scores.insert('sbox', 3);
    scores.insert('tender', 40);

    let _sbox = scores.get('sbox');
    _sbox.print();

    // none existent objects when called in a dictionary does not return an error, instead, it returns an empty object.
    // it is also imorportant to note that objects can't be deleted from a dictionary, however, they can be updated and this happens by changign the storage.
    let inexistentUser = scores.get('Uche');
    'Print non existent user'.print();
    inexistentUser.print();
    assert(_sbox == 3, 'Number is 35');

    scores.insert('sbox', 3 + _sbox);
    let _sbox2 = scores.get('sbox');
    _sbox2.print();
    assert(_sbox2 == 3, 'Number is now 6');
}

fn _pdict(_owner: felt252, _subject: felt252, _score: felt252 ) {

    let mut _classRecords = ArrayTrait::<dict_arr>::new();
    let data = dict_arr{owner: _owner, subject: _subject, score: _score};
    _classRecords.append(data);

    let rec1 = *_classRecords.at(0);


    // rec1.boundary();

}

#[derive(Copy, Drop)]
struct dict_arr{
    owner: felt252,
    subject: felt252,
    score: felt252
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

// The main difference between Drop<T> and destruct<T> is the Drop as a no-op operation, meaning meaning it does not generate new CASM while Destruct<T> does not have this restriction. the only type that uses the Destruct<T> trait is the Felt252Dict<T>. 
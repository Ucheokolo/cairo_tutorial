use debug::PrintTrait;
// use debug::Felt252DictTrait;
use nullable::{nullable_from_box, match_nullable, FromNullableResult};

fn main() {
    dict();
    dictMutable();
    dict_2(108, 7, 9);
}

fn dict() {
    let mut balances: Felt252Dict<u64> = Default::default();

    balances.insert('Alex', 4);
    balances.insert('Uche', 500);
    balances.insert('Kenny', 8);

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
    assert(_sbox == 3, 'Number is 35');

    scores.insert('sbox', 3 + _sbox);
    let _sbox2 = scores.get('sbox');
    _sbox2.print();
    assert(_sbox2 == 3, 'Number is now 6');
}

// fn dict_trait() {
//     let mut d: FeltDict<Nullable<span<felt252>>> = Default::default(); //Figiure out why the Felt252Trait isn't working

//     let mut a = ArrayTrait::new();
//     a.append(8);
//     a.append(9);
//     a.append(10);

//     // Insert it as a `Span`
//     d.insert(0, nullable_from_box(BoxTrait::new(a.span())));
// }
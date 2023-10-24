use debug::PrintTrait;
// use debug::Felt252DictTrait;
use nullable::{nullable_from_box, match_nullable, FromNullableResult};

fn main() {
    dict();
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

// fn dict_trait() {
//     let mut d: FeltDict<Nullable<span<felt252>>> = Default::default(); //Figiure out why the Felt252Trait isn't working

//     let mut a = ArrayTrait::new();
//     a.append(8);
//     a.append(9);
//     a.append(10);

//     // Insert it as a `Span`
//     d.insert(0, nullable_from_box(BoxTrait::new(a.span())));
// }
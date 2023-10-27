use debug::PrintTrait;

trait VecTrait<V, T> {
    fn new() -> V;
    fn get(ref self: V, index: usize) -> Option<T>;
    fn at(ref self: V, index: usize) -> T;
    fn push(ref self: V, value: T) -> ();
    fn set(ref self: V, index: usize, value: T);
    fn len(self:@V) -> usize;

}

struct NullableVec<T> {
    data: Felt252Dict<Nullable<T>>,
    len: usize
}
package assertions

import _c "core:c"

is_any_kindof_int :: proc(val: $T) {
    is_kindof_int(T);
    is_kindof_unsigned_int(T);
}

is_kindof_int :: proc(val: $T) {
    #assert(
        T == int ||
        T == i8 ||
        T == i16 ||
        T == i32 ||
        T == i64 ||
        T == i128 ||
        T == _c.schar ||
        T == _c.short ||
        T == _c.int ||
        T == _c.long ||
        T == _c.longlong
    )
}

is_kindof_uint :: proc(val: $T) {
    #assert(
        T == uint ||
        T == u8 ||
        T == u16 ||
        T == u32 ||
        T == u64 ||
        T == u128 ||
        T == _c.char ||
        T == _c.uchar ||
        T == _c.ushort ||
        T == _c.uint ||
        T == _c.ulong ||
        T == _c.ulonglong
    )
}
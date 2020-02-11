package byteswap

import _assert "../assertions"

IS_LE :: (ODIN_ENDIAN == "little");
IS_BE :: (ODIN_ENDIAN == "big");

byteswap_u16 :: inline proc(num: $T) -> T {
    _assert.is_kindof_uint(num);
    #assert(size_of(T) == 2)
    return cast(T) (((u16(num) >> u16(8)) & u16(0xff)) |
                    ((u16(num) & u16(0xff)) << u16(8)));
}

byteswap_u32 :: inline proc(num: $T) -> T {
    _assert.is_kindof_uint(num);
    #assert(size_of(T) == 4)
    return cast(T) (((u32(num) & u32(0xff000000)) >> u32(24)) |
                    ((u32(num) & u32(0x00ff0000)) >> u32(8))  |
                    ((u32(num) & u32(0x0000ff00)) << u32(8))  |
                    ((u32(num) & u32(0x000000ff)) << u32(24)));
}

byteswap_u64 :: inline proc(num: $T) -> T {
    _assert.is_kindof_uint(num);
    #assert(size_of(T) == 8)
    return cast(T) (((u64(num) & u64(0xff00000000000000)) >> u64(56)) |
                    ((u64(num) & u64(0x00ff000000000000)) >> u64(40)) |
                    ((u64(num) & u64(0x0000ff0000000000)) >> u64(24)) |
                    ((u64(num) & u64(0x000000ff00000000)) >> u64(8))  |
                    ((u64(num) & u64(0x00000000ff000000)) << u64(8))  |
                    ((u64(num) & u64(0x0000000000ff0000)) << u64(24)) |
                    ((u64(num) & u64(0x000000000000ff00)) << u64(40)) |
                    ((u64(num) & u64(0x00000000000000ff)) << u64(56)));
}

byteswap_u128 :: inline proc(num: $T) -> T {
    #assert(size_of(num) == 16)

    /* Untyped integers (literal 0x00, 0x0000 etc) are parsed as 64bit
     * so to use 128bit we have to split it and handle as 2x 64bit
     */

    hi: u128 = u128(byteswap_u64(u64(num)));
    lo: u64 = byteswap_u64(u64(num >> 64));

    return cast(T) (u128(hi << 64) | u128(lo));
}
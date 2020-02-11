package bluetooth

import _c "core:c"
import _bs "../../tools/byteswap"
import _bt "../../tools/bind"

foreign import "system:bluetooth"

BtSecurity :: struct {
    level: u8,
    key_size: u8,
};

BtPower :: struct {
    force_active: u8;
};

BtVoice :: struct {
    setting: u16,
};

BdAddr :: struct #packed {
    b: [6]u8,
};

/* Byte order conversions host order <--> bluetooth order.
 * Fully defined here as the libc definitions are compiler
 * macros.
 */
host_to_bt_u16 :: inline proc(num: _c.short) -> _c.ushort {
    return when _bs.IS_LE ? num : _bs.byteswap_16(num);
}

host_to_bt_u32 :: inline proc(num: _c.long) -> _c.long {
    return when _bs.IS_LE ? num : _bs.byteswap_32(num);
}

host_to_bt_u64 :: inline proc(num: _c.llong) -> _c.llong {
    return when _bs.IS_LE ? num : _bs.byteswap_64(num);
}

bt_to_host_u16 :: inline proc(num: _c.short) -> _c.short {
    return when _bs.IS_LE ? num : _bs.byteswap_16(num);
}

bt_to_host_u32 :: inline proc(num: _c.long) -> _c.long {
    return when _bs.IS_LE ? num : _bs.byteswap_32(num);
}

bt_to_host_u64 :: inline proc(num: _c.llong) -> _c.llong {
    return when _bs.IS_LE ? num : _bs.byteswap_64(num);
}

foreign cbluetooth {
    @(link_name="bt_get_le64")
    _unix_bt_get_le64 :: proc(ptr: rawptr) -> u64 ---;

    @(link_name="bt_get_be64")
    _unix_bt_get_be64 :: proc(ptr: rawptr) -> u32 ---;

    @(link_name="bt_get_le32")
    _unix_bt_get_le32 :: proc(ptr: rawptr) -> u32 ---;

    @(link_name="bt_get_be32")
    _unix_bt_get_be32 :: proc(ptr: rawptr) -> u32 ---;

    @(link_name="bt_get_le16")
    _unix_bt_get_le16 :: proc(ptr: rawptr) -> u16 ---;

    @(link_name="bt_get_be16")
    _unix_bt_get_be16 :: proc(ptr: rawptr) -> u16 ---;

    @(link_name="bt_put_le64")
    _unix_bt_put_le64 :: proc(val: u64, ptr: rawptr) ---;

    @(link_name="bt_put_be64")
    _unix_bt_put_be64 :: proc(val: u64, ptr: rawptr) ---;

    @(link_name="bt_put_le32")
    _unix_bt_put_le32 :: proc(val: u32, ptr: rawptr) ---;

    @(link_name="bt_put_be32")
    _unix_bt_put_be32 :: proc(val: u32, ptr: rawptr) ---;

    @(link_name="bt_put_le16")
    _unix_bt_put_le16 :: proc(val: u16, ptr: rawptr) ---;

    @(link_name="bt_put_be16")
    _unix_bt_put_lb16 :: proc(val: u16, ptr: rawptr) ---;

    @(link_name="bacmp")
    _unix_bacmp :: proc(bd_addr1, bd_addr2: ^BdAddr) -> _c.int ---;

    @(link_name="bacpy")
    _unix_bacpy :: proc(dst, src: ^BdAddr) ---;

    @(link_name="baswap")
    _unix_baswap :: proc(dst, src: ^BdAddr) ---;

    @(link_name="strtoba")
    _unix_strtoba :: proc(str: cstring) -> ^BdAddr ---;

    @(link_name="batostr")
    _unix_batostr :: proc(ba: ^BdAddr) -> cstring ---;

/*
Ignoring these as they offer same functionality as strtoba, batostr

    @(link_name="ba2str")
    @(link_name="str2ba")
*/

    @(link_name="ba2oui")
    _unix_ba2oui :: proc(ba: ^BdAddr, oui: cstring) -> _c.int ---;

    @(link_name="bachk")
    _unix_bachk :: proc(str: cstring) -> _c.int ---;

/*
Ignoring these for now unless it turns out we explicitly need them

    @(link_name="baprintf")
    @(link_name="bafprintf")
    @(link_name="basprintf")
    @(link_name="basnprintf")
    @(link_name="bt_malloc")
    @(link_name="bt_free")
*/

    @(link_name="bt_compidtostr")
    _unix_bt_compidtostr :: proc(id: _c.int) -> _c.int ---;

    @(link_name="")
    @(link_name="")
    @(link_name="")
    @(link_name="")
    @(link_name="")
    @(link_name="")
    @(link_name="")
    @(link_name="")
    @(link_name="")

}
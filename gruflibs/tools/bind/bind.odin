package bind

import "core:os"

get_c_errno :: inline proc(is_ok: bool) -> os.Errno {
    return is_ok ? os.ERROR_NONE : os.Errno(os.get_last_error());
}

recast_array :: inline proc(array: [$N]$T1, $T2: typeid) -> [N]T2 {
    ret: [N]T2;
    for i := 0; i < N; i += 1 {
        ret[i] = cast(T2) array[i];
    }
    return ret;
}
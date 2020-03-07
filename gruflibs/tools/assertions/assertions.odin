package assertions

import i "core:intrinsics"
import fmt "core:fmt"

ASSERTIONS_ENABLED :: true;

is_equal :: inline proc "contextless" (val1, val2: $T, loc := #caller_location) {
    when ASSERTIONS_ENABLED {
        fmt.assertf(
            condition = val1 == val2,
            fmt       = "'%v' is not equal to '%v'!",
            args      = []any{ val1, val2 },
            loc       = loc
        );
    }
}

is_not_equal :: inline proc "contextless" (val1, val2: $T, loc := #caller_location) {
    when ASSERTIONS_ENABLED {
        fmt.assertf(
            condition = val1 != val2,
            fmt       = "'%v' is not different to '%v'!",
            args      = []any{ val1, val2 },
            loc       = loc
        );
    }
}

is_any_kindof_int :: inline proc "contextless" (val: $T, loc := #caller_location) {
    when ASSERTIONS_ENABLED {
        fmt.assertf(
            condition = i.type_is_integer(T),
            fmt       = "'%v' is not any kind of integer!",
            args      = []any{ typeid_of(T) },
            loc       = loc
        );
    }
}

is_kindof_int :: inline proc "contextless" (val: $T, loc := #caller_location) {
    when ASSERTIONS_ENABLED {
        fmt.assertf(
            condition = i.type_is_integer(T) && !i.type_is_unsigned(T),
            fmt       = "'%v' is not integer!",
            args      = []any{ typeid_of(T) },
            loc       = loc
        );
    }
}

is_kindof_uint :: inline proc "contextless" (val: $T, loc := #caller_location) {
    when ASSERTIONS_ENABLED {
        fmt.assertf(
            condition = i.type_is_integer(T) && i.type_is_unsigned(T),
            fmt       = "'%v' is not unsigned integer!",
            args      = []any{ typeid_of(T) },
            loc       = loc
        );
    }
}
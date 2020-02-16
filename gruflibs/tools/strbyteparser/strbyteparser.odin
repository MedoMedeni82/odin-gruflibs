package strbyteparser

import "core:fmt"
import "core:os"

MULTI_KIB :: 1;
MULTI_MIB :: 2;
MULTI_GIB :: 3;
MULTI_TIB :: 4;
MULTI_PIB :: 5;
MULTI_KB  :: 6;
MULTI_MB  :: 7;
MULTI_GB  :: 8;
MULTI_TB  :: 9;
MULTI_PB  :: 10;

VAL_KIB :: 1024;
VAL_MIB :: VAL_KIB * 1024;
VAL_GIB :: VAL_MIB * 1024;
VAL_TIB :: VAL_GIB * 1024;
VAL_PIB :: VAL_TIB * 1024;
VAL_KB  :: 1000;
VAL_MB  :: VAL_KB * 1000;
VAL_GB  :: VAL_MB * 1000;
VAL_TB  :: VAL_GB * 1000;
VAL_PB  :: VAL_TB * 1000;

parse :: proc(str: string) -> (i64, bool) {
    i, multi := __parse_multi(str);
    if i == -1 {
        // Invalid multiplier
        return -1, false;
    } else if i == 0 {
        // No multiplier found
        return __parse_int_multi(1, str);
    } else {
        // Parse string int * multi
        return __parse_int_multi(multi, str[:len(str)-i]);
    }
}

__parse_multi :: proc(str: string) -> (int, int) {
    length := len(str);
    if length == 0 do return -1, 0;
    switch str[length-1] {
        case '0'..'9': return 0, 1;
        case 'B':
            // Could be KiB, KB
            if str[length-2] == 'i' {
                switch str[length-3] {
                    case '0'..'9': return 2, 1;
                    case 'K': return 3, MULTI_KIB;
                    case 'M': return 3, MULTI_MIB;
                    case 'G': return 3, MULTI_GIB;
                    case 'T': return 3, MULTI_TIB;
                    case 'P': return 3, MULTI_PIB;
                    case: return -1, 0;
                }
            } else {
                switch str[length-2] {
                    case '0'..'9': return 1, 1;
                    case 'K': return 2, MULTI_KB;
                    case 'M': return 2, MULTI_MB;
                    case 'G': return 2, MULTI_GB;
                    case 'T': return 2, MULTI_TB;
                    case 'P': return 2, MULTI_PB;
                    case: return -1, 0;
                }
            }
        case 'K': return 1, MULTI_KIB;
        case 'M': return 1, MULTI_MIB;
        case 'G': return 1, MULTI_GIB;
        case 'T': return 1, MULTI_TIB;
        case 'P': return 1, MULTI_PIB;
        case: return -1, 0;
    }
}

__parse_int_multi :: proc(multi: int, str: string) -> (i64, bool) {
    val, result := __parse_int(str);
    if !result do return 0, false;
    switch multi {
        case MULTI_KIB: return VAL_KIB*val, true;
        case MULTI_MIB: return VAL_MIB*val, true;
        case MULTI_GIB: return VAL_GIB*val, true;
        case MULTI_TIB: return VAL_TIB*val, true;
        case MULTI_PIB: return VAL_PIB*val, true;
        case MULTI_KB: return VAL_KB*val, true;
        case MULTI_MB: return VAL_MB*val, true;
        case MULTI_GB: return VAL_GB*val, true;
        case MULTI_TB: return VAL_TB*val, true;
        case MULTI_PB: return VAL_PB*val, true;
        case: return val, true;
    }
}

__ten_power :: proc(power: int) -> i64 {
    val := i64(1);
    for i := 0; i < power; i += 1 {
        val = val * 10;
    }
    return val;
}

__parse_int :: proc(str: string) -> (i64, bool) {
    val := i64(0);
    is_neg := i64(str[0] == '-' ? -1 : 1);
    for x, i in str {
        switch x {
            case '0'..'9': val += __ten_power(i)*i64(x-48);
            case: return 0, false;
        }
    }

    return is_neg*val, true;
}
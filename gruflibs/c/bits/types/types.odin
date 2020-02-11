package types

import _c "core:c"

time_t      :: distinct _c.long;
socklen_t   :: distinct _c.int;
sa_family_t :: distinct _c.ushort;

Iovec :: struct {
    iov_base: rawptr,
    iov_len: _c.size_t,
};

TimeSpec :: struct {
    tv_sec: time_t,
    tv_nsec: _c.long,
};
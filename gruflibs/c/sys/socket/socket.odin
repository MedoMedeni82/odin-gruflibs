/*
 * Have constants where required in C? (e.g. const bufs)
 * We could create copies of supplied variables to ensure that
 * underling data passed _will_ be constant
 */

package socket

import "core:os"
import _c "core:c"
import _t "../../bits/types"
import _bt "../../../tools/bind"

foreign import csocket "system:c"

SockAddr :: struct {
    sa_family: _t.sa_family_t,
    sa_data: [14]u8,
};

MsgHdr :: struct {
    msg_name: rawptr,
    msg_namelen: int,

    msg_iov: _t.Iovec,
    msg_iovlen: _c.size_t,

    msg_control: rawptr,
    msg_controllen: _c.size_t,

    msg_flags: int,
};

MMsgHdr :: struct {
    msg_hdr: MsgHdr,
    msg_len: uint,
};

foreign csocket {
    @(link_name="socket")
    _unix_socket :: proc(domain, type, protocol: _c.int) -> _c.int ---;

    @(link_name="socketpair")
    _unix_socketpair :: proc(domain, type, protocol: _c.int, fds: [2]_c.int) -> _c.int ---;

    @(link_name="bind")
    _unix_bind :: proc(fd: _c.int, addr: ^SockAddr, length: _t.socklen_t) -> _c.int ---;

    @(link_name="getsockname")
    _unix_getsockname :: proc(fd: _c.int, addr: ^SockAddr, length: _t.socklen_t /*restrict?*/) -> _c.int ---;

    @(link_name="connect")
    _unix_connect :: proc(fd: _c.int, addr: ^SockAddr, length: ^_t.socklen_t) -> _c.int ---;

    @(link_name="getpeername")
    _unix_getpeername :: proc(fd: _c.int, addr: ^SockAddr, length: ^_t.socklen_t) -> _c.int ---;

    @(link_name="send")
    _unix_send :: proc(fd: _c.int, buf: rawptr, n: _c.size_t, flags: _c.int) -> _c.ssize_t ---;

    @(link_name="recv")
    _unix_recv :: proc(fd: _c.int, buf: rawptr, n: _c.size_t, flags: _c.int) -> _c.ssize_t ---;

    @(link_name="sendto")
    _unix_sendto :: proc(fd: _c.int, buf: rawptr, n: _c.size_t, flags: _c.int, addr: ^SockAddr, addr_len: _t.socklen_t) -> _c.ssize_t ---;

    @(link_name="recvfrom")
    _unix_recvfrom :: proc(fd: _c.int, buf: rawptr, n: _c.size_t, flags: _c.int, addr: ^SockAddr, addr_len: ^_t.socklen_t) -> _c.ssize_t ---;

    @(link_name="sendmsg")
    _unix_sendmsg :: proc(fd: _c.int, message: ^MsgHdr, flags: _c.int) -> _c.ssize_t ---;

    @(link_name="sendmmsg")
    _unix_sendmmsg :: proc(fd: _c.int, vmessages: []MMsgHdr, vlen: _c.uint, flags: _c.int) -> _c.int ---;

    @(link_name="recvmsg")
    _unix_recvmsg :: proc(fd: _c.int, message: ^MsgHdr, flags: _c.int) -> _c.ssize_t ---;

    @(link_name="recvmmsg")
    _unix_recvmmsg :: proc(fd: _c.int, vmessages: []MMsgHdr, vlen: _c.uint, tmo: ^_t.TimeSpec) -> _c.int ---;

    @(link_name="getsockopt")
    _unix_getsockopt :: proc(fd, level, optname: _c.int, optval: rawptr /*restrict?*/, optlen: ^_t.socklen_t /*restrict?*/) -> _c.int ---;

    @(link_name="setsockopt")
    _unix_setsockopt :: proc(fd, level, optname: _c.int, optval: rawptr, optlen: _t.socklen_t) -> _c.int ---;

    @(link_name="listen")
    _unix_listen :: proc(fd, n: _c.int) -> _c.int ---;

    @(link_name="accept")
    _unix_accept :: proc(fd: _c.int, addr: ^SockAddr, addr_len: ^_t.socklen_t /*restrict?*/) -> _c.int ---;

    @(link_name="accept4")
    _unix_accept4 :: proc(fd: _c.int, addr: ^SockAddr, addr_len: ^_t.socklen_t /*restrict?*/, flags: _c.int) -> _c.int ---;

    @(link_name="shutdown")
    _unix_shutdown :: proc(fd, how: _c.int) -> _c.int ---;

    @(link_name="sockatmark")
    _unix_sockatmark :: proc(fd: _c.int) -> _c.int ---;

    @(link_name="isfdtype")
    _unix_isfdtype :: proc(fd, fdtype: _c.int) -> _c.int ---;
}

socket :: proc(domain, type, protocol: int) -> (os.Handle, os.Errno) {
    fd := _unix_socket(_c.int(domain), _c.int(type), _c.int(protocol));
    return os.Handle(fd), _bt.get_c_errno(fd != -1);
}

socketpair :: proc(domain, type, protocol: int, fds: [2]os.Handle) -> (os.Handle, os.Errno) {
    fd := _unix_socketpair(_c.int(domain), _c.int(type), _c.int(protocol), _bt.recast_array(fds, _c.int));
    return os.Handle(fd), _bt.get_c_errno(fd != -1);
}

bind :: proc(fd: os.Handle, addr: ^SockAddr, length: int) -> os.Errno {
    return _bt.get_c_errno(_unix_bind(_c.int(fd), addr, _t.socklen_t(length)) != -1);
}

getsockname :: proc(fd: os.Handle, addr: ^SockAddr, length: int) -> os.Errno {
    return _bt.get_c_errno(_unix_getsockname(_c.int(fd), addr, _t.socklen_t(length)) != -1);
}

connect :: proc(fd: os.Handle, addr: ^SockAddr, length: ^int) -> os.Errno {
    return _bt.get_c_errno(_unix_connect(_c.int(fd), addr, cast(^_t.socklen_t) length) != -1);
}

getpeername :: proc(fd: os.Handle, addr: ^SockAddr, length: ^int) -> os.Errno {
    return _bt.get_c_errno(_unix_getpeername(_c.int(fd), addr, cast(^_t.socklen_t) length) != -1);
}

send :: proc(fd: os.Handle, buf: rawptr, n: _c.size_t, flags: int) -> (_c.ssize_t, os.Errno) {
    sent := _unix_send(_c.int(fd), buf, n, _c.int(flags));
    return sent, _bt.get_c_errno(sent != -1);
}

recv :: proc(fd: os.Handle, buf: rawptr, n: _c.size_t, flags: int) -> (_c.ssize_t, os.Errno) {
    recvd := _unix_recv(_c.int(fd), buf, n, _c.int(flags));
    return recvd, _bt.get_c_errno(recvd != -1);
}

sendto :: proc(fd: os.Handle, buf: rawptr, n: _c.size_t, flags: int, addr: ^SockAddr, addr_len: int) -> (_c.ssize_t, os.Errno) {
    sent := _unix_sendto(_c.int(fd), buf, n, _c.int(flags), addr, _t.socklen_t(addr_len));
    return sent, _bt.get_c_errno(sent != -1);
}

recvfrom :: proc(fd: os.Handle, buf: rawptr, n: _c.size_t, flags: int, addr: ^SockAddr, addr_len: ^int) -> (_c.ssize_t, os.Errno) {
    recvd := _unix_recvfrom(_c.int(fd), buf, n, _c.int(flags), addr, cast(^_t.socklen_t) addr_len);
    return recvd, _bt.get_c_errno(recvd != -1);
}

sendmsg :: proc(fd: os.Handle, message: ^MsgHdr, flags: int) -> (_c.ssize_t, os.Errno) {
    sent := _unix_sendmsg(_c.int(fd), message, _c.int(flags));
    return sent, _bt.get_c_errno(sent != -1);
}

sendmmsg :: proc(fd: os.Handle, vmessages :[]MMsgHdr, flags: int) -> (int, os.Errno) {
    sent := _unix_sendmmsg(_c.int(fd), vmessages, _c.uint(len(vmessages)), _c.int(flags));
    return int(sent), _bt.get_c_errno(sent != -1);
}

recvmsg :: proc(fd: os.Handle, message: ^MsgHdr, flags: int) -> (_c.ssize_t, os.Errno) {
    recvd := _unix_recvmsg(_c.int(fd), message, _c.int(flags));
    return recvd, _bt.get_c_errno(recvd != -1);
}

recvmmsg :: proc(fd: os.Handle, vmessages: []MMsgHdr, tmo: ^_t.TimeSpec) -> (int, os.Errno) {
    recvd := _unix_recvmmsg(_c.int(fd), vmessages, _c.uint(len(vmessages)), tmo);
    return int(recvd), _bt.get_c_errno(recvd != -1);
}

getsockopt :: proc(fd: os.Handle, level, optname: int, optval: rawptr, optlen: ^int) -> os.Errno {
    return _bt.get_c_errno(_unix_getsockopt(_c.int(fd), _c.int(level), _c.int(optname), optval, cast(^_t.socklen_t) optlen) != -1);
}

setsockopt :: proc(fd: os.Handle, level, optname: int, $optval: rawptr, optlen: int) -> os.Errno {
    return _bt.get_c_errno(_unix_setsockopt(_c.int(fd), _c.int(level), _c.int(optname), optval, _t.socklen_t(optlen)) != -1);
}

listen :: proc(fd: os.Handle, n: int) -> os.Errno {
    return _bt.get_c_errno(_unix_listen(_c.int(fd), _c.int(n)) != -1);
}

accept :: proc(fd: os.Handle, addr: ^SockAddr, addr_len: ^int) -> (os.Handle, os.Errno) {
    new_fd := _unix_accept(_c.int(fd), addr, cast(^_t.socklen_t) addr_len);
    return os.Handle(new_fd), _bt.get_c_errno(new_fd != -1);
}

accept4 :: proc(fd: os.Handle, addr: ^SockAddr, addr_len: ^int, flags: int) -> (os.Handle, os.Errno) {
    new_fd := _unix_accept4(_c.int(fd), addr, cast(^_t.socklen_t) addr_len, _c.int(flags));
    return os.Handle(new_fd), _bt.get_c_errno(new_fd != -1);
}

shutdown :: proc(fd: os.Handle, how: int) -> os.Errno {
    return _bt.get_c_errno(_unix_shutdown(_c.int(fd), _c.int(how)) != -1);
}

sockatmark :: proc(fd: os.Handle) -> os.Errno {
    return _bt.get_c_errno(_unix_sockatmark(_c.int(fd)) != -1);
}

isfdtype :: proc(fd: os.Handle, fdtype: int) -> os.Errno {
    return _bt.get_c_errno(_unix_isfdtype(_c.int(fd), _c.int(fdtype)) != -1);
}
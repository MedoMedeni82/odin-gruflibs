package dirtool

import "core:os"
import "core:strings"

foreign import libc "system:c"

Dir :: rawptr; // Unix's opaquely typed *DIR (typedef'd *__dirstream)

Dirent :: struct {
	ino_t     : u64,
	off_t     : i64,
	d_reclen    : u16,
	d_type      : u8,
	d_name      : [256]u8,
};

foreign libc {
	@(link_name="opendir")          _unix_opendir       :: proc(path: cstring) -> Dir ---;
	@(link_name="fdopendir")        _unix_fdopendir     :: proc(fd: os.Handle) -> Dir ---;
	@(link_name="dirfd")            _unix_dirfd         :: proc(dir: Dir) -> int ---;
	@(link_name="closedir")         _unix_closedir      :: proc(dir: Dir) -> int ---;
	@(link_name="readdir")          _unix_readdir       :: proc(dir: Dir) -> ^Dirent ---;
	@(link_name="alphasort")        _unix_alphasort     :: proc(d1: ^^Dirent, d2: ^^Dirent) -> int ---;
	@(link_name="rewinddir")        _unix_rewinddir     :: proc(dir: Dir) ---;
	@(link_name="scandir")          _unix_scandir       :: proc(path: cstring, namelist: ^^^Dirent, sel: ^proc(dir: ^Dirent) -> int, compar: ^proc(d1: ^^Dirent, d2: ^^Dirent) -> int) -> int ---;
	@(link_name="seekdir")          _unix_seekdir       :: proc(dir: Dir, loc: i64) ---;
	@(link_name="telldir")          _unix_telldir       :: proc(dir: Dir) -> i64 ---;
}

opendir :: proc(path: string) -> (Dir, os.Errno) {
	cstr := strings.clone_to_cstring(path);
	defer delete(cstr);
	dir := _unix_opendir(cstr);
	return dir, dir == nil ? os.Errno(os.get_last_error()) : os.ERROR_NONE;
}

fdopendir :: proc(fd: os.Handle) -> (Dir, os.Errno) {
	dir := _unix_fdopendir(fd);
	return dir, dir == nil ? os.Errno(os.get_last_error()) : os.ERROR_NONE;
}

dirfd :: proc(dir: Dir) -> (os.Handle, os.Errno) {
	unix_fd := _unix_dirfd(dir);
	return os.Handle(unix_fd), unix_fd == -1 ? os.Errno(os.get_last_error()) : os.ERROR_NONE;
}

closedir :: proc(dir: Dir) -> os.Errno {
	result := _unix_closedir(dir);
	return result == -1 ? os.Errno(os.get_last_error()) : os.ERROR_NONE;
}

readdir :: proc(dir: Dir) -> (^Dirent, os.Errno) {
	dirent := _unix_readdir(dir); // don't need to nil check as this is a valid return
	return dirent, os.Errno(os.get_last_error());
}

alphasort :: proc(d1: ^^Dirent, d2: ^^Dirent) -> (int, os.Errno) {
	return _unix_alphasort(d1, d2), os.Errno(os.get_last_error());
}

rewinddir :: proc(dir: Dir) -> os.Errno {
	_unix_rewinddir(dir);
	return os.Errno(os.get_last_error());
}

scandir :: proc(path: string, namelist: ^^^Dirent,
                select: ^proc "c" (dir: ^Dirent) -> int,
                compare: ^proc "c" (d1: ^^Dirent, d2: ^^Dirent) -> int) -> (int, os.Errno) {
	cstr := strings.clone_to_cstring(path);
	defer delete(cstr);
	result := _unix_scandir(cstr, namelist, select, compare);
	return result, result == -1 ? os.Errno(os.get_last_error()) : os.ERROR_NONE;
}

seekdir :: proc(dir: Dir, loc: i64) -> os.Errno {
	_unix_seekdir(dir, loc);
	return os.Errno(os.get_last_error());
}

telldir :: proc(dir: Dir) -> (i64, os.Errno) {
	loc := _unix_telldir(dir);
	return loc, loc == -1 ? os.Errno(os.get_last_error()) : os.ERROR_NONE;
}
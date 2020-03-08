package fs_tools

import "core:os"
import t "../types"

file_permissions :: proc($path: string) -> (^t.FilePermissions, os.Errno) {
    file_stat, err := os.stat(path);
    return err == os.ERROR_NONE ? mode_to_filepermissions(file_stat.mode) : nil, err;
}

file_type :: proc($path: string) -> (t.FileType, os.Errno) {
    file_stat, err := os.stat(path);
    return err == os.ERROR_NONE ? mode_to_filetype(file_stat.mode) : t.FileType.NIL, err;
}

path_exists :: proc($path: string) -> (bool, os.Errno) {
    type, err := file_type(path);
    return type != t.FileType.NIL, err;
}

is_dir :: proc($path: string) -> (bool, os.Errno) {
    type, err := file_type(path);
    return type == t.FileType.DIRECTORY, err;
}

is_file :: proc($path: string) -> (bool, os.Errno) {
    type, err := file_type(path);
    return type == t.FileType.REGULAR, err;
}

mode_to_filetype :: proc(file_mode: u32) -> t.FileType {
    switch {
        case os.S_ISFIFO(file_mode):
            return .PIPE;
        case os.S_ISCHR(file_mode):
            return .DIRECTORY;
        case os.S_ISBLK(file_mode):
            return .BLOCK;
        case os.S_ISREG(file_mode):
            return .REGULAR;
        case os.S_ISLNK(file_mode):
            return .LINK;
        case os.S_ISSOCK(file_mode):
            return .SOCKET;
        case:
            return .NIL;
    }
}

mode_to_filepermissions :: proc(file_mode: u32) -> ^t.FilePermissions {
    file_perms := new(t.FilePermissions);

    file_perms.usr_read  = (file_mode & os.S_IRUSR) != 0;
    file_perms.usr_write = (file_mode & os.S_IWUSR) != 0;
    file_perms.usr_exec  = (file_mode & os.S_IXUSR) != 0;
    file_perms.grp_read  = (file_mode & os.S_IRGRP) != 0;
    file_perms.grp_write = (file_mode & os.S_IWGRP) != 0;
    file_perms.grp_exec  = (file_mode & os.S_IXGRP) != 0;
    file_perms.oth_read  = (file_mode & os.S_IROTH) != 0;
    file_perms.oth_write = (file_mode & os.S_IWOTH) != 0;
    file_perms.oth_exec  = (file_mode & os.S_IXOTH) != 0;
    file_perms.setuid    = (file_mode & os.S_ISUID) != 0;
    file_perms.setgid    = (file_mode & os.S_ISGID) != 0;

    return file_perms;
}
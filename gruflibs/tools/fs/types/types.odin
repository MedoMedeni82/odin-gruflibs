package fs_types

FileType :: enum {
    PIPE,       // FIFO
    CHARACTER,  // character device
    DIRECTORY,  // directory
    BLOCK,      // block device
    REGULAR,    // regular file
    LINK,       // symbolic link
    SOCKET,     // unix socket
    NIL,        // error handling
}

FilePermissions :: struct #packed {
    usr_read    : bool, // is <user> readable
    usr_write   : bool, // is <user> writeable
    usr_exec    : bool, // is <user> executable
    grp_read    : bool, // is <group> readable
    grp_write   : bool, // is <group> writeable
    grp_exec    : bool, // is <group> executable
    oth_read    : bool, // readable by others
    oth_write   : bool, // writeable by others
    oth_exec    : bool, // executable by others
    setuid      : bool, // open as user owner id
    setgid      : bool, // open as group owner id
}


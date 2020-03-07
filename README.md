# gruflibs

A selection of my own Odin libraries, whether that be Odin exclusive or C bindings (until the Odin
standard library is completed this C bindings folder is likely to get quite large...).

Just copy gruflibs/ to your Odin shared library directory and you're good to go.

gruflibs/c/ -- is unsurprisingly my library of C bindings. I'm trying to *somewhat* copy the same
directory structure of libc under Linux, though things like gruflibs/c/bits/types/ are just my catch-alls
for type definitions I need, but don't necessarily want the entire source header's worth of type and function
defitions for.

Everything should be ready to go EXCEPT gruflibs/c/bluetooth which is a work in progress, and gruflibs/c/dirent
which I copied over from an old project but it needs updating and reformatting for this new repository.

# libraries

- gruflibs/c/bluetooth -- Linux bluetooth library (bluez) (WIP)

- gruflibs/c/dirent -- Linux dirent library (WIP)

- gruflibs/c/sys/socket -- libc sockets, might be missing one or two things. Should be functional!

- gruflibs/c/bits/types -- catch-all as mentioned above

- gruflibs/tools/byteswap -- byteswap between big / little endian

- gruflibs/tools/assertions -- processes containing nothing but helpful (runtime) assertion statements, can be disabled by editing the `ASSERTIONS_ENABLED` constant in the source file. This disables the code being compiled in these functions via use of `when` statements, check compiled file sizes with value true/false and you can see yourself

- gruflibs/tools/bind -- helpful processes for when making C bindings

- gruflibs/tools/strbyteparser -- parse strings e.g. '100MB', '100G', '100KiB' into i64 byte count

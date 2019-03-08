# Dragon in the Dungeon
*Dragon in the Dungeon* is a shameless rip-off of [Dungeons and Dragons Computer Fantasy Game][1] by Mattel Electronics.

The basic idea is to remake the D&D Computer Fantasy Game as a text-adventure for a generic 65C02-based system. This generic system is assumed to have a [65C02][3] as CPU and a simple I/O system with a [6551 Asynchronous Communications Interface Adapter][2] chip at its center.

**Note**: The code in this repository will *not* run on a (NMOS) 6502, you'll need a 65C02. The 65C02 offers some additional opcodes this code makes use of. Especially the stack operations `phx`, `phy`, `plx`, `ply`, and the new branch instruction `bra`.

## Building
You'll need the excellent [cc65 toolchain][3] to build the code in this repository. You'll find a makefile in this repository. Execute:

```
$ git clone LIIIINK
$ cd
$ make
```

This will create a folder called `build`. In `build` you'll find another directory called `release`, in it is the final binary file called `ditd.rom`. This is a standard "raw" binary file. If you wish to burn it with onto a E(E)PROM, you'll need to convert it to a format your programmer can handle first.

You can also build a file with debug symbols using `make debug`, this ROM will reside in the directory `build/debug`.

## Configuring the Build

[1]:
[2]:
[3]:

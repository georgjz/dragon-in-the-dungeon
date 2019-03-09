# Dragon in the Dungeon
*Dragon in the Dungeon* is a shameless rip-off of [Dungeons and Dragons Computer Fantasy Game][1] by Mattel Electronics.

The basic idea is to remake the D&D Computer Fantasy Game as a text-adventure for a generic 65C02-based system. This generic system is assumed to have a [65C02][4] as CPU and a simple I/O system with a [6551 Asynchronous Communications Interface Adapter][2] chip at its center.

**Note**: As of now, the code in this repository will *not* run on a (NMOS) 6502, you'll need a 65C02. The 65C02 offers some additional opcodes this code makes use of. Especially the stack operations `phx`, `phy`, `plx`, `ply`, and the new branch instruction `bra`.

I'll add a more detail documentation once the basic game is running. For now, check the code comments in the files.

This code makes use of a subroutine launcher, check the [NESDev Wiki][5] for an explanation how this works.

## Building
You'll need the excellent [cc65 toolchain][3] to build the code in this repository. You'll find a makefile in this repository. Execute:

```
$ git clone https://github.com/georgjz/dragon-in-the-dungeon.git
$ cd
$ make
```

This will create a folder called `build`. In `build` you'll find another directory called `release`, in it is the final binary file called `ditd.rom`. This is a standard "raw" binary file. If you wish to burn it with onto a E(E)PROM, you'll need to convert it to a format your programmer can handle first.

You can also build a file with debug symbols using `make debug`, this ROM will reside in the directory `build/debug`.

## Configuring the Build
To make the game run on your system, there's two files you need to modify: `MemoryMap.cfg` and `src/MemoryMap.inc`. Make sure the addresses in there match your systems memory map. Specifically, the ROM and RAM size and starting addresses, and the addresses mapped to the 6551.

## Playing the Game
Right now, the game isn't finished. Disappointing, I know. But there is a simple loop that'll detect an input buffer overflow (the buffer can hold no more than 80 characters) and when you press `Enter` the game will acknowledge that the parser has been invoked.


[1]: https://en.wikipedia.org/wiki/Dungeons_%26_Dragons_Computer_Fantasy_Game
[2]: http://www.westerndesigncenter.com/wdc/w65c51n-chip.cfm
[3]: https://github.com/cc65/cc65
[4]: https://en.wikipedia.org/wiki/WDC_65C02
[5]: https://wiki.nesdev.com/w/index.php/RTS_Trick

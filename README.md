# minivmac
Clone of Mini vMac 36.04 with support for RaSCSI style of hard drives

This is a clone from https://www.gryphel.com/c/minivmac/download.html with a added patch from https://github.com/erichelgeson/minivmac/blob/27bd31e213197f20b653bb54495c782310faab83/src/SONYEMDV.c#L295 for support of RaSCSI-style volumes.


# How to build:

## The build system of minivmac is byzantine

First, you need to build the build tool, using:

``gcc setup/tool.c -o setup_t``

Second, using the build tool, you can create a build script for your favorite flavor of mac:

``./setup_t -m SE -mem 4M -t lx64 -hres 1024 -vres 768 -speed a -magnify 0 > setup.sh``

Third you can run this setup file

``. setup.sh``

And them you can make the result:

``make``

This will create a binary in the current directory:

./minivmac

## Typical build session

```
fred@Fred-Linux:~/Development/minivmac$ gcc setup/tool.c -o setup_t
fred@Fred-Linux:~/Development/minivmac$ ./setup_t -m SE -mem 4M -t lx64 -hres 1024 -vres 768 -speed a -magnify 0 > setup.sh
fred@Fred-Linux:~/Development/minivmac$ . setup.sh
fred@Fred-Linux:~/Development/minivmac$ make
gcc "src/MINEM68K.c" -o "bld/MINEM68K.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/OSGLUXWN.c" -o "bld/OSGLUXWN.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/GLOBGLUE.c" -o "bld/GLOBGLUE.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/M68KITAB.c" -o "bld/M68KITAB.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/VIAEMDEV.c" -o "bld/VIAEMDEV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/IWMEMDEV.c" -o "bld/IWMEMDEV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/SCCEMDEV.c" -o "bld/SCCEMDEV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/RTCEMDEV.c" -o "bld/RTCEMDEV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/ROMEMDEV.c" -o "bld/ROMEMDEV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/SCSIEMDV.c" -o "bld/SCSIEMDV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/SONYEMDV.c" -o "bld/SONYEMDV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/SCRNEMDV.c" -o "bld/SCRNEMDV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/MOUSEMDV.c" -o "bld/MOUSEMDV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/ADBEMDEV.c" -o "bld/ADBEMDEV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/SNDEMDEV.c" -o "bld/SNDEMDEV.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc "src/PROGMAIN.c" -o "bld/PROGMAIN.o" -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/ -Os
gcc \
	-o "minivmac" \
	bld/MINEM68K.o bld/OSGLUXWN.o bld/GLOBGLUE.o bld/M68KITAB.o bld/VIAEMDEV.o bld/IWMEMDEV.o bld/SCCEMDEV.o bld/RTCEMDEV.o bld/ROMEMDEV.o bld/SCSIEMDV.o bld/SONYEMDV.o bld/SCRNEMDV.o bld/MOUSEMDV.o bld/ADBEMDEV.o bld/SNDEMDEV.o bld/PROGMAIN.o  -ldl -L/usr/X11R6/lib -lX11
strip --strip-unneeded "minivmac"
fred@Fred-Linux:~/Development/minivmac$ 
```

In general, I use shell scripts with my favorite variations:

## A mac 128k
./setup_t -iid 1 -m 128K -mem 128K -t lx64 -hres 512 -vres 342 -speed a -magnify 0 > setup.sh && . setup.sh && make && ./minivmac

## A mac 512Ke
./setup_t -m 512Ke -mem 512K -t lx64 -hres 512 -vres 342 -speed a -magnify 0 > setup.sh && . setup.sh && make && ./minivmac

## A Mac plus 1Mb
./setup_t -m Plus -mem 1M -t lx64 -hres 512 -vres 342 -speed a -magnify 1 > setup.sh && . setup.sh && make && ./minivmac

## A Mac Plus 4Mb
./setup_t -m Plus -mem 4M -t lx64 -hres 512 -vres 342 -speed a -magnify 1 > setup.sh && . setup.sh && make && ./minivmac

## A mac II, monochrome
./setup_t -iid 1 -fullscreen 1 -magnify 1 -bg 1 -t lx64 -mem 8M -hres 1280 -vres 800 -depth 0 -speed a -m II -sound 1 > setup.sh && . setup.sh && make && ./minivmac

## A mac SE (with a larger screen)
./setup_t -m SE -mem 4M -t lx64 -hres 640 -vres 480 -speed a -magnify 0 > setup.sh && . setup.sh && make && ./minivmac

## An SE/30
./setup_t -bg 1 -t lx64 -mem 8M -hres 512 -vres 342 -depth 0 -speed a -m II -magnify 0 > setup.sh && . setup.sh && make && ./minivmac

See https://www.gryphel.com/c/minivmac/options.html for the list of options.

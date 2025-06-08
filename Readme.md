## TCL interface to linux-gpib library

from ROTA group

#### Options:
*  -timeout
*  -eot
*  -secondary
*  -eos
*  -bufferlen
*  -address
*  -board
*  -trimleft
*  -trimright
*  -readymask
*  -waitready

#### Commands:

*  read
*  write
*  cmd_read
*  remote_enable
*  sleep
*  configure
*  cget
*  poll
*  ready
*  waitready
*  cmd_wait_read
*  clear
*  go_to_local
*  trigger
*  write_list
*  bus_command
*  waitcond

---
## Usage

```tcl
package require GpibLib

## open a GPIB device:
set dev [gpib_device #auto -board 0 -address 9 -trimright \n -readymask 16]

## print some device parameters:
puts "buffer length: [$dev cget -bufferlen]"
puts "trim left: |[$dev cget -trimleft]|"

$dev remote_enable
$dev write *STB?
puts "ready: [$dev ready]"
$dev waitready
puts "poll: [$dev poll] [$dev poll 16] [$dev poll 12]"
puts "ready: [$dev ready]"
puts [$dev read]
puts "ready: [$dev ready]"

$dev configure -trimleft + -trimright ""
puts [$dev cmd_read *STB?]
puts "trim left: |[$dev cget -trimleft]|"
puts "timeout: [$dev cget -timeout]"

$dev configure -trimright \n\r -waitready {1 1}
puts [$dev cmd_wait_read system:date?]

after idle {puts "I am async"}
#after 500 [subst {gpib_device delete $dev; puts "I am bad async"}].

$dev configure -timeout 0.1
puts "start wait"
$dev sleep 1
puts "end wait"
puts "timeout: [$dev cget -timeout]"

puts "go to local"
$dev go_to_local
puts "check it!"
after 3000

## delete device
gpib_device delete $dev
```

---
## Building

#### basic build

```
tcl-gpib
make
make install tcldatadir=/usr/share/tcl tcllibdir=/usr/lib64/tcl
```

#### building Altlinux package

Spec file and configuration for `gear` is available. If the system is configured
correctly, then `gear -ba` should be enough to build the rpm package.

#### building Debian/Ubuntu package

Files for building deb package are located in `debian` folder. Use
script `alt2deb_build` from https://github.com/slazav/alt2deb for
building the package (not tested).


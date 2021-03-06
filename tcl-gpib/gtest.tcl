#!/usr/bin/tclsh

load ./libgpib.so

set dev [gpib_device #auto -board 0 -address 9 -trimright \n -readymask 16]
puts $dev

puts "buffer length: [$dev cget -bufferlen]"
puts "trim left: |[$dev cget -trimleft]|"

$dev remote_enable
$dev write *STB?
puts "ready: [$dev ready]"
#$dev sleep 0.1
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
#after 500 [subst {gpib_device delete $dev; puts "I am bad async"}] 

$dev configure -timeout 0.1
puts "start wait"
$dev sleep 1
puts "end wait"
puts "timeout: [$dev cget -timeout]"

#gpib_device yy -address 10
#yy write qqq
#yy poll

puts "go to local"
$dev go_to_local
puts "check it!"
after 3000
puts "deleting device"
gpib_device delete $dev

! Copyright (C) 2008 Doug Coleman.
! See http://factorcode.org/license.txt for BSD license.
USING: unix alien alien.c-types kernel math sequences strings
io.unix.backend splitting ;
IN: system-info.linux

: (uname) ( buf -- int )
    "int" f "uname" { "char*" } alien-invoke ;

: uname ( -- seq )
    65536 "char" <c-array> [ (uname) io-error ] keep
    "\0" split harvest [ >string ] map
    6 "" pad-right ;

: sysname ( -- string ) uname first ;
: nodename ( -- string ) uname second ;
: release ( -- string ) uname third ;
: version ( -- string ) uname fourth ;
: machine ( -- string ) uname 4 swap nth ;
: domainname ( -- string ) uname 5 swap nth ;

: kernel-version ( -- seq )
    release ".-" split harvest 5 "" pad-right ;
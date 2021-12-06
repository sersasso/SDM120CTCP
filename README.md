# SDM120CTCP
SDM120CTCP ModBus TCP client to read EASTRON SDM smart mini power meter registers

It depends on libmodbus (http://libmodbus.org)

To compile
<PRE>
  make clean && make
</PRE>
To install
<PRE>
make install
</PRE>
To uninstall
<PRE>
make uninstall
</PRE>
on /etc/hosts add an entry to point to ew11. eg.:
<PRE>
  192.168.1.100 ew11
</PRE>
please note that this file is fully based on sdm120c.c so the only change performed is related to the way it connects.
There is no other changes done and it looks like the original file.

To use it please see the following example:
  <PRE>
    sdm120ctcp -a 1 -b 9600 -z 10 -i -p -v -c -f -g -P N -w 10 -j 10 -d 0 -q /dev/dummy
  </PRE>
the command layout is similar to the original sdm120c but we use /dev/dummy at the end to make use of the locking logic.
the bitrate needs to be specified even if that parameted will be set into the server section of the ew11. Same for all serial settings

  

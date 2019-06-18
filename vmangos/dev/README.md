### image for gdb debug

```
# 需要与发布镜像同时构建
docker build -t xujintao/vmangos:1.12.1 .
```

##### debug without parameter
```
root@05a129280e9b:/vmangos/bin# gdb ./mangosd 
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from ./mangosd...done.
(gdb)
(gdb) b World.cpp:1078
Breakpoint 1 at 0x693655: file /vmangos/core/src/game/World.cpp, line 1078.
(gdb) b World.cpp:1084
Breakpoint 2 at 0x69371c: file /vmangos/core/src/game/World.cpp, line 1084.
(gdb) r
Starting program: /vmangos/bin/mangosd 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
Core revision: 5166b62b5cc86db1b8f7 / 2019-06-13 19:00:36 +0300 / Linux_x64 (little-endian) [world-daemon]
<Ctrl-C> to stop.


MM   MM         MM   MM  MMMMM   MMMM   MMMMM
MM   MM         MM   MM MMM MMM MM  MM MMM MMM
MMM MMM         MMM  MM MMM MMM MM  MM MMM
MM M MM         MMMM MM MMM     MM  MM  MMM
MM M MM  MMMMM  MM MMMM MMM     MM  MM   MMM
MM M MM M   MMM MM  MMM MMMMMMM MM  MM    MMM
MM   MM     MMM MM   MM MM  MMM MM  MM     MMM
MM   MM MMMMMMM MM   MM MMM MMM MM  MM MMM MMM
MM   MM MM  MMM MM   MM  MMMMMM  MMMM   MMMMM
        MM  MMM http://getmangos.com
        MMMMMM


vMaNGOS : https://github.com/vmangos
Using configuration file /vmangos/etc/mangosd.conf.
Alloc library: TBB/Release
Core Revision: 5166b62b5cc86db1b8f7 / 2019-06-13 19:00:36 +0300 / Linux_x64 (little-endian)
World Database: vmgdb;3306;root;*;mangos, sync threads: 1, workers: 1
[New Thread 0x7ffff4e89700 (LWP 5015)]
WARNING! Database `mangos` has the following extra migrations:
	20190611205148
Character Database: vmgdb;3306;root;*;characters, sync threads: 1, workers: 1
[New Thread 0x7ffff4688700 (LWP 5016)]
Login Database: vmgdb;3306;root;*;realmd, sync threads: 1, workers: 1
[New Thread 0x7ffff3e87700 (LWP 5017)]
Logs Database: vmgdb;3306;root;*;logs, sync threads: 1, workers: 1
[New Thread 0x7ffff3686700 (LWP 5018)]
Realm running as realm ID 1

Using DataDir ../data/
WORLD: VMap support included. LineOfSight:1, getHeight:1, indoorCheck:1
WORLD: VMap data directory is: ../data/vmaps
WORLD: mmap pathfinding enabled
* Anticrash : options 0x1c rearm after 60sec
* Pathfinding : [ON]

Thread 1 "mangosd" hit Breakpoint 2, World::SetInitialWorldSettings (this=0x7ffff567e080) at /vmangos/core/src/game/World.cpp:1084
1084	    sLog.outString();
(gdb) 
```

##### debug with -s run
```
# 方式1
gdb 可执行文件 core文件

# 方式2
gdb 可执行文件
(gdb) core-file core文件

# 方式3
gdb core文件
(gdb) file 可执行文件
```

```
root@05a129280e9b:/vmangos/bin# gdb ./mangosd 
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from ./mangosd...done.
(gdb)
(gdb) set args -s run
(gdb) set follow-fork-mode child
(gdb) b World.cpp:1078
Breakpoint 1 at 0x693655: file /vmangos/core/src/game/World.cpp, line 1078.
(gdb) b World.cpp:1084
Breakpoint 2 at 0x69371c: file /vmangos/core/src/game/World.cpp, line 1084.
(gdb) r
Starting program: /vmangos/bin/mangosd -s run
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[New process 4993]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[New Thread 0x7ffff4e89700 (LWP 4994)]
[New Thread 0x7ffff4688700 (LWP 4995)]
[New Thread 0x7ffff3e87700 (LWP 4996)]
[New Thread 0x7ffff3686700 (LWP 4997)]
[Switching to Thread 0x7ffff7fe9740 (LWP 4993)]

Thread 2.1 "mangosd" hit Breakpoint 1, World::SetInitialWorldSettings (this=<optimized out>) at /vmangos/core/src/game/World.cpp:1078
1078	        sLog.outError("Correct *.map files not found in path '%smaps' or *.vmtree/*.vmtile files in '%svmaps'. Please place *.map and vmap files in appropriate directories or correct the DataDir value in the mangosd.conf file.", m_dataPath.c_str(), m_dataPath.c_str());
(gdb) 
```

##### debug coredump
```
root@21dc73128b49:/vmangos/bin# gdb ./mangosd /coredump/core.mangosd.1.1560741877 
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from ./mangosd...done.
[New LWP 9107]
[New LWP 9]
[New LWP 6]
[New LWP 9106]
[New LWP 8]
[New LWP 10]
[New LWP 9105]
[New LWP 9104]
[New LWP 7]
[New LWP 11]
[New LWP 13]
[New LWP 14]
[New LWP 1]
Core was generated by `/vmangos/bin/mangosd'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x0000000000605827 in ?? ()
[Current thread is 1 (LWP 9107)]
(gdb) 
```
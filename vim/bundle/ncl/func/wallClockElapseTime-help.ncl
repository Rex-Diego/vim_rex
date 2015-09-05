THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/wallClockElapseTime.shtml
THE_TITLE:wallClockElapseTime
   NCL Home > Documentation > Functions > System tools

wallClockElapseTime

   Calculates and prints elapsed 'wall clock' time.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure wallClockElapseTime (
                date   : string,
                title  : string,
                opt    : integer
        )

Arguments

   date

   The current date (i.e. date = systemfunc("date")).
   title

   A string that will become part of the output description.
   opt

   An integer, currently not used.

Description

   This procedure calculates and prints the elapsed 'wall clock' time in
   seconds. It will not handle the case where the year or month changes.

   Note: The Unix/Linux time can be used to time a script. It is invoked
   from the command line.
     %>  time ncl foo.ncl

   This is best done when the system is not being used by other users.

See Also

   get_cpu_time

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
     load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   The following prints wall clock time for different code sections and
   the overall time. Using different "start times" allows different code
   sections to be timed. These are italicized for emphasis.
     wcStrt     = systemfunc("date")

     wcStrtClmP = systemfunc("date")
;                   :    ; one or more statements [usually a block of code]
     wallClockElapseTime(wcStrtClmP, "Processing", 0)

                    :

     wcStrtGraphics = systemfunc("date")
;                   :    ; graphics code
     wallClockElapseTime(wcStrtGraphics, "Graphics", 0)


     wallClockElapseTime(wcStrt, "Processing and Graphics", 0)


   The printed output will look like:
=====> Wall Clock Elapsed Time: Processing: 137 seconds <=====

=====> Wall Clock Elapsed Time: Graphics: 19 seconds <=====

=====> Wall Clock Elapsed Time: Processing and Graphics: 156 seconds <=====


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

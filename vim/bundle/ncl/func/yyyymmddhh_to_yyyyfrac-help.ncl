THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/yyyymmddhh_to_yyyyfrac.shtml
THE_TITLE:yyyymmddhh_to_yyyyfrac
   NCL Home > Documentation > Functions > Date routines

yyyymmddhh_to_yyyyfrac

   Converts a one dimensional array containing yyyymmddhh values to yyyy
   and fractional year.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function yyyymmddhh_to_yyyyfrac (
                yyyymmddhh [*] : integer, float, double,
                hh_offset  [1] : float, double
        )

Arguments

   yyyymmddhh

   A one dimensional array containing yyyymmddhh values: yyyy are years
   (Gregorian); "mm" are months ranging from 1 to 12 corresponding to
   January to December; the "dd" are calendar day of the month [1 to 31];
   the "hh" indicate integer hours spanning [0 to 23].
   hh_offset

   Currently, not used. Set to zero.

Return value

   A one dimensional array containing values of the form yyyy plus
   fractional part of year. If yyyymmddhh is type double the return will
   be type double. Otherwise type float is returned.

Description

   For each value of yyyymmddhh, the day_of_year is determined. The
   fractional part is determined by calculating the number of seconds from
   Jan 1 at zero hours to each yyyymmddhh value. That number is divided by
   the numbers of days in the year [365 or 366] time 86400 seconds.

See Also

   List of "date" and "calendar" functions

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Convert a 1D array to yyyy plus fractional part of year.

      yyyymmddhh = (/ 1979010100 , 1979010106, 1979010112, 1979010118  /)

      yrfrac = yyyymmddhh_to_yyyyfrac(yyyymmddhh, 0)
      print(yrfrac)

   Each of the above yields a 1D array of length 4 values.
(0)     1979
(1)     1979.000685
(2)     1979.001370
(3)     1979.002055


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

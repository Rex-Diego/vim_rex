THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/yyyymmdd_to_yyyyfrac.shtml
THE_TITLE:yyyymmdd_to_yyyyfrac
   NCL Home > Documentation > Functions > Date routines

yyyymmdd_to_yyyyfrac

   Converts a one dimensional array containing yyyymmdd values to yyyy and
   fractional year.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function yyyymmdd_to_yyyyfrac (
                yyyymmdd  [*] : integer, float, double,
                dd_offset [1] : integer, float, double
        )

Arguments

   yyyymmdd

   A one dimensional array containing yyyymmdd values: yyyy are years
   (Gregorian); "mm" are months ranging from 1 to 12 corresponding to
   January to December; the "dd" are calendar day of the month [1 to 31]
   dd_offset

   A scalar denoting the daily fractional offset. A value of zero
   indicates no daily offset. A value of 0.5 yields mid-day fractional
   values. [ 0.0 <= dd_offset < 1.0 ]

Return value

   A one dimensional array containing values of the form yyyy plus
   fractional part of year. If yyyymmdd is type double the return will be
   type double. Otherwise type float is returned.

Description

   For each value of yyyymmdd, the day_of_year is determined. The
   fractional part is determined by the quantity
   (day_of_year(yyyy,mm,dd)-1)) divided by the numbers of days in the year
   [365 or 366].

See Also

   List of "date" and "calendar" functions

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Convert a 1D array to yyyymm yyyymmdd = (/ 19790101 , 19791231,
   19840715, 20011201 /)
      yrfrac = yyyymmdd_to_yyyyfrac(yyyymmdd, 0.)
      print(yrfrac)

   Each of the above yields a 1D array of length 4 values.
(0)     1979
(1)     1979.997
(2)     1984.536
(3)     2001.915

   The above with an offset of dd_offset=0.5
      yrfrac = yyyymmdd_to_yyyyfrac(yyyymmdd, 0.5)
      print(yrfrac)

   Each of the above yields a 1D array of length 4 values.
(0)     1979.001
(1)     1979.999
(2)     1984.537
(3)     2001.916


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

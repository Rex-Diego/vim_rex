THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/yyyymm_to_yyyyfrac.shtml
THE_TITLE:yyyymm_to_yyyyfrac
   NCL Home > Documentation > Functions > Date routines

yyyymm_to_yyyyfrac

   Converts a one dimensional array containing yyyymm values to yyyy and
   fractional year.

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function yyyymm_to_yyyyfrac (
                yyyymm    [*] : integer, float, double,
                mm_offset [1] : float or double
        )

Arguments

   yyyymm

   A one dimensional array containing yyyymm values. The "mm" must range
   from 1 to 12 corresponding to January to December.
   mm_offset

   A scalar denoting the monthly offset. A value of 0.0 yields fractional
   values starting at 0.0. A values of 0.5 yields mid-month fractional
   values.

Return value

   A one dimensional array containing values of the form yyyy plus
   fractional part of year. If either yyyymm or mm_offset is type double
   the return will be type double. Otherwise type float is returned.

Description

   For each month of each year, the values yyyymm=yyyy*100+(mm-1)/12 or
   yyyymm=yyyy*100+((mm-mm_offset)-1)/12 are returned. For "mm" spanning 1
   through 12, the fractional parts are:
            mm_offset  mm_offset
       mm      0.0        0.5
       __   _________  _________
        1   0.0        0.0416667
        2   0.0833333  0.125
        3   0.166667   0.208333
        4   0.25       0.291667
        5   0.333333   0.375
        6   0.416667   0.458333
        7   0.5        0.541667
        8   0.583333   0.625
        9   0.666667   0.708333
        10  0.75       0.791667
        11  0.833333   0.875
        12  0.916667   0.958333

   This function is most frequently used for plotting, say, time series.

See Also

   List of "date" and "calendar" functions

Examples

   The following requires that contributed.ncl be loaded prior to invoking
   the function.
 load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Convert a 1D array to yyyymm yyyymm = (/ 197901 , 198407, 200112 /)
  yrfrac = yyyymm_to_yyyyfrac(yyyymm, 0.0)
  YRFRAC = yyyymm_to_yyyyfrac(yyyymm, 0.5)
print(yrfrac+" "+YRFRAC))

   Each of the above yields a 1D array of length 3 values.
    1979      1979.04
    1984.5    1984.54
    2001.92   2001.96

   Example 2

   Create a 1D "yyyymm" array and covert to yyyy and a fractional part.
    TIME = yyyymm_time(1901, 2001, "integer")
    yyyyFrac = yyyymm_to_yyyyfrac(TIME, 0.0)
    print(yyyyFrac)

   The above returns a 1D array of length 1212 values.
Variable: yyyyFrac
Type: float
Total Size: 4848 bytes
            1212 values
Number of Dimensions: 1
Dimensions and sizes:   [time | 1212]
Coordinates:
            time: [190101..200112]
Number Of Attributes: 2
  units :       YYYY + fractional portion of year
  NCL : derived using function yyyymm_to_yyyyfrac
(0)     1901
(1)     1901.083
(2)     1901.167
(3)     1901.25
(4)     1901.333
[snip]
(1206)  2001.5
(1207)  2001.583
(1208)  2001.667
(1209)  2001.75
(1210)  2001.833
(1211)  2001.917


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

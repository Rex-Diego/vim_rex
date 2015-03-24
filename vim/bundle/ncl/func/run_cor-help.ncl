THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/User_contributed/run_cor.shtml
THE_TITLE:run_cor
   NCL Home > Documentation > Functions > General applied math

run_cor

   Calculates a running correlation.

   [new.gif] Available in version 5.2.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/run_cor.ncl"

        function run_cor (
                x     [*] : numeric,
                y     [*] : numeric,
                time  [*] : numeric,
                wSize [1] : integer
        )

        return_val [*] :  numeric

Arguments

   x

   A one-dimensional array of any numeric type.
   y

   An array of any numeric type and the same size as x.
   time

   A one-dimensional numeric array the same size as x and y that
   represents the time coordinates of x and y. This array must have a
   "units" attribute recognized by ut_calendar.
   wSize

   An integer representing the number of points to include in the running
   correlation.

Return value

   A one-dimensional array dimensioned npts-wSize-1, where npts represents
   the length of x and y. The return type will be double if x or y are
   double, and float otherwise.

Description

   This function uses escorc to calculate a running correlation, given a
   window wSize.

   The window size represents the number of elements to include in the
   running correlation (time width). Generally we use 11 year, 15 year, 21
   year and so on.

   Suppose the parameters are Xi and Yi, where i=1....n. The return values
   of run_cor for a wSize=11 is a one dimensional array of correlation
   values of each group of 11 years; i.e. the correlation coefficient for
   the parameters Xi and Yi corresponds to i=1 to 11, i=2 to 12, i=3 to
   13, . . . i=(n-10) to n.

   Similarly for wSize=15. The correlation value of each group of 15 years
   is calculated where Xi and Yi corresponds to i=1 to 15, i=2 to 16, i=3
   to 17,. . . i=(n-14) to n.

   For any time width, the correlation value corresponds to the middle
   year.

   This script was contributed by:

     Sabeerali C T
     Research Fellow
     Climate and Global Modelling Division
     Indian Institute of Tropical Meteorology
     Pune, India

See Also

   escorc, ut_calendar

Examples

    cor_11 = run_cor(x,y,time,11)
    cor_15 = run_cor(x,y,time,15)
    cor_21 = run_cor(x,y,time,21)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

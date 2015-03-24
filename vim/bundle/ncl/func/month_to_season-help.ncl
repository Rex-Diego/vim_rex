THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/month_to_season.shtml
THE_TITLE:month_to_season
   NCL Home > Documentation > Functions > Climatology

month_to_season

   Computes a user-specified three-month seasonal mean (DJF, JFM, FMA,
   MAM, AMJ, MJJ, JJA, JAS, ASO, SON, OND, NDJ).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function month_to_season (
                xMon    : numeric,
                season  : string
        )

        return_val  :  typeof(x)

Arguments

   xMon

   A one-, three-, or four-dimensional array (xMon(time) or
   xMon(time,lat,lon) or xMon(time,lev,lat,lon) of any numeric type.

   xMon must have named dimensions and the time (leftmost) dimension must
   be divisible by 12. The data are assumed to be monthly mean data and
   the first record is assumed to be January.
   season

   A string representing the season to calculate: e.g. "JFM", "JJA".

Return value

   The return value will be of the same type and dimensionality as xMon,
   except the leftmost dimension will have been divided by 12.

   If the input data contains meta data (e.g. coordinate variables and
   attributes), these will be retained. There is no output time dimension.
   The output contains only the season requested.

   The attribute "NMO" is returned (for possible use in subscripting.)

Description

   This function computes a user-specified three-month seasonal mean (DJF,
   JFM, FMA, MAM, AMJ, MJJ, JJA, JAS, ASO, SON, OND, NDJ). The first
   average (DJF=JF) and the last average (NDJ=ND) are actually two-month
   averages.

   The following table shows how the output variable is dimensioned with
   respect to the input variable:

           Input                   Output
   xMon(time)             xSea(time/12)
   xMon(time,lat,lon)     xSea(time/12,lat,lon)
   xMon(time,lev,lat,lon) xSea(time/12,lev,lat,lon)

See Also

   month_to_season12, month_to_seasonN

Examples

   Example 1: Consider a three-dimensional array xMon(time,lat,lon). The
   "time" dimension must be divisible be 12. For example:
     Dimensions and sizes:   [time | 216] x [lat | 64] x [lon | 128

   Here 216/12=18 JJA seasons.
     xJJA = month_to_season (xMon, "JJA")

     printVarSummary(xJJA)

     print(xJJA&time+"   "+xJJA(:,n,m) )

   The output would look like:
Variable: xJJA
 [snip]
Number of Dimensions: 3
Dimensions and sizes:   [time | 18] x [lat | 64] x [lon | 128]
Coordinates:
            time: [197907..199607]
            lat: [-87.8638..87.8638]
            lon: [ 0..357.1875]
 [snip]

   The output for one specific grid point is:
(0)     197907   4.97418
(1)     198007   5.58847
(2)     198107   2.80735
(3)     198207   7.67114
(4)     198307   5.60251
(5)     198407   2.77295
(6)     198507   2.39782
(7)     198607   3.72329
(8)     198707   8.7012
(9)     198807   1.14696
(10)    198907   2.02456
(11)    199007   4.03629
(12)    199107   7.04084
(13)    199207   3.75878
(14)    199307   6.6912
(15)    199407   4.01582
(16)    199507   2.05951
(17)    199607   2.13118


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

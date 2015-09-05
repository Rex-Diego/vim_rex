THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/month_to_seasonN.shtml
THE_TITLE:month_to_seasonN
   NCL Home > Documentation > Functions > Climatology

month_to_seasonN

   Computes a user-specified list of three-month seasonal means (DJF, JFM,
   FMA, MAM, AMJ, MJJ, JJA, JAS, ASO, SON, OND, NDJ).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function month_to_seasonN (
                xMon       : numeric,
                season [*] : string
        )

        return_val  :  typeof(x)

Arguments

   xMon

   A one-, three-, or four-dimensional array (xMon(time) or
   xMon(time,lat,lon) or xMon(time,lev,lat,lon) of any numeric type.

   xMon must have named dimensions and the time (leftmost) dimension must
   be divisible by 12. The data are assumed to be monthly mean data and
   the first record is assumed to be January.

Return value

   The return value will be of the same type and one more dimension than
   xMon. The leftmost dimension will be N where N is the length of season.
   See the description below for more information.

   If the input data contains meta data (e.g. coordinate variables and
   attributes), these will be retained.

   In addition, the attributes "long_name" and "season" are returned.

Description

   Computes a user-specified list three-month seasonal means (DJF, JFM,
   FMA, MAM, AMJ, MJJ, JJA, JAS, ASO, SON, OND, NDJ). The first average
   (DJF=JF) and the last average (NDJ=ND) are actually two-month averages.

   The following table shows how the output variable is dimensioned with
   respect to the input variable:

           Input                    Output
   xMon(time)             xSea(N,time/12)
   xMon(time,lat,lon)     xSea(N,time/12,lat,lon)
   xMon(time,lev,lat,lon) xSea(N,time/12,lev,lat,lon)

See Also

   month_to_season, month_to_season12

Examples

; for xMon(time,lat,lon)

  xJJA = month_to_seasonN (xMon, (/"JJA","JFM"/))

; result: xJJA(2,dimsizes(time)/12,lat,lon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

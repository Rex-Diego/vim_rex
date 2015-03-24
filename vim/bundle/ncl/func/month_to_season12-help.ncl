THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/month_to_season12.shtml
THE_TITLE:month_to_season12
   NCL Home > Documentation > Functions > Climatology

month_to_season12

   Computes three-month seasonal means (DJF, JFM, FMA, MAM, AMJ, MJJ, JJA,
   JAS, ASO, SON, OND, NDJ).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function month_to_season12 (
                xMon  : numeric
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

   The return value will be of the same type and dimensionality as xMon.
   If the input data contains meta data (e.g. coordinate variables and
   attributes), these will be retained.

   In addition, the attribute "season" is returned.

Description

   Computes three-month seasonal means (DJF, JFM, FMA, MAM, AMJ, MJJ, JJA,
   JAS, ASO, SON, OND, NDJ). The first seasonal average (DJF=JF) and the
   last seasonal average (NDJ=ND) are actually two-month averages.

           Input                 Output
   xMon(time)             xSea(time)
   xMon(time,lat,lon)     xSea(time,lat,lon)
   xMon(time,lev,lat,lon) xSea(time,lev,lat,lon)

See Also

   month_to_season, month_to_seasonN

Examples

; for xMon(time,lat,lon)

  xSea = month_to_season12 (xMon)

; result: xSea(dimsizes(time),lat,lon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

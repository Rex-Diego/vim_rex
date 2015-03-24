THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/calcMonAnomLLLT.shtml
THE_TITLE:calcMonAnomLLLT
   NCL Home > Documentation > Functions > Climatology

calcMonAnomLLLT

   Calculates monthly anomalies by subtracting the long term mean from
   each point (lev,lat,lon,time version)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function calcMonAnomLLLT (
                x     [*][*][*][*] : numeric,
                xAve [*][*][*][12] : numeric
        )

        return_val [dimsizes(x)] :  numeric

Arguments

   x

   A four-dimensional array of any numeric type. Dimensions must be
   lev,lat, lon, time. The time dimension must be a multiple of 12.
   xAve

   A four-dimensional array equal to the monthly averages of x. The
   leftmost three dimensions are lev,lat,lon, while the rightmost must be
   of size 12.

Return value

   An array of the same size and type as x.

Description

   Calculates climatological anomalies by subtracting the long term mean
   from each point. Assumes monthly data. If the input data contains
   metadata (e.g. coordinate variables and attributes), these will be
   retained.

See Also

   calcMonAnomLLT, calcMonAnomTLL, clmMonLLT, clmMonLLLT, clmMonTLL,
   clmMonTLLL


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

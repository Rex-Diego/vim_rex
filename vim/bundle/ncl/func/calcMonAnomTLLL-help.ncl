THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/calcMonAnomTLLL.shtml
THE_TITLE:calcMonAnomTLLL
   NCL Home > Documentation > Functions > Climatology

calcMonAnomTLLL

   Calculates monthly anomalies by subtracting the long term mean from
   each point: (time,lev,lat,lon) version.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function calcMonAnomTLLL (
                x     [*][*][*][*] : float or double,
                xAve [12][*][*][*] : numeric
        )

        return_val [dimsizes(x)] :  numeric

Arguments

   x

   A four-dimensional array of type float or double. Dimensions must be
   time,lev,lat,lon The time dimension must be a multiple of 12.
   xAve

   A four-dimensional array equal to the monthly averages of x. The
   leftmost dimension must be of size 12. the three rightmost dimensions
   must matc the rightmost dimensions of x.

Return value

   An array of the same size and type as x.

Description

   Calculates climatological anomalies by subtracting the long term mean
   from each point. Assumes monthly data. If the input data contains
   metadata (e.g. coordinate variables and attributes), these will be
   retained.

See Also

   calcMonAnomTLL, calcMonAnomLLLT, calcMonAnomLLT, clmMonLLT, clmMonLLLT,
   clmMonTLL, clmMonTLLL


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

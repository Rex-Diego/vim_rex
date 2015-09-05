THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/calcMonAnomTLL.shtml
THE_TITLE:calcMonAnomTLL
   NCL Home > Documentation > Functions > Climatology

calcMonAnomTLL

   Calculates monthly anomalies by subtracting the long term mean from
   each point (time,lat,lon version)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function calcMonAnomTLL (
                x     [*][*][*] : float or double,
                xAve [12][*][*] : numeric
        )

        return_val [dimsizes(x)] :  numeric

Arguments

   x

   A three-dimensional array of any numeric type. Dimensions must be
   time,lat,lon The time dimension must be a multiple of 12.
   xAve

   A three-dimensional array equal to the monthly averages of x. The
   leftmost two dimensions are lat and lon, while the leftmost must be of
   size 12.

Return value

   An array of the same size and type as x.

Description

   Calculates climatological anomalies by subtracting the long term mean
   from each point. Assumes monthly data. If the input data contains
   metadata (e.g. coordinate variables and attributes), these will be
   retained.

See Also

   calcMonAnomLLLT, calcMonAnomLLT, calcMonAnomTLLL clmMonLLT, clmMonLLLT,
   clmMonTLL, clmMonTLLL


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

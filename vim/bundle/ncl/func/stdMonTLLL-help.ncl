THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/stdMonTLLL.shtml
THE_TITLE:stdMonTLLL
   NCL Home > Documentation > Functions > Climatology

stdMonTLLL

   Calculates standard deviations of monthly means.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function stdMonTLL (
                x [*][*][*][*] : numeric
        )

        return_val [12][*][*][*] :  typeof(x)

Arguments

   x

   A four-dimensional array of monthly means, dimensioned time x lat x lon
   x lev. The time dimension must be a multiple of 12.

Return value

   The results are returned in an array of the same type and
   dimensionality as x, except the time dimension will be length 12.

Description

   This function calculates standard deviations of monthly means.

See Also

   stdMonLLT, stdMonTLL, stdMonLLLT, stdMonTLLL


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

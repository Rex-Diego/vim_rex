THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/stdMonTLL.shtml
THE_TITLE:stdMonTLL
   NCL Home > Documentation > Functions > Climatology

stdMonTLL

   Calculates standard deviations of monthly means.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function stdMonTLL (
                x [*][*][*] : float or double
        )

        return_val [12][*][*] :  typeof(x)

Arguments

   x

   A three-dimensional array of monthly means, dimensioned time x lat x
   lon. The time dimension must be a multiple of 12.

Return value

   The results are returned in an array of the same type and
   dimensionality as x, except the time dimension will be length 12. If
   the input data contains metadata, these will be retained.

Description

   This function calculates standard deviations of monthly means.

See Also

   stdMonLLT, stdMonTLL, stdMonLLLT, stdMonTLLL

Examples

   For some application examples, see:
     * "hybrid_1.ncl"
     * "precip_1.ncl"


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

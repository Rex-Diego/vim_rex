THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/rmAnnCycle1D.shtml
THE_TITLE:rmAnnCycle1D
   NCL Home > Documentation > Functions > Climatology

rmAnnCycle1D

   Removes annual cycle from a one-dimensional time series.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function rmAnnCycle1D (
                x [*] : numeric
        )

        return_val [dimsizes(x)] :  typeof(x)

Arguments

   x

   A one-dimensional time series of monthly values.

Return value

   The results are returned in an array of the same type and
   dimensionality as x. Metadata are retained.

Description

   This function removes annual cycle from a one-dimensional time series.
   The time dimension must be a multiple of 12.

See Also

   rmMonAnnCycLLLT, rmMonAnnCycLLT, rmMonAnnCycTLL


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

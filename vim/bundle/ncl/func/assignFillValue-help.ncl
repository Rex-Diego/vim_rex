THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/assignFillValue.shtml
THE_TITLE:assignFillValue
   NCL Home > Documentation > Functions > Metadata routines

assignFillValue

   Transfers the _FillValue attribute from one variable to another.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure assignFillValue (
                var_from  : numeric,
                var_to    : numeric
        )

Arguments

   var_from

   A numeric array of any dimensionality. Needs to contain a _FillValue
   attribute.
   var_to

   ( category ="output")
   A numeric array of any dimensionality.

Description

   This procedure transfers the _FillValue from one variable to another.
   It uses getFillValue to determine the _FillValue.

See Also

   There are many metadata tools


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

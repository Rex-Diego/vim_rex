THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/copy_VarCoords_2.shtml
THE_TITLE:copy_VarCoords_2
   NCL Home > Documentation > Functions > Metadata routines

copy_VarCoords_2

   Copies all named dimensions and coordinate variables from one variable
   to another except for the rightmost two dimensions.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure copy_VarCoords_2 (
                var_from  ,
                var_to
        )

Arguments

   var_from

   An array of any dimensionality. Must have named dimensions and
   coordinate variables
   var_to

   An array of any dimensionality.

Description

   This procedure copies all named dimensions and coordinate variables
   from one variable to another except for the rightmost two dimensions.

See Also

   There are many metadata tools.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

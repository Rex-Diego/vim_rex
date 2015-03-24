THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/copy_VarAtts.shtml
THE_TITLE:copy_VarAtts
   NCL Home > Documentation > Functions > Metadata routines

copy_VarAtts

   Copies all of a variable's attributes from one variable to another.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure copy_VarAtts (
                var_from  ,
                var_to
        )

Arguments

   var_from

   An array of any dimensionality. Must have attributes.
   var_to

   An array of any dimensionality. Must be the same size as var_from.

Description

   This procedure copies all of a variable's attributes from var_from to
   var_to. If var_to already contains an attribute of the same name as one
   of var_from's attributes, then it is deleted and the new one copied
   over.

See Also

   There are many metadata tools.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

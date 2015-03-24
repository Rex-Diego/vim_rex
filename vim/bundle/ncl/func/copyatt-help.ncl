THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/copyatt.shtml
THE_TITLE:copyatt
   NCL Home > Documentation > Functions > Metadata routines

copyatt

   Copies all attributes, named dimensions and coordinate variables from
   one variable to another (deprecated version).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure copyatt (
                var_to    ,
                var_from
        )

Arguments

   var_to

   An array of any dimensionality. Must be the same size as var_from.
   var_from

   An array of any dimensionality. Must have attributes, named dimensions
   and coordinate variables.

Description

   This procedure copies all attributes, named dimensions and coordinate
   variables from var_from to var_to. This is a deprecated procedure;
   please use copy_VarMeta.

See Also

   There are many metadata tools.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

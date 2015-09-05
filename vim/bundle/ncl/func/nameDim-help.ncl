THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/nameDim.shtml
THE_TITLE:nameDim
   NCL Home > Documentation > Functions > Metadata routines

nameDim

   Assigns given named dimensions, long_name, and units to the input
   variable.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function nameDim (
                x            ,
                dimNames [*] : string,
                longName     : string,
                units        : string
        )

        return_val [dimsizes(x)] :  typeof(x)

Arguments

   x

   Array to assign dimensions and attributes to.
   dimNames

   An array of dimension names to assign to x. It must be the same length
   as the rank of x.
   longName

   A single string to assign to the "long_name" attribute.
   units

   A single string to assign to the "units" attribute.

Return value

   The input array x is returned with the attached dimensions and
   attributes.

Description

   This function assigns the given named dimensions, long_name, and units
   to the input variable.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

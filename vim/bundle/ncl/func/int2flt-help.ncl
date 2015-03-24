THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/int2flt.shtml
THE_TITLE:int2flt
   NCL Home > Documentation > Functions > Type converters

int2flt

   Converts values of type integer to values of type float and preserves
   metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function int2flt (
                x  : integer
        )

        return_val [dimsizes(x)] :  float

Arguments

   x

   An array of any dimensionality and of type integer.

Return value

   An array of the same size as x and of type float.

Description

   This function converts values of type integer to values of type float
   and preserves metadata.

   Note: This function is slightly different than the built-in set of
   conversion functions (like floattointeger and shorttobyte), because it
   requires loading the "contributed.ncl" script and it preserves
   metadata. It has a slightly different naming style than the built-in
   functions, just to set it apart from these other functions.

See Also

   short2flt, flt2dble


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

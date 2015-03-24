THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/flt2dble.shtml
THE_TITLE:flt2dble
   NCL Home > Documentation > Functions > Type converters

flt2dble

   Converts values of type float to values of type double and preserves
   metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function flt2dble (
                x  : float
        )

        return_val [dimsizes(x)] :  double

Arguments

   x

   An array of any dimensionality and of type float.

Return value

   An array of the same size as x and of type double.

Description

   This function converts values of type float to values of type double
   and preserves metadata.

   Note: this function is slightly different than the built-in set of
   conversion functions (like floattointeger and shorttobyte), because it
   requires loading the "contributed.ncl" script and it preserves
   metadata. It has a slightly different naming style than the built-in
   functions, just to set it apart from these other functions.

See Also

   dble2flt, short2flt


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

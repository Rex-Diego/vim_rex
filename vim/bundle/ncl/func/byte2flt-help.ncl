THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/byte2flt.shtml
THE_TITLE:byte2flt
   NCL Home > Documentation > Functions > Type converters

byte2flt

   Converts values of type byte to values of type float.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function byte2flt (
                x  : byte
        )

        return_val [dimsizes(x)] :  float

Arguments

   x

   An array of any dimensionality. Must be of type byte.

Return value

   An array of the same size as x. Type float.

Description

   This function converts byte data to float using the "scale" and
   "offset" attributes (if present), and preserves metadata.

   Other attributes similar to "scale" and "offset" will be recognized:

   offset:
          "add_offset", "OFFSET", "Offset", "_offset", "Intercept",
          "intercept"

   scale:
          "SCALE", "Scale", "_scale", "scale_factor", "Scale_factor",
          "Slope" , "slope"

   Note: this function is slightly different than the built-in set of
   conversion functions (like floattointeger and shorttobyte), because it
   requires loading the "contributed.ncl" script and it preserves
   metadata. It has a slightly different naming style than the built-in
   functions, just to set it apart from these other functions.

See Also

   short2flt, dble2flt, flt2dble


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

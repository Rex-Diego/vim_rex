THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/short2flt_hdf.shtml
THE_TITLE:short2flt_hdf
   NCL Home > Documentation > Functions > Type converters

short2flt_hdf

   Converts values of type short to values of type float using the "scale"
   and "offset" attributes (if present).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function short2flt_hdf (
                x  : short
        )

        return_val [dimsizes(x)] :  float

Arguments

   x

   An array of type short of any dimensionality.

Return value

   The results are returned in a float array of the same type
   dimensionality as x. Metadata is preserved.

Description

   This function converts short data to float using the "scale" and
   "offset" attributes (if present), and preserves metadata. It assumes
   that the "offset" is subtracted from the "scale" prior to application
   to the data.
             x_float = scale*(x_short - offset)

   Other attributes similar to "scale" and "offset" will be recognized:

   offset:
          "add_offset", "OFFSET", "Offset", "_offset", "Intercept",
          "intercept"

   scale:
          "SCALE", "Scale", "_scale", "scale_factor", "Scale_factor",
          "Slope" , "slope"

   Note1: This function is slightly different than the built-in set of
   conversion functions (like floattointeger and shorttobyte), because it
   requires loading the "contributed.ncl" script and it preserves
   metadata. It has a slightly different naming style than the built-in
   functions, just to set it apart from these other functions.

   Note2: A separate function, short2flt, must be used if the the
   following approach is to be applied:
             x_float = x_short*scale + offset

See Also

   short2flt, dble2flt, flt2dble, byte2flt, typeof, getfilevartypes


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

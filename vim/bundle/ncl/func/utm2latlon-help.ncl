THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/utm2latlon.shtml
THE_TITLE:utm2latlon
   NCL Home > Documentation > Functions > Lat/Lon functions

utm2latlon

   Converts from UTM to lat/lon using a specified datum.

Prototype

        function utm2latlon (
                xy     : numeric,
                datum  : integer
        )

        return_val [dimsizes(xy)] :  float or double

Arguments

   xy

   An array containing UTM coordinates. The leftmost dimension must be 2,
   with the 0-th dimension being the X coordinates and the 1-th dimension
   being the Y coordinates. This array must contain a "grid_zone"
   attribute.
   datum

   A scalar integer indicating which datum to use.

Return value

   A float or double array of the same size as xy with values containing
   the lat/lon values.

Description

   This function converts UTM coordinates to lat/lon coordinates, given a
   scalar or array of grid zones and a specified datum. The grid zone(s)
   must be specified as an attribute of xy called "grid_zone".

   The recognized datums are:
     * 0 = CLARKE_1866_DATUM
     * 1 = GRS_80_DATUM
     * 2 = WGS_84_DATUM

   If any missing values are encountered in xy, missing values will be
   returned in the same locations in the return array.

   If an invalid datum or grid_zone is input, or grid_zone is not set at
   all, then all missing values will be returned.

See Also

   latlon2utm

Examples

   Example 1

  xy           = (/285039.989723,3776960.118351/)
  xy@grid_zone = "11S"

  latlon = utm2latlon(xy,0)   ; 34.113, -119.331


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

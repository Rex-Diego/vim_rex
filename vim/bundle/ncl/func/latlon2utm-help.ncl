THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/latlon2utm.shtml
THE_TITLE:latlon2utm
   NCL Home > Documentation > Functions > Lat/Lon functions

latlon2utm

   Converts from lat/lon to UTM using a specified datum.

Prototype

        function latlon2utm (
                latlon  : numeric,
                datum   : integer
        )

        return_val [dimsizes(latlon)] :  float or double

Arguments

   latlon

   An array containing lat/lon coordinates. The leftmost dimension must be
   2, with the 0-th dimension being the latitude values and the 1-th
   dimension being the longitude values.
   datum

   A scalar integer indicating which datum to use.

Return value

   A float or double array of the same size as latlon with values
   containing the lat/lon values.

Description

   This function converts lat/lon values to UTM coordinates, given a
   specified datum. The grid zones will be returned as an attribute of the
   return value called "grid_zone".

   The recognized datums are:
     * 0 = CLARKE_1866_DATUM
     * 1 = GRS_80_DATUM
     * 2 = WGS_84_DATUM

   If any missing values are encountered in latlon, missing values will be
   returned in the same locations in the return array.

   If an invalid datum is input, then all missing values will be returned.

See Also

   utm2latlon

Examples

   Example 1

  latlon = (/34.113, -119.331/)

  xy = latlon2utm(latlon,0)   ; 285039.99,3776960.12


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

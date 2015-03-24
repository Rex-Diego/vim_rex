THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/lonGlobeF.shtml
THE_TITLE:lonGlobeF
   NCL Home > Documentation > Functions > Lat/Lon functions

lonGlobeF

   Generates longitudes and associated metadata for a global fixed grid.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function lonGlobeF (
                nlon     [1] : integer or long,
                name     [1] : string,
                longname [1] : string,
                units    [1] : string
        )

        return_val [*] :  float

Arguments

   nlon

   A scalar integer equal to the number of longitudes desired.

   As of version 6.0.0, this can be of type integer or long.
   name

   A string that will become the named dimension of the output (e.g.
   "lon").
   longname

   A string that will become the long_name of the output (e.g.
   "longitude").
   units

   A string that will become the units of the output (e.g.
   "degrees_north").

Return value

   A one-dimensional array of size nlon. Default type float.

Description

   Generates longitudes and associated metadata for a global fixed grid.

See Also

   lonGlobeFo, latGlobeF latGlobeFo,

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Create a one dimensional array of longitudes (coordinate array)
   starting at the Grenwich Meridion.
      mlon = 144
      lon  = lonGlobeF(mlon, "lon", "longitude", "degrees_east")
      print(lon)

   The above returns a 1D array of length mlon values.
Variable: lon
Type: float
Total Size: 576 bytes
            144 values
Number of Dimensions: 1
Dimensions and sizes:   [lon | 144]
Coordinates:
            lon: [ 0..357.5]
Number Of Attributes: 2
  long_name :   longitude
  units :       degrees_east
(0)      0
(1)      2.5
(2)      5
(3)      7.5
(4)     10
[snip]
(140)   350
(141)   352.5
(142)   355
(143)   357.5

   Note 1: if starting at the Internalional Dateline is desired,
      lon = (/ lon - 180. /)  ; subtract 180 from all values
      lon&lon = lon           ; update coordinates
      print(lon)

   The result:

Variable: lon
Type: float
Total Size: 576 bytes
            144 values
Number of Dimensions: 1
Dimensions and sizes:   [lon | 144]
Coordinates:
            lon: [-180..177.5]
Number Of Attributes: 2
  long_name :   longitude
  units :       degrees_east
(0)     -180
(1)     -177.5
(2)     -175
(3)     -172.5
(4)     -170
[snip]
(140)    170
(141)    172.5
(142)    175
(143)    177.5

   Note 2: If double precision is desired, set
     mlon@double = True


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

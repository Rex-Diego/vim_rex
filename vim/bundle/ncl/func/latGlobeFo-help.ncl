THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/latGlobeFo.shtml
THE_TITLE:latGlobeFo
   NCL Home > Documentation > Functions > Lat/Lon functions

latGlobeFo

   Generates latitudes and associated metadata for a global fixed offset
   grid.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function latGlobeFo (
                nlat     [1] : integer or long,
                name     [1] : string,
                longname [1] : string,
                units    [1] : string
        )

        return_val [*] :  default float

Arguments

   nlat

   A scalar equal to the number of latitudes desired.

   As of version 6.0.0, this can be of type integer or long.
   name

   A string that will become the named dimension of the output (e.g.
   "lat").
   longname

   A string that will become the long_name of the output (e.g.
   "latitude").
   units

   A string that will become the units of the output (e.g.
   "degrees_north").

Return value

   A one-dimensional array of size nlat. Type float.

Description

   Generates latitudes and associated metadata that will run from -90 to
   +90

See Also

   latGlobeF, latGau, latGauWgt, lonGlobeF, lonGlobeFo, gaus

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Create a one dimensional array of latitudes (coordinate array). The
   values are offset from the pole.
      nlat = 72
      lat  = latGlobeFo(nlat, "lat", "latitude", "degrees_north")
      print(lat)

   The above returns a 1D array of length nlat values.

Variable: lat
Type: float
Total Size: 288 bytes
            72 values
Number of Dimensions: 1
Dimensions and sizes:   [lat | 72]
Coordinates:
            lat: [-88.75..88.75]
Number Of Attributes: 2
  long_name :   latitude
  units :       degrees_north
(0)     -88.75
(1)     -86.25
(2)     -83.75
(3)     -81.25
(4)     -78.75
[snip]
(67)     78.75
(68)     81.25
(69)     83.75
(70)     86.25
(71)     88.75

   Note 1: if North to South ordering is desired, use standard
   subscripting to reverse the order.
     lat = lat(::-1)     ; N -> S order

   Note 2: If double precision is desired, set
     nlat@double = True


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

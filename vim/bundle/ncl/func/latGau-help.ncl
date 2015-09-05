THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/latGau.shtml
THE_TITLE:latGau
   NCL Home > Documentation > Functions > Lat/Lon functions

latGau

   Generates gaussian latitudes and associated metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function latGau (
                nlat     [1] : integer or long,
                name     [1] : string,
                longname [1] : string,
                units    [1] : string
        )

        return_val [*] :  float

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

   Generates gaussian latitudes and associated metadata.

See Also

   latGauWgt, latGlobeF, latGlobeFo, lonGlobeF, lonGlobeFo, gaus

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Create a one dimensional array of gaussian latitudes (coordinate array)
   spanning South to North.
      nlat = 64
      lat  = latGau(nlat, "lat", "latitude", "degrees_north")
      print(lat)

   The above returns a 1D array of length nlat values.
Variable: lat
Type: float
Total Size: 256 bytes
            64 values
Number of Dimensions: 1
Dimensions and sizes:   [lat | 64]
Coordinates:
            lat: [-87.8638..87.8638]
Number Of Attributes: 2
  long_name :   latitude
  units :       degrees_north
(0)     -87.8638
(1)     -85.09653
(2)     -82.31291
(3)     -79.5256
(4)     -76.7369
[snip]
(59)     76.7369
(60)     79.5256
(61)     82.31291
(62)     85.09653
(63)     87.8638

   Note 1: if North to South ordering is desired, use standard
   subscripting to reverse the order.
     lat = lat(::-1)     ; 90 to -90

   Note 2: If double precision is desired, set
     nlat@double = True


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

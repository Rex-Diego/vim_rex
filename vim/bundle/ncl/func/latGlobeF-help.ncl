THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/latGlobeF.shtml
THE_TITLE:latGlobeF
   NCL Home > Documentation > Functions > Lat/Lon functions

latGlobeF

   Generates latitudes and associated metadata for a global fixed grid.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function latGlobeF (
                nlat     [1] : integer or long,
                name     [1] : string,
                longname [1] : string,
                units    [1] : string
        )

        return_val [*] :  float [default]

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

   A one-dimensional array of size nlat.

Description

   Generates latitudes and associated metadata that will run from -90 to
   +90

See Also

   latGlobeFo, latGau, latGauWgt, lonGlobeF, lonGlobeFo, gaus

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Create a one dimensional array of latitudes (coordinate array) spanning
   the South Pole to North Pole.
      nlat = 73
      lat  = latGlobeF(nlat, "lat", "latitude", "degrees_north")
      print(lat)

   The above returns a 1D array of length nlat values.

Variable: lat
Type: float
Total Size: 292 bytes
            73 values
Number of Dimensions: 1
Dimensions and sizes:   [lat | 73]
Coordinates:
            lat: [-90..90]
Number Of Attributes: 2
  long_name :   latitude
  units :       degrees_north
(0)     -90
(1)     -87.5
(2)     -85
(3)     -82.5
(4)     -80
[snip]
(68)     80
(69)     82.5
(70)     85
(71)     87.5
(72)     90

   Note 1: if 90N to 90S is desired, use standard subscripting to reverse
   the order.
     lat = lat(::-1)     ; 90 to -90

   Note 2: If double precision is desired, set
     nlat@double = True


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

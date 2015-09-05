THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/getind_latlon2d.shtml
THE_TITLE:getind_latlon2d
   NCL Home > Documentation > Functions > Array query, Lat/Lon functions

getind_latlon2d

   Finds the indices (subscripts) of two-dimensional latitude/longitude
   arrays closest to a user specified latitude/longitude coordinate pair.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function getind_latlon2d (
                lat2d [*][*] : numeric,
                lon2d [*][*] : numeric,
                lat      [*] : numeric,
                lon      [*] : numeric
        )

        return_val  :  (dimsizes(lat),2)  [integer or long]

Arguments

   lat2d

   A two-dimensional array that contains latitudes.
   lon2d

   A two-dimensional array that contains longitudes.
   lat

   A one-dimensional array that contains latitudes.
   lon

   A one-dimensional array that contains longitudes.

Return value

   A two dimensional array containing index subscripts corresponding to
   nearest lat2d/lon2d point.

Description

   Finds the indices (subscripts) of two-dimensional lat2d/lon2d arrays
   closest to each lat/lon coordinate pair.

Examples

   Example 1

   Find the indices (subscripts) closest to the user specified lat/lon
   coordinate pairs.
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
       ;
       ;
  f     = addfile("wrfout_d01_2003-07-13_12:00:00.nc" , "r")
  lat2d = f->XLAT(0,:,:)
  lon2d = f->XLONG(0,:,:)

  printVarSummary(lat2d)
  printMinMax(lat2d, True)
  printMinMax(lon2d, True)

  lat   = (/  31.0 ,  17.31, 24.05   /)   ; user specified coordinate pairs
  lon   = (/ -86.45,-101.00,-92.46   /)
                                          ; return 2d subscripts
  nm = getind_latlon2d (lat2d,lon2d, lat, lon)

  print(nm)

  do k=0,dimsizes(lat)-1
     n = nm(k,0)
     m = nm(k,1)
     print(lat2d(n,m)+"   "+lon2d(n,m))
  end do

   The (edited) output
Variable: lat2d
Type: float
Dimensions and sizes:   [south_north | 160] x [west_east | 180]

(0)     LATITUDE, SOUTH IS NEGATIVE: min= 16.7892   max= 34.5424
(0)     LONGITUDE, WEST IS NEGATIVE: min=-105.153   max=-82.8474


Variable: nm
Type: integer
Total Size: 24 bytes
            6 values
Number of Dimensions: 2
Dimensions and sizes:   [3] x [2]      ===> dimsizes(lat)=3
  long_name :   indices closest to specified LAT/LON coordinate pairs

(0,0)   125     [ index pair nearest to (31,-86.45)  ]
(0,1)   150

(1,0)   4       [ index pair nearest to (17.31,-101.45) ]
(1,1)   33

(2,0)   62      [ index pair nearest to (24.05, 94.46) ]
(2,1)   102

                [actual grid locations at the above subscripts]

(0)     30.9806   -86.4611
(0)     17.2658   -101.04
(0)     24.024    -92.4424




   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/nggcog.shtml
THE_TITLE:nggcog
   NCL Home > Documentation > Functions > Lat/Lon functions

nggcog

   Calculates the latitudes and longitudes of a set of points
   approximating a circle at a given point on the surface of the globe.

Prototype

        procedure nggcog (
                clat [1] : float,
                clon [1] : float,
                crad [1] : float,
                alat [*] : float,
                alon [*] : float
        )

Arguments

   clat
   clat

   The latitude and longitude, in degrees, of a point on the globe
   defining the center of the circle.
   crad

   The radius of the circle. This should be given as a great-circle
   distance, in degrees.
   alat
   alon

   (output)
   One-dimensional arrays that will contain the calculated latitude and
   longitude points of the circle.

Description

   If you let C represent (clat,clon) and let O represent the center of
   the globe, then this procedure returns (in the variables alat,alon) the
   set of all points P on the globe such that the angle POC is of the size
   specified by crad.

   The sine and cosine functions are used to generate points representing
   a circle having the desired radius and centered at the North Pole.
   These points are then subjected to two rotations - one that brings the
   circle down to the desired latitude, and another that carries it to the
   desired longitude.

   This procedure is analogous to Matlab's scircle1
   function.

See Also

   gc_latlon

Examples

   Example 1

   This example draws an orthographic map projection with a circle
   centered around Boulder:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  clat = new(100,float)               ; Create arrays to hold circle.
  clon = new(100,float)

  wks = gsn_open_wks("x11","nggcog")   ; Open X11 workstation.

  nggcog(40.,-105.3,7.0,clat,clon)

; Set up some map resources.

  mpres              = True
  mpres@gsnMaximize  = True     ; Maximize size of plot in frame.
  mpres@gsnFrame     = False    ; Don't advance the frame.
  mpres@mpCenterLonF = -95.
  mpres@mpCenterLatF =  35.

  map = gsn_map(wks, "Orthographic", mpres)
  gsn_polyline(wks, map, clon, clat, False)
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

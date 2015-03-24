THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/niceLatLon2D.shtml
THE_TITLE:niceLatLon2D
   NCL Home > Documentation > Functions > Array query, Lat/Lon functions

niceLatLon2D

   Check two dimensional map coordinates to see if they have a "nice"
   structure.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function niceLatLon2D (
                lat2d [*][*] : numeric,
                lon2d [*][*] : numeric
        )

Arguments

   lat2d

   A two-dimensional (2D) array of latitudes.
   lon2d

   A two-dimensional (2D) array of longitudes.

Return value

   Returns True if both the latitude and longitude two dimensional arrays
   hace a "nice" structure; otherwise return False.

Description

   The function executes the following:
   dimll = dimsizes(lat2d)       ; (south_north,west_east)
   nLeft = dimll(0)
   nRght = dimll(1)

   if (all(lat2d(:,0).eq.lat2d(:,nRght/2)) .and.  \
       all(lat2d(:,0).eq.lat2d(:,nRght-1)) .and.  \
       all(lon2d(0,:).eq.lon2d(nLeft/2,:)) .and.  \
       all(lon2d(0,:).eq.lon2d(nLeft-1,:)) ) then
       return(True)
   else
       return(False)
   end if

; if True then
; the data could be made accessible via classic
; netCDF coordinate array subscripting.
;
; lat      = lat2d(:,0)
; lon      = lon2d(0,:)
; lat@units= "degrees_north"
; lon@units= "degrees_east"
; lat!0    = "lat"
; lon!0    = "lon"
; lat&lat  =  lat
; lon&lon  =  lon
;
; assign to a variable

Examples

   Example 1
      load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"


  fName    = "wrfout_d01_2003-07-13_12:00:00.nc"
  f        = addfile(fName, "r")
  lat2d    = f->XLAT(0,:,:)    ; [south_north | 160] x [west_east | 180]
  lon2d    = f->XLONG(0,:,:)

  if(niceLatLon2D(lat2d,lon2d)) then
     lat      = lat2d(:,0)           ; create classic 1D coordinate arrays
     lon      = lon2d(0,:)

     lat@units= "degrees_north"

     lon@units= "degrees_east"

     lat!0    = "lat"

     lon!0    = "lon"

     lat&lat  =  lat

     lon&lon  =  lon

  else
     exit
  end if

  T     = f->T                        ; (time,lev,lat2d,lon2d)
  T!2   = "lat"                       ; rename dimension
  T!3   = "lon"
  T&lat =  lat                        ; assign values
  T&lon =  lon


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

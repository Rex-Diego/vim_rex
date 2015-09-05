THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_user_ll_to_ij.shtml
THE_TITLE:wrf_user_ll_to_ij
   NCL Home > Documentation > Functions > WRF, Lat/Lon functions

wrf_user_ll_to_ij

   Finds the nearest model grid indices (i,j) to the specified location(s)
   in longitude and latitude.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_user_ll_to_ij (
                file_handle  : file or list [list added in V6.0.0],
                lon          : numeric,
                lat          : numeric,
                opt          : logical
        )

        return_val  :  float or double

Arguments

   file_handle

   Reference to an input netCDF file opened with addfile, or, as of
   V6.0.0, can be a list of NetCDF files opened with addfiles.
   lon
   lat

   Longitude and latitude arrays for which ij locations are required.
   opt

   A logical scalar containing attributes. See description below.

Return value

   An array that holds the i, j index locations to the input lon, lat. If
   a single lon, lat location is used as input, the return value will have
   a dimension of 2, where the first element holds the i-th location and
   the second element holds the j-th location.

   If an array of lon, lat values are used on input, the return value will
   be 2 x n, where n is the size of the input arrays.

   The return values will represent a true value in the model domain. So
   if these values are later used as indexes in NCL scripts, 1 needs to be
   deducted from the values first.

Description

   This function replaces wrf_user_latlon_to_ij.

   This function makes use of map projection information out of the input
   file (nc_file) to locate the ij locations which corresponds to the
   input lon/lat locations. Note that if the lon/lat locations are outside
   your model domain, the returned ij locations will represent a point
   outside the domain.

   The return values will represent a true value in the model domain. So
   if these values are later used as indexes in NCL scripts, 1 needs to be
   deducted from the values first.

   The opt variable can contain the following attributes. Attributes are
   case-insensitive:
     * returnInt - True, will return an integer value, False will return
       real (defaults to True)
     * useTime - which time in the file should be used when extracting
       XLAT/XLONG arrays from input file. Only important to set if output
       is for a moving nest and all the output times are in a single
       wrfout file.

   wrf_user_ll_to_ij is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_ij_to_ll, wrf_ll_to_ij, wrf_ij_to_ll, wrf_user_getvar,
   wrf_user_intrp2d, wrf_user_intrp3d, wrf_user_list_times,
   wrf_user_unstagger

   See the full list of WRF functions.

Examples

   Example 1

   A simple example showing how to use this function to extract a
   particular lat/lon region of interest for your data. The print
   statements in this example will also help ensure that you are using
   this function properly.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  minlat = 30
  maxlat = 40
  minlon = -80
  maxlon = -70

  opt = True
  loc  = wrf_user_ll_to_ij(a,(/minlon,maxlon/),(/minlat,maxlat/),opt)
  loc = loc-1          ; To convert to NCL subscripts

;---The requested and calculated values should be close
  print("Requested min/max  xlon = " + minlon + "/" + maxlon)
  print("Calculated min/max xlon = " + xlon(loc(1,0),loc(0,0)) + "/" + \
                                       xlon(loc(1,1),loc(0,1)))

  print("Requested  min/max xlat = " + minlat + "/" + maxlat)
  print("Calculated min/max xlat = " + xlat(loc(1,0),loc(0,0)) + "/" + \
                                       xlat(loc(1,1),loc(0,1)))

;---Just for fun, pick a variable and take a subdomain of it.
  tc2 = wrf_user_getvar(a,"T2",0)   ; T2 in Kelvin
  printMinMax(tc2,0)

  tc2_sub = tc2(loc(1,0):loc(1,1),loc(0,0):loc(0,1))
  tc2_sub@description = tc2@description + " (subdomain)"   ; just an example
  printMinMax(tc2_sub,0)

   Example 2

   This example shows how using the output from wrf_user_ll_to_ij as input
   to wrf_user_ij_to_ll should give you close to the same values:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a    = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
  xlat = a->XLAT(0,:,:)
  xlon = a->XLONG(0,:,:)

  minlat =  30
  maxlat =  40
  minlon = -80
  maxlon = -70

;---Get ij indexes, and then use these to get lat/lon values back again.
  opt    = True
  loc    = wrf_user_ll_to_ij(a,(/minlon,maxlon/),(/minlat,maxlat/),opt)
  latlon = wrf_user_ij_to_ll(a,loc(0,:),loc(1,:),opt)


;---The min/max values printed should be close.
  print("----")
  print("Requested  min/max xlon = " + minlon + "/" + maxlon)
  print("Actual     min/max xlon = " + xlon(loc(1,0)-1,loc(0,0)-1) + "/" + \
                                       xlon(loc(1,1)-1,loc(0,1)-1))
  print("Calculated min/max xlon = " + latlon(0,0) + "/" + latlon(0,1))

  print("----")
  print("Requested  min/max xlat = " + minlat + "/" + maxlat)
  print("Actual     min/max xlat = " + xlat(loc(1,0)-1,loc(0,0)-1) + "/" + \
                                       xlat(loc(1,1)-1,loc(0,1)-1))
  print("Calculated min/max xlat = " + latlon(1,0) + "/" + latlon(1,1))
  print("----")

   Example 3

   Have the "loc" values returned as floating point values, rather than
   integers:

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a   = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  res = True
  res@returnInt = False                             ; return real values
  loc  = wrf_user_ll_to_ij(a, -100.0, 40.0, res)
  print("X/Y location is: " + loc)

   Example 4

   As of NCL V6.0.0, you can retrieve ij coordinates from a list of WRF
   ARW NetCDF files:

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  files = systemfunc("ls -1 wrfout_d01_2000*") + ".nc"
  a = addfiles(files,"r")

  res = True
  res@returnInt = False                             ; return real values
  loc  = wrf_user_ll_to_ij(a, -100.0, 40.0, res)
  print("X/Y locations are: " + loc)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/

   Example 5

   To see a graphical example of using wrf_user_ll_to_ij, see example
   "wrf_debug_4.ncl" on the Debugging WRF grids page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

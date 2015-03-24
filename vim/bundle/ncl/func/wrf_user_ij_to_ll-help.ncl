THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_user_ij_to_ll.shtml
THE_TITLE:wrf_user_ij_to_ll
   NCL Home > Documentation > Functions > WRF, Lat/Lon functions

wrf_user_ij_to_ll

   Finds the nearest longitude, latitude locations to the specified model
   grid indices (i,j).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_user_ij_to_ll (
                file_handle  : file or list [list added in V6.0.0],
                i            : numeric,
                j            : numeric,
                opt          : logical
        )

        return_val  :  float or double

Arguments

   file_handle

   Reference to an input netCDF file opened with addfile, or, as of
   V6.0.0, can be a list of NetCDF files opened with addfiles.
   i
   j

   Arrays of I and J indexes for which longitude and latitude locations
   are required. These index values are Fortran-based, so the index count
   starts at 1 (and not 0 like it does in NCL).
   opt

   A logical scalar containing attributes. See description below.

Return value

   An array that holds the lon, lat locations to the input i, j indexes.
   If a single i, j location is used as input, the return value will have
   a dimension of 2, where the first element holds the lon location and
   the second element holds the lat location.

   If an array of i, j values are used on input, the return value will be
   2 x n, where n is the size of the input arrays.

Description

   This function makes use of map projection information out of the input
   file (nc_file) to locate the lon/lat locations which corresponds to the
   input i/j locations. Note that if the i/j locations are outside your
   model domain, the returned lon/lat locations will represent a point
   outside the domain. These index values are Fortran-based, so the index
   count starts at 1 (and not 0 like it does in NCL).
     * useTime - which time in the file should be used when extracting
       XLAT/XLONG arrays from input file. Only important to set if output
       is for a moving nest and all the output times are in a single
       wrfout file

   wrf_user_ij_to_ll is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_ll_to_ij, wrf_ll_to_ij, wrf_ij_to_ll, wrf_user_getvar,
   wrf_user_intrp2d, wrf_user_intrp3d, wrf_user_list_times,
   wrf_user_unstagger

   See the full list of WRF functions.

Examples

   Example 1


  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a   = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
  loc = wrf_user_ij_to_ll(a, 10., 30., True)
  print("lon location is: " + loc(0))
  print("lat location is: " + loc(1))

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

   As of NCL V6.0.0, you can retrieve ij coordinates from a list of WRF
   ARW NetCDF files:

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  files = systemfunc("ls -1 wrfout_d01_2000*") + ".nc"
  a = addfiles(files,"r")

  loc = wrf_user_ij_to_ll(a, 10., 30., True)
  print("lon/lat locations are: " + loc)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

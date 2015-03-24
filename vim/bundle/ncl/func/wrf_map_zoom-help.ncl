THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_map_zoom.shtml
THE_TITLE:wrf_map_zoom
   NCL Home > Documentation > Functions > WRF, Graphics routines

wrf_map_zoom

   Zooms into a portion of the ARW WRF model domain, and creates a map
   background (deprecated in version 5.1.0).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_map_zoom (
                wks      : graphic,
                nc_file  : file,
                res      : logical,
                y_start  : integer,
                y_end    : integer,
                x_start  : integer,
                x_end    : integer
        )

        return_val [1] :  graphic

Arguments

   wks

   An NCL Workstation identifier. The identifier is one returned either
   from calling gsn_open_wks or calling create to create a Workstation
   object.
   nc_file

   Reference to an input netCDF file opened with addfile.
   res

   A variable containing an optional list of plot resources, attached as
   attributes.
   y_start
   y_end

   Start and end values of the y (S-N) locations of the zoomed area of
   interest.
   x_start
   y_end

   Start and end values of the x (W-E) locations of the zoomed area of
   interest.

Return value

   A scalar id of the map created is returned.

Description

   This procedure will be deprecated in version 5.1.0. Use the "ZoomIn"
   resource in wrf_map instead.

   This function zooms into a portion of the ARW WRF model domain, and
   creates a map background for this area.

   wrf_map_zoom is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   WRF-related questions should be sent to wrfhelp@ucar.edu.

See Also

   wrf_map, wrf_map_overlays

Examples

   Example 1

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  wks = gsn_open_wks("x11","test")

  ter = wrf_user_getvar(a,"HGT",0)
  dims = dimsizes(ter)

  ; As an example, we are looking for the lower right 1/4 of the domain
  x_start = dims(1)/2
  x_end   = dims(1)-1
  y_start = 0
  y_end   = dims(0)/2

  map_zoom = wrf_map_zoom(wks,a,True,y_start,y_end,x_start,x_end)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

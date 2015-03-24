THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_map_overlay.shtml
THE_TITLE:wrf_map_overlay
   NCL Home > Documentation > Functions > WRF, Graphics routines

wrf_map_overlay

   Overlays different plot id's over a map background (deprecated in
   version 5.1.0).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        procedure wrf_map_overlay (
                wks       : graphic,
                map       : graphic,
                plots [*] : graphic,
                res   [1] : logical
        )

Arguments

   wks

   An NCL Workstation identifier. The identifier is one returned either
   from calling gsn_open_wks or calling create to create a Workstation
   object.
   map

   Graphical map background, possibly created by a call to wrf_map.
   plots

   Plots to overlay over map background, possibly created by calls to
   wrf_contour and/or wrf_vector.
   res

   A plot resource. Set to True if you want to advance the frame before
   creating the next frame. Set to False if you do not want to advance the
   frame. Use False only if you plan on adding additional
   text/lines/symbols to the frame before advancing it.

Description

   This procedure will be deprecated in version 5.1.0. Use the much more
   versatile function wrf_map_overlays instead.

   Overlay a number of graphical plots over a map background on the given
   workstation.

   wrf_map_overlay is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   WRF-related questions should be sent to wrfhelp@ucar.edu.

See Also

   wrf_contour, wrf_vector, wrf_map, wrf_overlay

Examples

   Example 1

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  wks = gsn_open_wks("x11","test")

  time = 1
  slp = wrf_user_getvar(a,"slp",time)  ; slp
        wrf_smooth_2d( slp, 3 )        ; smooth slp

  tc2 = wrf_user_getvar(a,"T2",time)   ; T2 in Kelvin
  u10 = wrf_user_getvar(a,"U10",time)  ; u at 10 m
  v10 = wrf_user_getvar(a,"V10",time)  ; v at 10 m

  map = wrf_map(wks,a,True)

  rest = True
  rest@cnFillOn = True
  contour_t = wrf_contour(a,wks,tc2,rest)

  resp = True
  resp@cnLineColor = "NavyBlue"
  contour_p = wrf_contour(a,wks,slp,resp)

  resw = True
  vector = wrf_vector(a,wks,u10,v10,resw)

  wrf_map_overlay(wks,map,(/contour_t,contour_p,vector/),True)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_overlays.shtml
THE_TITLE:wrf_overlays
   NCL Home > Documentation > Functions > WRF, Graphics routines

wrf_overlays

   Overlays multiple plots, created from other ARW WRF plot functions.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_overlays (
                nc_file   : file,
                wks       : graphic,
                plots [*] : graphic,
                res   [1] : logical
        )

Arguments

   nc_file

   Reference to an input netCDF file opened with addfile.
   wks

   An NCL Workstation identifier. The identifier is one returned either
   from calling gsn_open_wks or calling create to create a Workstation
   object.
   plots

   Plots to overlay, possibly created by calls to wrf_contour and/or
   wrf_vector.
   res

   A plot resource list. See the description below.

Description

   This function overlays a number of graphical plots, and returns the
   base plot that contains all the overlaid plots. This is typically used
   for idealized ARW WRF model runs.

   Some special resources are recognized for the res resource list:
     * NoTitles (default: False)
       If set to True, then the top left titles will not be drawn. The
       main titles will be left alone.
       This resource can be useful if you are planning to panel the plots.
     * CommonTitle (default: True)
       If set to False, then the top field titles will not be drawn.
     * FramePlot (default: True)
       If set to False, then the plot will be drawn, but the frame will
       not be advanced. This allows you to draw more graphical objects on
       the same page.
     * PanelPlot (default: False)
       If set to True, then this flags to wrf_map_overlays that these
       plots are going to be eventually paneled (likely by gsn_panel.
       Hence, the plot will not be drawn, nor will the frame be advanced,
       unless gsnDraw and/or gsnFrame are explicitly set to True.

   If you want to use gsn_add_polyxxxx routines (like gsn_add_polymarker)
   to add primtives to a WRF plot, then you need to set:

plt_res@PanelPlot = True
plt_res@FramePlot = False

   before you call wrf_map_overlays. Then, call the appropriate
   gsn_add_polyxxxx routine to attach the desired primitives, and finally
   call draw(plot) and frame(wks) to draw the plot with the attached
   primitives and advance the frame.

   wrf_overlays is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data. This
   function replaces wrf_overlay.

   WRF-related questions should be sent to wrfhelp@ucar.edu.

See Also

   wrf_contour, wrf_vector, wrf_map, wrf_map_overlays

Examples

   Example 1

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  ; Open ARW WRF output for the quater supercell idealized case
  a = addfile("wrfout_qss.nc","r")

  wks = gsn_open_wks("x11","test")

  time = 1
  tc2 = wrf_user_getvar(a,"T2",time)   ; T2 in Kelvin
  u10 = wrf_user_getvar(a,"U10",time)  ; u at 10 m
  v10 = wrf_user_getvar(a,"V10",time)  ; v at 10 m

  rest = True
  rest@cnFillOn = True
  contour = wrf_contour(a,wks,tc2,rest)

  resw = True
  vector = wrf_vector(a,wks,u10,v10,resw)

  overid = wrf_overlays(a,wks,(/contour,vector/),True)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

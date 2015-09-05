THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_map_overlays.shtml
THE_TITLE:wrf_map_overlays
   NCL Home > Documentation > Functions > WRF, Graphics routines

wrf_map_overlays

   Overlays different contour and vector plots over a WRF-ARW map
   background.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_map_overlays (
                nc_file     : file,
                wks         : graphic,
                plots   [*] : graphic,
                plt_res [1] : logical,
                map_res [1] : logical
        )

Arguments

   nc_file

   Reference to an input netCDF file opened with addfile.
   wks

   An NCL Workstation identifier. The identifier is one returned either
   from calling gsn_open_wks or calling create to create a Workstation
   object.
   plots

   Plots to overlay over map background, possibly created by calls to
   wrf_contour and/or wrf_vector.
   plt_res

   A plot resource list. See the description section below for more
   information.
   map_res

   A map resource list. See the description section below for more
   information.

Description

   This function creates a map background, and overlays the given
   graphical plots. It then returns the map plot that contains all the
   overlaid plots.

   Some special resources are recognized for the plt_res resource list:
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
     * LatLonOverlay (default: False)
       If set to True, then this flags to the function that the XLAT/XLONG
       values on the NetCDF file are being used to do the overlay, via the
       special resources sfXArray / sfYArray for wrf_contour, or vfXArray
       / vfYArray for wrf_vector.
       Setting these resources allows you to further zoom in on the
       default map created by this function. This is an alternate to using
       the ZoomIn attribute. The ZoomIn method may make your code run
       faster, but is more cumbersome to use.
       See example #2 below.

   Some special resources are recognized for the map_res resource list:
     * ZoomIn - default is False
       If this resource is set to True, then this indicates you want to
       further zoom in on the default map created by this function. You
       need to also set these special attributes:
          + Ystart,Xstart - default is (0,0)
            Set this pair to the index values in the 2-dimensional
            latitude/longitude arrays that represents the minimum
            latitude/longitude value you want to zoom in on.
          + Yend,Xend - default is (nlat-1,nlon-1) Set this pair to the
            index values in the 2-dimensional latitude/longitude arrays
            that represents the maximum latitude/longitude value you want
            to zoom in on.
            The above four index values can be calculated using
            wrf_user_ll_to_ij.
            You can alternatively use the "LatLonOverlay" method described
            above. Using the "ZoomIn" attribute may make your code run
            faster, but is a little more cumbersom to use.
       Here's an example of using this resource.
     * mpNestTime - default is 0, allows you to set the index of the
       desired time step, and the lat/lon values associated with this
       timestep will be used for the map projection.

   wrf_map_overlays is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data. This
   function replaces wrf_map_overlay.

   If you want to use gsn_add_polyxxxx routines (like gsn_add_polymarker)
   to add primtives to a WRF plot, then you need to set:

plt_res@PanelPlot = True
plt_res@FramePlot = False

   before you call wrf_map_overlays. Then, call the appropriate
   gsn_add_polyxxxx routine to attach the desired primitives, and finally
   call draw(plot) and frame(wks) to draw the plot with the attached
   primitives and advance the frame.

   WRF-related questions should be sent to wrfhelp@ucar.edu.

See Also

   wrf_contour, wrf_vector, wrf_overlays, wrf_map_resources

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

  rest = True
  rest@cnFillOn = True
  contour_t = wrf_contour(a,wks,tc2,rest)

  resp = True
  resp@cnLineColor = "NavyBlue"
  contour_p = wrf_contour(a,wks,slp,resp)

  resw = True
  vector = wrf_vector(a,wks,u10,v10,resw)

  over_id = wrf_map_overlays(a, wks,(/contour_t,contour_p,vector/),True,True)

   Example 2

   This example shows how to zoom in on a map by using the XLAT/XLONG
   arrays on the file, and the special "LatLonOverlay" attribute:

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

begin
;---Open WRF output file and read data
  dir      = "./"
  filename = "wrfout.nc"
  a = addfile(dir + filename,"r")

  times  = wrf_user_list_times(a)  ; get times in the file
  ntimes = dimsizes(times)         ; number of times in the file

;---Just look at first time step.
  it = 0
  print("Working on time: " + times(it) )

;---Read temperature and terrain height off file
  tc    = wrf_user_getvar(a,"tc",it)     ; T in C
  lat2d = wrf_user_getvar(a,"XLAT",it)   ; latitude
  lon2d = wrf_user_getvar(a,"XLONG",it)  ; longitude
  dims = dimsizes(tc)

;---Start the graphics
  wks = gsn_open_wks("x11","wrf_latlonoverlay")

;---Set some basic plot options
  opts = True
  opts@MainTitle                   = "REAL-TIME WRF"

  pltres = True
  mpres  = True

  opts@TimeLabel = times(it)   ; Set valid time to use on plots

;----------------------------------------------------------------------
; Plot full domain first.
;----------------------------------------------------------------------
  opts@cnFillOn = True

  contour = wrf_contour(a,wks,tc(it,:,:),opts)
  plot = wrf_map_overlays(a,wks,(/contour/),pltres,mpres)

;----------------------------------------------------------------------
; Plot partial domain.
;----------------------------------------------------------------------
  opts@sfXArray = lon2d
  opts@sfYArray = lat2d

  contour = wrf_contour(a,wks,tc(it,:,:),opts)

;---Set special resource to indicate we are using XLAT/XLONG coordinates.
  pltres@LatLonOverlay = True

;---Zoom in on map, which we can do because we're using lat/lon coordinates.
  mpres@mpLeftCornerLatF  =  30.
  mpres@mpRightCornerLatF =  35.
  mpres@mpLeftCornerLonF  = -85.
  mpres@mpRightCornerLonF = -80.

  plot = wrf_map_overlays(a,wks,(/contour/),pltres,mpres)
end


   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

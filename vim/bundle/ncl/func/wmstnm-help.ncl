THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wmstnm.shtml
THE_TITLE:wmstnm
   NCL Home > Documentation > Functions > Graphics routines

wmstnm

   Plots station model data on the given workstation.

Prototype

        procedure wmstnm (
                wks    : graphic,
                x      : float,
                y      : float,
                imdat  : string    ; of 50 characters
        )

Arguments

   wks

   An NCL workstation identifier specifying where you want to draw your
   station model data. The wks identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.

   x
   y

   World coordinate values specifying the center position of the base of
   the wind barb shaft. These may be multi-dimensioned arrays. They must
   have the same shape.
   imdat

   A string (or array) of 50 characters encoded as per the WMO/NOAA
   guidelines. If an array, it must have the same shape as the x and y
   arrays. In more detail (where the characters are numbered from left to
   right, starting at character number 0):

       character 0    = i[R] - the precipitation data indicator
       character 1    = i[X] - weather data and station type indicator
       character 2    =  h   - height above ground of base of lowest cloud
       characters 3-4 =  VV  - visibility in miles and fractions
       character 5    =  N   - total amount of cloud cover
       characters 6-7 =  dd  - direction from which wind is blowing
       characters 8-9 =  ff  - wind speed in knots

   If character 10 = "1", then

       character 11     = s[n] - sign of temperature
       characters 12-14 = TTT  - current air temperature

   If character 15 = "2", then

       character 16     = s[n] - sign of temperature
       characters 17-19 = T[d] - dew point

   If character 20 = "3", then

       characters 21-24 = PO - station pressure (not plotted)

   If character 25 = "4", then

       characters 26-29 = PPPP - pressure reduced to sea level

   If character 30 = "5", then

       character 31     =  a  - characteristic of barograph
       characters 32-34 = ppp - pressure change, last 3 hrs.

   If character 35 = "6", then

       characters 36-38 = RRR  - precipitation
       character 39     = t[R] - time duration of precipitation

   If character 40 = "7", then

       characters 41-42 =  ww  - present weather
       character 43     = W[1] - most significant past weather
       character 44     = W[2] - 2nd most sig. past weather

   If character 45 = "8", then

       character 46 = N[h] - Fraction of sky cover
       character 47 = C[L] - cloud type, low clouds
       character 48 = C[M] - cloud type, medium clouds
       character 49 = C[H] - cloud type, high clouds

Description

   The procedure wmstnm
   uses the WMSTNM routine from the Wmap package to plot station model
   data.

   The appearance of the wind barbs that are part of the station model
   data is controlled by the parameters that control wind barbs. See the
   procedure wmbarb for details.

   It is frequently the case that station model data are drawn over a
   world map. See Example 2 below for an example. Also, see example 5, and
   example 6 in the weather symbols application page.

   In addition to the wind barb parameters, the parameters VVC, WBC, WBL,
   and UNT apply to the station model display. WBC specifies the diameter
   of the sky cover circle at the base of the wind barb, WBL specifies the
   size of the text labels in the station model display, and UNT specifies
   whether you want to use Imperial units (the default) or metric units.

   The procedure wmsetp is used to set parameter values, and the function
   wmgetp is used to retrieve parameter values.

   The procedure wmstnm does not call frame.

See Also

   wmbarb, wmbarbmap, wmdrft, wmgetp, wmlabs, wmetp

Examples

   Example 1

   See example 1, in the weather symbols application page. The latter two
   examples show plotting station model data over a map.

   Example 2

load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

;
;  Draw station model data over a map.
;
begin

;
;  Define a color map and create an X11 workstation.
;
  cmap = (/                      \
            (/ 1., 1., 1. /),    \  ; color index 0 - white
            (/ 0., 0., 0. /)     \  ; color index 1 - black
         /)
  wks = gsn_open_wks("x11","test_wmap")
  gsn_define_colormap(wks,cmap)

;
;  Specify the station model data.
;
  imdat="11212800201001120000300004014752028601117706086792"

;
;  Create a map over the central United States, but do not draw it.
;
  resources = True
  resources@gsnFrame     = False            ; Turn off drawing
  resources@mpProjection = "Stereographic"
  resources@mpCenterLonF = -95.0
  resources@mpCenterLatF =  90.0
  resources@mpLimitMode  = "Corners"        ; Limit the map view.
  resources@mpLeftCornerLonF  = -103.722
  resources@mpLeftCornerLatF  =   33.968
  resources@mpRightCornerLonF =  -82.5161
  resources@mpRightCornerLatF =   49.054
  resources@mpOutlineBoundarySets   = "AllBoundaries"
  resources@mpUSStateLineThicknessF = 1.25
  resources@mpGridAndLimbOn = False
  resources@vpXF      = 0.15
  resources@vpYF      = 0.85
  resources@vpWidthF  = 0.7
  resources@vpHeightF = 0.7
  map = gsn_map(wks,"Stereographic",resources)

;
;  Specify the size of the wind barb (this scales the entire
;  station model data plot.
;
  wmsetp("wbs",0.12)

;
;  Since we want to plot the station model data over a map
;  projection, we have to inform NCL that that is what we
;  are doing.  Setting a value for the internal parameter
;  "ezf" to something other that its default of -1 does this.
;  In addition to this, setting "ezf" will also attenuate the
;  direction of the wind barb based on its latitude.  For
;  example, a wind direction of due north (as in this example)
;  will show the wind barb pointing in the direction of the
;  north pole, rather than straight up.  More accurately, the
;  barb is drawn on the map so that it is tangent to the projection
;  of the local meridian and points northward along that meridian.
;
  wmsetp("ezf",1)

;
;  Station model.
;
  wmstnm(wks,40.5,-92.5,imdat)

;
;  Draw the plot.
;
  frame(wks)

end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

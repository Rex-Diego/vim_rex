THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wmdrft.shtml
THE_TITLE:wmdrft
   NCL Home > Documentation > Functions > Graphics routines

wmdrft

   Draws weather front lines on the given workstation.

Prototype

        procedure wmdrft (
                wks [1] : graphic,
                y   [*] : float,
                x   [*] : float
        )

Arguments

   wks

   An NCL workstation identifier specifying where you want to draw your
   front lines. The wks identifier is one returned either from calling
   gsn_open_wks or calling create to create a Workstation object.

   y

   A one-dimensional array specifying Y-coordinate values of points along
   the front line. If the internal parameter EZF is set to a non-default
   value (i.e. this function is being used in conjunction with an NCL
   mapping function), then the Y-coordinate values are assumed to be
   longitudes expressed in degrees. Otherwise the Y-coordinates are
   assumed to be in NCL data units. The Y-coordinates appear in the
   argument list here before the X-coordinates to be compatible with the
   ordering of the latitudes before longitudes in the case EZF is
   non-default.
   x

   A one-dimensional array specifying X-coordinate values of points along
   the front line. If the internal parameter EZF is set to a non-default
   value (i.e. this function is being used in conjunction with an NCL
   mapping function), then the X-coordinate values are assumed to be
   latitudes expressed in degrees. Otherwise the X-coordinates are assumed
   to be in NCL data units.

Description

   The procedure wmdrft uses the WMDRFT routine from the Wmap package to
   draw weather front lines.

   The specified coordinate values are used as control points for a spline
   curve fit. The curve passes through the given coordinates. If the front
   has little curvature, then only a few points need to be specified to
   get a nice smooth curve.

   For details on drawing weather fronts, see the section on drawing front
   lines in the wmap documentation for the lower level utilities.

   Certain parameters may be set to control the appearance of the front
   lines. The procedure wmsetp is used to set parameter values, and the
   function wmgetp is used to retrieve parameter values. The parameters
   applicable to wmdrft are:
   EZF - to flag that wmdrft is to be used in conjunction with an NCL
   mapping function
   ARC - length of the front line (retrieval only)
   ALO - surface front or aloft
   BEG - space before first symbol on front line
   END - space after last symbol on front line
   BET - space between symbols on a front line
   COL - global color index
   CFC - color index for cold front symbols
   CS1 - calculated slope at beginning of front line
   CS2 - calculated slope at end of front line
   DWD - line widths for certain fronts
   FRO - type of front
   LIN - line widths for the more common fronts
   NBZ - number of points along a Bazier curve
   NMS - number of symbols along a front line
   REV - reverses direction of front symbols
   SLF - flag for end slopes
   SL1 - slope at beginning of front line
   SL2 - slope at end of front line
   STY - specify type of symbols along a front line
   SWI - widths of symbols along a front line
   T1C - colors for tropical fronts
   T2C - colors for tropical fronts
   WFC - color index for warm front symbols

   The procedure wmdrft does not call frame.

See Also

   wmbarb, wmbarbmap, wmgetp, wmlabs, wmsetp, wmstnm

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

;
;  Draw a weather front and a couple of "High" symbols
;  on a satellite view map projection.
;
begin

;
;  Create a color map and an X11 workstation.
;
  cmap = (/                      \
            (/ 1., 1., 1. /),    \  ; 0 - White background.
            (/ 0., 0., 0. /),    \  ; 1 - Black foreground.
            (/ 1., 0., 0. /),    \  ; 2 - Red.
            (/ 0., 0., 1. /),    \  ; 3 - Blue.
            (/ 0., 1., 1. /),    \  ; 4 - Cyan.
            (/ 1., 0., 1. /)     \  ; 5 - Magenta.
         /)
  wks = gsn_open_wks("x11","test_wmap")
  gsn_define_colormap(wks,cmap)

;
;  Create a satellite view projection.
;
  map_resources = True
  map_resources@gsnFrame = False
  map_resources@mpOutlineBoundarySets = "National"
  map_resources@mpNationalLineColor = 1
  map_resources@mpGridLineColor = 0
  map_resources@mpCenterLatF =   40.
  map_resources@mpCenterLonF = -105.
  map_resources@vpXF = 0.06
  map_resources@vpYF = 0.90
  map_resources@vpWidthF = 0.88
  map_resources@vpHeightF = 0.88
  map = gsn_map(wks,"Satellite",map_resources)

;
;  Draw a stationary front.
;
  wmsetp("ezf",1)           ; Tell wmap we are using an existing map projection.
  wmsetp("lin",1.0)         ; Line width of front curve.
  wmsetp("fro","stationary"); Specify stationary front.
  wmsetp("cfc",3)           ; Use blue for the triangles.
  wmsetp("wfc",2)           ; Use red for the bumps.
  wmsetp("swi",0.04)        ; Increase the size of the bumps and triangles.
  xlat = (/  20.,   30.,   35.,   40.,  45. , 50./)   ; Latitudes.
  xlon = (/-195., -125., -115., -105., -95., -85./)   ; Longitudes.
  wmdrft(wks, xlat, xlon)   ; Draw front.

;
;  Draw a couple of High symbols.
;
  wmsetp("hib",4)              ; Cyan for background.
  wmsetp("his",1)              ; Black for shadow.
  wmsetp("hic",5)              ; Magenta for bounding circle.
  wmsetp("sht",0.02)           ; Increase size.
  xl = (/  50.,  50./)         ; Latitudes.
  yl = (/-105.,-145./)         ; Longitudes.
  wmlabs(wks, xl, yl, "HI")    ; Draw symbols.
  frame(wks)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

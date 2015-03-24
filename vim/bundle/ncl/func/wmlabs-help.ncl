THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wmlabs.shtml
THE_TITLE:wmlabs
   NCL Home > Documentation > Functions > Graphics routines

wmlabs

   Plots special symbols and icons for daily weather.

Prototype

        procedure wmlabs (
                wks [1] : graphic,
                x   [*] : float,
                y   [*] : float,
                sym [1] : string
        )

Arguments

   wks

   An NCL workstation identifier specifying where you want to draw your
   symbols. The wks identifier is one returned either from calling
   gsn_open_wks or calling create to create a Workstation object.

   x

   A one-dimensional array specifying X-coordinate values of points where
   symbols are to be drawn. If the internal parameter EZF is set to a
   non-default value (i.e. this function is being used in conjunction with
   an NCL mapping function), then the X-coordinate values are assumed to
   be latitudes expressed in degrees. Otherwise the X-coordinates are
   assumed to be in NCL data units.
   y

   A one-dimensional array specifying Y-coordinate values of points where
   symbols are to be drawn. If the internal parameter EZF is set to a
   non-default value (i.e. this function is being used in conjunction with
   an NCL mapping function), then the Y-coordinate values are assumed to
   be longitudes expressed in degrees. Otherwise the X-coordinates are
   assumed to be in NCL data units.
   sym

   Specifies what symbol is to be drawn.

Description

   The procedure wmlabs uses the WMLABS routine from the Wmap package to
   plot special symbols and icons for daily weather.

   The procedure wmlabs is used to draw special weather map symbols, such
   as high and low pressure indicators, arrows, dots, weather icons, cloud
   symbols, lightning bolts, and a sun.

   For details on drawing weather symbols, see the section on drawing
   symbols in the wmap documentation for the lower level utilities.

   Certain parameters may be set to control the appearance of the various
   symbols. The procedure wmsetp is used to set parameter values, and the
   function wmgetp is used to retrieve parameter values. The parameters
   applicable to wmlabs are:
   EZF - to flag that wmlabs is to be used in conjunction with an NCL
   mapping function
   ARS, AWC, ARD, ASC, AOC, ARC - for arrows
   SHT, HIF, HIB, HIS, HIC - for high symbols
   SHT, LOF, LOB, LOS - for low symbols
   ARS, AWC, ARD, ASC, AOC, ARL - for arrows
   COL, SHT, - for icons
   DBC, DTC, DTS - for dots
   CC1, CC2, CC3 - for clouds
   LC1, LC2, LC3 - for lightning bolts
   SC1, SC2, SC3, SC4 - for suns

   The procedure wmlabs does not call frame.

See Also

   wmbarb, wmbarbmap, wmdrft, wmgetp, wmlabs, wmstnm

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

;
;  Draw some symbols.
;
begin

;
;  Define a color map and create an X11 workstation.
;
  cmap = (/                      \
            (/ 1., 1., 1. /),    \  ; color index 0 - white
            (/ 0., 0., 0. /),    \  ; color index 1 - black
            (/ 0., 1., 1. /),    \  ; color index 2 - cyan
            (/ 1., 1., 0. /),    \  ; color index 3 - yellow
            (/ 1., 0., 0. /),    \  ; color index 4 - red
            (/ 1., 0., 1. /),    \  ; color index 5 - magenta
            (/ 0., 0., 1. /),    \  ; color index 6 - blue
            (/ .8, .8, .8 /)     \  ; color index 7 - gray
         /)
  wks = gsn_open_wks("x11","test_wmap")
  gsn_define_colormap(wks,cmap)

;
;  Draw some cloud symbols at random locations.
;
  nums = 200
  wmsetp("cc1",7)     ; Interior of cloud is gray.
  wmsetp("cc2",1)     ; Cloud outline black.
  wmsetp("cc3",6)     ; Cloud shadow blue.
  wmsetp("sht",0.007) ; Set size.

  x = new(nums,float)
  y = new(nums,float)
  s = new(nums,float)
  do i=0,nums-1
    x(i) = rand()/32767.
    y(i) = rand()/32767.
  end do
  wmlabs(wks, x, y, "CLOUD")  ; Draw clouds.

;
;  Draw some suns at random positions and with random sizes.
;
  wmsetp("sc1",3)    ; Yellow for sun center.
  wmsetp("sc2",4)    ; Red for points on sun.
  wmsetp("sc3",1)    ; Black for sun outline.
  wmsetp("sc4",6)    ; Blue for sun shadow.
  do i=0,nums/2
    x(i) = rand()/32767.
    y(i) = rand()/32767.
    size = 0.02*rand()/32767.
    wmsetp("sht",size)              ; Random size.
    wmlabs(wks, x(i), y(i), "SUN")  ; Draw sun.
  end do

  frame(wks)

end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

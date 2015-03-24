THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlNewMarker.shtml
THE_TITLE:NhlNewMarker
   NCL Home > Documentation > Functions > Graphics routines

NhlNewMarker

   Adds new markers to the existing table of markers.

Prototype

        function NhlNewMarker (
                wks            [*] : graphic,
                marker_strings [*] : string,
                font_num       [*] : integer,
                xoffset        [*] : numeric,
                yoffset        [*] : numeric,
                aspect_ratio   [*] : numeric,
                size           [*] : numeric,
                angle          [*] : numeric
        )

        return_val  :  integer

Arguments

   wks

   An array of NCL Workstation identifiers. The identifiers are ones
   returned either from calling gsn_open_wks or calling create to create a
   Workstation object.

   marker_strings

   A list of strings (length nmarkers) indicating the markers to create.
   font_num

   A scalar or 1D array of length nmarkers containing font table numbers
   indicating which font table to use for each marker string.
   xoffset
   yoffset

   Scalars or 1D arrays of length nmarkers that are the X and Y offsets of
   the markers. The values must be between -1 and 1. Set to 0.0 if you
   don't want to offset the marker.
   aspect_ratio

   A scalar or 1D array of length nmarkers that is the aspect ratio of
   each marker (must be greater than 0). A value greater than 1 stretches
   the marker in the vertical direction, and a value less than 1 stretches
   it in the horizontal direction. Set this to 1.0 to get the default
   aspect ratio.
   size

   A scalar or 1D array of length nmarkers that is a size multiplier for
   the default marker size (must be greater than 0). A value of 2 doubles
   the marker size, and value of 0.5 halves the marker size. Set this to
   1.0 to get the default size.
   angle

   A scalar or 1D array of length nmarkers that is the angle at which to
   rotate each marker counter-clockwise; it must be greater than or equal
   to 0. Set this to 0.0 for no rotation.

Return value

   If nwks is the length of wks and nmarkers is the length of
   marker_strings, then the array returned will be dimensioned nwks x
   nmarkers if there is more than one workstation. Otherwise, it will be
   an array of length nmarkers.

Description

   Given a list of workstation objects, a list of markers and font table
   numbers, and values for the X/Y offsets, sizes, aspect ratios, and
   angles, this function adds the given markers to the current marker
   table, and returns a list of unique indexes that represent the
   locations of the new markers in the marker table.

   You can use these new markers in any resource that allows you to set a
   marker index.

   The markers can be selected from any one of the characters in the many
   font tables. If you like one of the existing markers, but just want to
   tweak some aspect of it, then below is a table that lists each marker
   index along with the character, font number, X and X offsets, and
   aspect ratio used for each marker.

   index description character font
   table X offset Y offset aspect
   ratio size angle
   1 dot (small filled circle) Z 37 0.0 0.0 1.3125 0.175 0.0
   2 plus sign + 18 0.0 0.075 1.3125 0.95 0.0
   3 asterisk * 1 0.0 0.0 1.3125 1.0 0.0
   4 hollow circle x 19 0.0 0.075 1.3125 1.2 0.0
   5 cross (x) U 18 0.0 0.075 1.3125 1.1 0.0
   6 hollow square Z 19 0.0 0.083 1.3125 1.45 0.0
   7 up pointing triangle [ 19 0.0 0.03 1.5 1.25 0.0
   8 down pointing triangle X 19 0.0 0.87 2.15 0.67 0.0
   9 diamond \\ 19 0.0 0.075 1.0 1.15 0.0
   10 left pointing filled triangle ` 19 0.0 0.08 1.5 1.55 0.0
   11 right pointing filled triangle b 19 0.0 0.08 1.5 1.55 0.0
   12 five-pointed star ] 19 0.0 0.0625 1.3125 1.1 0.0
   13 six-pointed star m 19 0.0 0.0725 1.3125 1.1 0.0
   14 circle with center dot Z 18 0.0 0.0 1.3125 0.8 0.0
   15 circle with cross [ 37 0.0 0.0 1.3125 0.8 0.0
   16 filled circle Z 37 0.0 0.0 1.3125 0.8 0.0

   The values for xoffset and yoffset can be used to shift a marker
   slightly from its default location. For example, if you add a filled
   triangle (font table 34, letter 'u') to the marker table, you'll see
   that the default is such that the center of the triangle is the center
   location of this marker. If you want the tip of the triangle to be the
   center location instead, then tweak xoffset. An NCL script is given
   below that allows you to view an enlarged marker to determine if it
   needs to be adjusted.

   If any of xoffset, yoffset, aspect_ratio, size, or angle are entered as
   scalars, then they will be applied to all markers in the list.

See Also

   NhlNewDashPattern

Examples

   Example 1

   This example adds a filled square to the marker table and keeps all of
   its default settings:

  mstring = "y"
  fontnum = 35
  xoffset = 0.0
  yoffset = 0.0
  ratio   = 1.0
  size    = 1.0
  angle   = 0.0

  new_index = NhlNewMarker(wks, mstring, fontnum, xoffset, yoffset, ratio, size,
 angle)

   To make this same marker twice as high as it is wide, change the value
   for the ratio:
  ...
  ratio = 2.0
  ...
  new_index = NhlNewMarker(wks, mstring, xoffset, yoffset, ratio, size, angle)

   Example 2

   This example adds a filled triangle to the marker table and rotates it
   so that the tip is pointing to the right:
  mstring = "u"
  fontnum = 34
  xoffset = 0.0
  yoffset = 0.0
  ratio   = 1.0
  size    = 1.0
  angle   = 270.0

  new_index = NhlNewMarker(wks, mstring, fontnum, xoffset, yoffset, ratio, size,
 angle)

   To shift this rotated triangle so that the center location is more
   towards the center of the triangle, set the X offset value:
  xoffset = 0.37
  ...
  new_index = NhlNewMarker(wks, mstring, fontnum, xoffset, yoffset, ratio, size,
 angle)

   Note: the rotation is applied first, then the offsets.

   Example 3

   This example adds several markers, changes some of their default sizes,
   and leaves everything else alone:

  mstrings = (/"u","z","y","q","o","x"/)
  fontnums =  (/34, 35, 35, 37, 19, 19/)
  xoffset  = 0.0
  yoffset  = 0.0
  ratio    = 1.0
  sizes    = (/2.0,2.0,0.75,1.0,2.5,1.5/)
  angle    = 0.0

  new_indexes = NhlNewMarker(wks, mstrings, fontnums, xoffset, yoffset, ratio, s
izes, angle)

   new_indexes will be an integer array of length 6 (if wks is a single
   workstation object).

   Example 4

   This example draws an enlarged selected marker so that you can see it
   in more detail and determine if you want to adjust any of the offset,
   ratio, size, and/or angle parameters:
;
; This script allows you to view a marker up close and determine if
; you want to change anything about it, like the X/Y offsets, the
; aspect ratio, size, and/or angle.
;
; The code of interest for the user should be in the section that
; starts with the comment "Create new marker..."
;

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
;
; Open a workstation and change the color table.
;
  wks = gsn_open_wks("x11","marker")
  gsn_define_colormap(wks,"rainbow+gray")

  setvalues wks
    "wkForegroundColor" : (/0.,0.,0./)
    "wkBackgroundColor" : (/1.,1.,1./)
  end setvalues
;
; Create a blank canvas to place the marker on.
;
  canvas = create "canvas" logLinPlotClass wks
    "vpXF"                  : 0.0
    "vpYF"                  : 1.0
    "vpWidthF"              : 1.0
    "vpHeightF"             : 1.0
    "pmTickMarkDisplayMode" : "Always"
    "tmXMajorGrid"          : True
    "tmYMajorGrid"          : True
    "tmXMinorGrid"          : True
    "tmYMinorGrid"          : True
    "tmXMinorGridLineColor" : "Gray"
    "tmYMinorGridLineColor" : "Gray"
    "tmXMajorGridLineColor" : "Gray"
    "tmYMajorGridLineColor" : "Gray"
    "tmXBMode"              : "Manual"
    "tmYLMode"              : "Manual"
    "tmXBTickSpacingF"      : 0.05
    "tmYLTickSpacingF"      : 0.05
  end create
;
; Draw the canvas.  You should see grid lines at 0, 0.05, 0.1, ..., 1.
;
  draw(canvas)
;
; Draw bounding box that will enclose the marker.
;
  px = (/ 0.2 , 0.2 , 0.8 , 0.8 , 0.2 /)
  py = (/ 0.2 , 0.8 , 0.8 , 0.2 , 0.2 /)
  gsn_polyline(wks, canvas, px, py, False)

;
; Create a new marker, keeping all its default settings.
; This particular marker is a filled triangle.
;
  mstring = "u"
  fontnum = 34
  xoffset = 0.0
  yoffset = 0.0
  ratio   = 1.0
  size    = 1.0
  angle   = 0.0
  new_index = NhlNewMarker(wks,mstring,fontnum,xoffset,yoffset,ratio,size,angle)
;
; Draw new marker in the middle of the frame.
;
  mkres               = True
  mkres@gsMarkerSizeF = 0.5
  mkres@gsMarkerColor = "black"
  mkres@gsMarkerIndex = new_index
  gsn_polymarker(wks, canvas, 0.5, 0.5, mkres)

;
; Draw a little red cross showing center of marker. If you don't like
; where the center is, then you can go back and modify xoffset and/or
; yoffset above.
;
  lnres                  = True
  lnres@gsLineColor      = "red"
  lnres@gsLineThicknessF = 2.0

  xvert = (/0.45,0.55/)
  yvert = (/0.50,0.50/)
  xhorz = (/0.50,0.50/)
  yhorz = (/0.45,0.55/)
  gsn_polyline(wks, canvas, xvert, yvert, lnres)
  gsn_polyline(wks, canvas, xhorz, yhorz, lnres)

  frame(wks)   ; Advance the frame.
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

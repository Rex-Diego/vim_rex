THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wmbarb.shtml
THE_TITLE:wmbarb
   NCL Home > Documentation > Functions > Graphics routines

wmbarb

   Draws wind barbs on the given workstation.

Prototype

        procedure wmbarb (
                wks [1] : graphic,
                x   [*] : float,
                y   [*] : float,
                dx  [*] : float,
                dy  [*] : float
        )

Arguments

   wks

   An NCL workstation identifier specifying where you want to draw your
   wind barbs. The wks identifier is one returned either from calling
   gsn_open_wks or calling create to create a Workstation object.

   x
   y

   [In version 4.3.0 and later] Arrays of any dimensionality specifying X
   and Y coordinate values.
   dx
   dy

   [In version 4.3.0 and later] Arrays of any dimensionality specifying X
   and Y components of wind vectors at the associated (x,y) coordinates.

Description

   The procedure wmbarb uses the wind barb functions from the Wmap package
   to draw wind barbs.

   If you want to draw wind barbs over a map that are defined on gridded
   data, then you could use a vector plot with vcGlyphStyle set to
   "WindBarb". If you want to draw wind barbs over a map that are defined
   on non-gridded data, then use wmbarbmap.

   For the purposes of more fully explaining the arguments in the above,
   the end of a wind barb where the barbs are drawn will be called the
   feather end of the barb, and the opposite end will be called the tip.

   Using this terminology, the tip of a wind barb will be at coordinate
   (x,y), and the feather end will be at a point (y+s*dx,y+s*dy), where s
   is a positive scale factor chosen by the procedure to make the wind
   barb a standard length. The value of sqrt(dx**2+dy**2) determines the
   wind speed to use in drawing the barbs. The length of the shaft of the
   wind barb is controlled by the value of the internal parameter WBS (see
   below for how to change the value of WBS). The length of the shaft has
   no relation to the wind speed.

   For example, since by convention the feather end of a wind barb points
   in the direction where the wind is coming from, to draw a wind barb
   that indicates a wind coming from the north at 20 knots with tip at
   (0.,0.), you would make the call:
      wmbarb(wks,0.,0.,0.,20.)

   To shift the direction of how the wind barbs are drawn by 180 degrees,
   set the control parameter WDF to 1.

   To set parameters to control the appearance of a wind barb, such as its
   size, color, and so forth, use the wmsetp procedure. To retrieve
   parameter values, use the function wmgetp.

   The parameters applicable to wmbarb are: COL, EZF, WBF, WDF, WBA, WBC,
   WBD, WBR, WBS, WBT.

   The procedure wmbarb does not call frame.

   [In version 4.3.0 and later] Wind barbs are not plotted where the input
   data has missing values.

See Also

   wmbarbmap, wmdrft, wmgetp, wmlabs, wmsetp, wmstnm

Examples

   Example 1

   There are several examples on the weather symbols application page.

   Example 2

   The following code:
load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
;
;  Create an X11 workstation.
;
  wks = gsn_open_wks("x11","test")

;
;  Draw wind barbs.
;
  x = (/0.25, 0.75, 0.75, 0.25/)
  y = (/0.25, 0.25, 0.75, 0.75/)
  u = (/50., -50., -50.,  50./)
  v = (/50.,  50., -50., -50./)
  wmsetp("wbs",0.2)
  wmbarb(wks, x, y, u, v)
  frame(wks)
;
;  Get parameter value.
;
  size = wmgetp("wbs")
  print(size)
end

   will draw four wind barbs of the same magnitude, but at different
   locations and in different directions.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

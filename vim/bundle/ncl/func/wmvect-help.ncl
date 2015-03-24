THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wmvect.shtml
THE_TITLE:wmvect
   NCL Home > Documentation > Functions > Graphics routines

wmvect

   Draws vectors on the given workstation.

Prototype

        procedure wmvect (
                wks [1] : graphic,
                x   [*] : float,
                y   [*] : float,
                dx  [*] : float,
                dy  [*] : float
        )

Arguments

   wks

   An NCL workstation identifier specifying where you want to draw your
   vectors. The wks identifier is one returned either from calling
   gsn_open_wks or calling create to create a Workstation object.

   x
   y

   Arrays of any dimensionality specifying X and Y coordinate values.
   dx
   dy

   Arrays of any dimensionality specifying X and Y components of the
   vectors at the associated (x,y) coordinates.

Description

   The procedure wmvect uses the vector functions from the Wmap package to
   draw vectors.

   If you want to draw vectors over a map that are defined on gridded
   data, then you could use a vector plot with vcGlyphStyle set to one of
   the appropriate styles. If you want to draw vectors over a map that are
   defined on non-gridded data, then use wmvectmap.

   The base of the vector will be at world coordinate (X,Y). The arguments
   dx and dy specify the vector components in the X and Y directions.

   There are several parameters that control the vector apperance. The
   parameters VRS and VRN establish the relationship between vector
   lengths [the value sqrt(dx*dx+dy*dy)] and the length of the vector
   displayed on the plot. By default a vector length of 10. gets mapped to
   a line that is 2% of the maximum width of the output plot. You will
   most likely want to change these values.

   To set parameters to control the appearance of a vector, such as its
   color linewidth, and so forth, use the wmsetp procedure. To retrieve
   parameter values, use the function wmgetp.

   The parameters applicable to wmvect are:

    1. VCH - controls the vector arrow head size
    2. VCC - controls the vector color.
    3. VCW - controls the linewidth scale factor.
    4. VVA - controls the angle between the arrow and tail

   The procedure wmvect does not call frame.

   Vectors are not plotted where the input data has missing values.

See Also

   wmvectmap, wmvlbl

Examples

   Example 1

   See example 8 on the weather symbols application page.

   Example 2

   The following code:
load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
;
;  Draw four orthogonal vectors.
;
  cmap = (/                         \
            (/ 1.0, 1.0, 1.0 /),    \  ; color index 0 - white
            (/ 0.0, 0.0, 0.0 /),    \  ; color index 1 - black
            (/ 1.0, 0.0, 0.0 /),    \  ; color index 2 - red
            (/ 0.0, 0.0, 1.0 /)     \  ; color index 3 - blue
         /)

;
;  Create a PostScript workstation.
;
  wks = gsn_open_wks("ps","test")
  gsn_define_colormap(wks,cmap)

  x = new(4,float)
  y = new(4,float)
  x(:) = 0.5
  y(:) = 0.5

;
;  Set some vector parameter values.
;
  wmsetp("vrs - reference vector size",50.)
  wmsetp("vrn - NDC size of a reference vector size",0.3)
  wmsetp("vcc - vector color",2)
  wmsetp("vcw - vector linewidth scale factor",4.)
  u = (/50.,   0.,   0.,  -50./)
  v = (/ 0.,  50., -50.,    0./)
  wmvect(wks, x, y, u, v)

;
;  Mark origin.
;
  gsres = True              ; Indicate you want to set some resources.
  gsres@gsMarkerColor = 3   ; Change marker color.
  gsres@gsMarkerSizeF = 20. ; Increase marker size by a factor of 20.
  gsn_polymarker_ndc(wks,0.5,0.5,gsres)  ; Draw the polymarker.

;
;  Plot an informational label box.
;
  wmvlbl(wks, 0.8 ,0.2)

  frame(wks)
end


   draws four orthogonal vectors.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/datatondc.shtml
THE_TITLE:datatondc
   NCL Home > Documentation > Functions > Type converters

datatondc

   Converts data units into normalized device coordinates (NDCs).

Prototype

        procedure datatondc (
                plot  [1] : graphic,
                x_in  [*] : float,
                y_in  [*] : float,
                x_out [*] : float,
                y_out [*] : float
        )

Arguments

   plot

   A plot object that can be created by using one of the many gsn plotting
   functions, or by calling the NCL create language construct.
   x_in
   y_in

   One-dimensional arrays of x and y data coordinates. They must be the
   same length. For map plots, x_in corresponds to longitude values, and
   y_in corresponds to latitude values.
   x_out
   y_out

   (output)
   One-dimensional arrays of the same size as x_in and y_in. These will
   contain the x and y NDC output values.

Description

   The datatondc procedure uses the built-in transformation mapping
   feature of NCL plot objects to map data coordinates into Normalized
   Device Coordinates (NDCs).

   The datatondc procedure maps coordinate pairs from x_in and y_in and
   places the results in the corresponding elements of x_out and y_out
   respectively. Both x_out and y_out can be the same variables as x_in
   and y_in.

   When the data coordinates are outside of the data transformation
   specified in the plot, a missing value is placed in both of the
   corresponding indexes in the output arrays. The missing value chosen is
   either the x_in missing value, y_in missing value, or a system default.

See Also

   ndctodata, NhlDataToNDC

Examples

   Example 1

   This example creates and draws an XY plot, and then shows how to use
   datatondc to convert some data coordinates to NDC coordinates, and use
   these new coordinates to plot markers.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
;
; Create some dummy data.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

  wks = gsn_open_wks("x11","test")

  res             = True
  res@gsnMaximize = True

  xy = gsn_xy(wks,x,y,res)

  x_in  =  x
  y_in  = fabs(y)
  x_out = new(dimsizes(x_in),float)
  y_out = new(dimsizes(y_in),float)

  datatondc(xy,x_in,y_in,x_out,y_out)

;  print("data: (" + x_in + "," + y_in + ") NDC: (" + x_out + "," + y_out +")")

;
; Just for fun, see how you can now use these NDC coordinates to
; plot markers on the XY curve. Note, this can be done much
; easier by using gsn_polymarker directly; this example is just
; for illustration.
;
  draw(xy)

  gsres               = True
  gsres@gsMarkerColor = "HotPink"
  gsres@gsMarkerIndex = 14
  gsres@gsMarkerSizeF = 10.0
  gsn_polymarker_ndc(wks,x_out(::5),y_out(::5),gsres)

  gsres@gsMarkerColor = "Yellow"
  gsres@gsMarkerIndex = 11
  gsn_polymarker_ndc(wks,x_out(3::5),y_out(3::5),gsres)

  frame(wks)
end

   Example 2

   This example creates and draws a map plot, and then shows how to use
   datatondc to convert some longitude coordinates along a single latitude
   value to NDC coordinates. It also uses the reverse function, ndctodata,
   to convert the NDC coordinates back to the original values.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("x11","test")

  res             = True
  res@gsnMaximize = True

  map = gsn_map(wks,"CylindricalEquidistant",res)

  x_in = fspan(-180,180,10)
  y_in = new(dimsizes(x_in),float)
  y_in = 30.

  x_out = new(dimsizes(x_in),float)
  y_out = new(dimsizes(y_in),float)

  datatondc(map,x_in,y_in,x_out,y_out)
  print("data: (" + x_in + "," + y_in + ") NDC: (" + x_out + "," + y_out +")")


;
; Use ndctodata to go back to the original lat/lon coordinates. They
; should be the same as the original values.
;
  x_out2 = new(dimsizes(x_out),float)
  y_out2 = new(dimsizes(y_out),float)

  print("ndctodata")
  ndctodata(map,x_out,y_out,x_out2,y_out2)
  print("data: (" + x_in + "," + y_in + ") original data: (" + x_out2 + "," + y_
out2 +")")
end

   The output should be:
(0)     datatondc
(0)     data: (-180,30) NDC: (0.0200001,0.58)
(1)     data: (-140,30) NDC: (0.126667,0.58)
(2)     data: (-100,30) NDC: (0.233333,0.58)
(3)     data: (-60,30) NDC: (0.34,0.58)
(4)     data: (-20,30) NDC: (0.446667,0.58)
(5)     data: (20,30) NDC: (0.553333,0.58)
(6)     data: (60,30) NDC: (0.66,0.58)
(7)     data: (100,30) NDC: (0.766667,0.58)
(8)     data: (140,30) NDC: (0.873333,0.58)
(9)     data: (180,30) NDC: (0.98,0.58)
(0)     ndctodata
(0)     data: (-180,30) original data: (-180,30)
(1)     data: (-140,30) original data: (-140,30)
(2)     data: (-100,30) original data: (-100,30)
(3)     data: (-60,30) original data: (-60,30)
(4)     data: (-20,30) original data: (-20,30)
(5)     data: (20,30) original data: (20,30)
(6)     data: (60,30) original data: (60,30)
(7)     data: (100,30) original data: (100,30)
(8)     data: (140,30) original data: (140,30)
(9)     data: (180,30) original data: (180,30)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

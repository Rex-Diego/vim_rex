THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlDraw.shtml
THE_TITLE:NhlDraw
   NCL Home > Documentation > Functions > Graphics routines

NhlDraw

   Draws the given graphical objects.

Prototype

        procedure NhlDraw (
                objects  : graphic
        )

Arguments

   objects

   An array of any dimensionality of plot objects.

Description

   The NhlDraw procedure draws each object in the input array, where each
   object must be a View object.

   If any of the ids in objects are invalid, an error message will be
   displayed. View objects are created by using one of the many gsn
   functions, or by calling the NCL create language construct.

   Note: this procedure is identical to the draw procedure, and we
   encourage the use of draw instead (saves having to type longer names
   and capital letters).

See Also

   draw, frame

Examples

   Example 1

begin
;
; Create workstation.
;
  wks = create "poly" xWorkstationClass defaultapp end create

;
; Create a data object.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

  dataid = create "data" coordArraysClass noparent
    "caYArray" : y
  end create

  xy = create "xy" xyPlotClass wks
    "xyCoordData" : dataid
  end create

  text1 = create "text1" textItemClass wks
    "txString"      : "This is a string at the top"
    "txFont"        : 22
    "txPosYF"       : 0.5
    "txPosYF"       : 0.9
    "txFontHeightF" : 0.03
  end create

  text2 = create "text1" textItemClass wks
    "txString"      : "This is a string at the bottom"
    "txFont"        : 22
    "txPosXF"       : 0.5
    "txPosYF"       : 0.1
    "txFontHeightF" : 0.03
  end create

  NhlDraw((/xy,text1,text2/))   ; could also use draw((/xy,text1,text2/))
  NhlFrame(wks)                 ; could also use frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

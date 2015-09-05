THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlGetBB.shtml
THE_TITLE:NhlGetBB
   NCL Home > Documentation > Functions > NCL object routines

NhlGetBB

   Retrieves the bounding boxes of a list of NCL objects.

Prototype

        function NhlGetBB (
                objects [*] : graphic
        )

        return_val [dimsizes(objects)][4] :  float

Arguments

   objects

   An array of any dimensionality of plot objects.

Return value

   If more than one object is passed in the objects array, then the return
   array is dimensioned nobjs x 4, where nobjs is the length of the
   objects parameter. Otherwise, the return value is an array of length 4.

Description

   For each object in objects, NhlGetBB returns the four coordinates of
   the bounding box of that object. The bounding box, which is in NDC
   coordinates, is the smallest possible box that encompasses the whole
   plot object as it would appear on the given workstation.

   The objects must be View objects, which are created by using one of the
   many gsn functions, or by calling the NCL create language construct.

   Index 0 of the bounding box contains the top coordinate, index 1
   contains the bottom, index 2 contains the left, and index 3 contains
   the right.

   If any element of the objects parameter is not a valid plot, the four
   bounding box elements associated with its index will be assigned the
   integer default missing value.

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
;
; Create workstation.
;
  wks = gsn_open_wks("x11","bb")

;
; Create a data object.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

;
; Set up resource list. Turn off the automatic frame advance so we can
; draw some text before the frame is advanced.
;
; We are also turning off the automatic draw, although this is
; not really necessary. This may sometimes be necessary if you need
; to control the draw order of various plot objects.
;
  res          = True
  res@gsnFrame = False
  res@gsnDraw  = False

;
; Create XY plot. Plot will not be drawn nor will the frame be
; advanced (yet).
;
  xy = gsn_xy(wks,x,y,res)

 text1 = create "text1" textItemClass wks
    "txString"      : "This is a string at the top"
    "txFont"        : 21
    "txFontColor"   : "red"
    "txPosYF"       : 0.5
    "txPosYF"       : 0.9
    "txFontHeightF" : 0.03
  end create

  text2 = create "text1" textItemClass wks
    "txString"      : "This is a string at the bottom"
    "txFont"        : 21
    "txFontColor"   : "green"
    "txPosXF"       : 0.5
    "txPosYF"       : 0.1
    "txFontHeightF" : 0.03
  end create

;
; Now draw the plot and advance the frame.
;
  draw((/xy,text1,text2/))
  frame(wks)

;
; Get the bounding box of each object, and draw the bounding
; box for each one using gsn_polyline_ndc.
;
  bb = NhlGetBB((/xy,text1,text2/))
;  print(bb)

;
; Draw the various objects first.
;
  draw((/xy,text1,text2/))

;
; Set some polyline resources.
;
  gsres                  = True
  gsres@gsLineColor      = "orange"
  gsres@gsLineThicknessF = 2.0

;
; Loop through each object, and draw the box around it.
;
  do i=0,dimsizes(bb(:,0))-1
    t = bb(i,0)
    b = bb(i,1)
    l = bb(i,2)
    r = bb(i,3)
    gsn_polyline_ndc(wks,(/l,r,r,l,l/),(/b,b,t,t,b/),gsres)
  end do

  frame(wks)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

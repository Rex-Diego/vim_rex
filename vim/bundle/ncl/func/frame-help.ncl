THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/frame.shtml
THE_TITLE:frame
   NCL Home > Documentation > Functions > Workstation routines

frame

   Updates and clears the given workstation objects.

Prototype

        procedure frame (
                wks  : graphic
        )

Arguments

   wks

   An array of any dimensionality of NCL Workstation identifiers. The
   identifiers are ones returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

Description

   The frame procedure updates and then clears the Workstation object ids
   passed to it as elements of the array wks. If the parameter references
   objects that are not valid, error messages will be generated.

See Also

   NhlFrame, draw, update, NhlChangeWorkstation

Examples

   Example 1

   This example uses GSN functions to draw an XY plot with some text
   strings:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
;
; Create workstation.
;
  wks = gsn_open_wks("x11","test")

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

;
; Set up text resource list.
;
  txres               = True
  txres@txFont        = 22
  txres@txFontHeightF = 0.03

;
; Draw a couple of text strings.
;
  gsn_text_ndc(wks,"This is a string at the top",0.5,0.9,txres)
  gsn_text_ndc(wks,"This is a string at the bottom",0.5,0.1,txres)

;
; Now draw the plot and advance the frame.
;
  draw(xy)
  frame(wks)
end

   Example 2

   This example is the same as example 1, except it's done using the
   object-oriented interface to NCL's graphics:
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

  draw((/xy,text1,text2/))
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

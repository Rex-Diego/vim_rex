THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlFrame.shtml
THE_TITLE:NhlFrame
   NCL Home > Documentation > Functions > Workstation routines

NhlFrame

   Updates and clears the given workstation objects.

Prototype

        procedure NhlFrame (
                wks  : graphic
        )

Arguments

   wks

   An array of any dimensionality of NCL Workstation identifiers. The
   identifiers are ones returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

Description

   The NhlFrame procedure updates and then clears the Workstation object
   ids passed to it as elements of the array wks. If the parameter
   references objects that are not valid, error messages will be
   generated.

   Note: this procedure is identical to the frame procedure, and we
   encourage the use of frame instead (saves having to type longer names
   and capital letters).

See Also

   frame, draw

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

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlIsWorkstation.shtml
THE_TITLE:NhlIsWorkstation
   NCL Home > Documentation > Functions > Workstation routines

NhlIsWorkstation

   Returns True for each given object that is a Workstation object.

Prototype

        function NhlIsWorkstation (
                objects  : graphic
        )

        return_val [dimsizes(objects)] :  logical

Arguments

   objects

   An array of one or more instances of NCL objects. NCL objects are
   created by using one of the many gsn functions, or by calling the NCL
   create language construct.

Return value

   This function returns a logical array with the same dimensions as the
   input argument objects.

Description

   For each object identifier in the objects array, the value True is
   returned if the object is a Workstation object, and False otherwise. If
   any of the input values is an invalid object, then a missing value is
   returned for that element.

   Workstation objects can be created either by calling the gsn_open_wks
   function, or using the create NCL language construct to create a
   Workstation object.

See Also

   NhlGetParentWorkstation, NhlIsApp, NhlIsDataComm, NhlIsDataItem,
   NhlIsDataSpec, NhlIsTransform, NhlIsView

Examples

   Example 1

   This example creates various NCL objects using both gsn functions, and
   by calling the NCL create language construct to create a text string.
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
  xy   = gsn_xy(wks,x,y,False)

;
; Use the "create" construct to create a text string.
;
 text = create "text1" textItemClass wks
    "txString"      : "This is a string"
    "txPosYF"       : 0.5
    "txPosYF"       : 0.9
  end create

  map = gsn_map(wks,"LambertConformal",False)

  print(NhlIsWorkstation((/wks,xy,map,text/)))   ; Should be (/True,False,False,
False/)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

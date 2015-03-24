THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlName.shtml
THE_TITLE:NhlName
   NCL Home > Documentation > Functions > NCL object routines

NhlName

   Retrieves the name of one or more NCL objects.

Prototype

        function NhlName (
                objects [*] : graphic
        )

        return_val [dimsizes(objects)] :  string

Arguments

   objects

   An array of one or more instances of NCL objects. NCL objects are
   created by using one of the many gsn functions, or by calling the NCL
   create language construct.

Description

   This function returns the individual name given to each object in
   objects. If the object was created using one of the GSN functions, this
   name is set internally. If the object was created by using the NCL
   create language construct, then the name is the one in double quotes.

   If any item of objects is either missing or is an invalid object, the
   result is a missing value.

See Also

   NhlClassName

Examples

   Example 1

   This example creates a workstation, an XY plot, and a text string, and
   prints the name of all of them using NhlName:
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

  print(NhlName((/wks,xy/)))   ; Should be (/"test_x11","test_xy"/).

;
; Use the "create" construct to create a text string.
; In this case, NhlName will return the name that
; follows the "create" keyword ("text1").
;
 text = create "text1" textItemClass wks
    "txString"      : "This is a string"
    "txPosYF"       : 0.5
    "txPosYF"       : 0.9
  end create

  print(NhlName(text))   ; Should be "text1".


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

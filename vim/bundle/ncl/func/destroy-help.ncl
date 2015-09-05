THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/destroy.shtml
THE_TITLE:destroy
   NCL Home > Documentation > Functions > NCL object routines

destroy

   Destroys objects from NCL.

Prototype

        procedure destroy (
                objects  : graphic
        )

Arguments

   objects

   An array of one or more object instances to be destroyed. Objects are
   created by using one of the many gsn functions, or by calling the NCL
   create language construct.

Description

   Each element of the objects parameter is destroyed and replaced with
   the default missing value for NCL objects. Unlike the delete command,
   destroy does not delete the variable referencing the objects.

See Also

   NhlDestroy, delete

Examples

   Example 1

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
; Draw XY plot and advance frame.
;
  xy = gsn_xy(wks,x,y,False)

;
; Clean up.
;
  destroy(xy)
  destroy(wks)
;
; Note that we can still print these variables, but they will contain
; missing values.
;
  print(xy)
  print(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

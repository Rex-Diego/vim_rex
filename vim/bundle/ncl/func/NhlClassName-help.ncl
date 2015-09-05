THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlClassName.shtml
THE_TITLE:NhlClassName
   NCL Home > Documentation > Functions > NCL object routines

NhlClassName

   Retrieve the class name of one or more NCL objects.

Prototype

        function NhlClassName (
                objects [*] : graphic
        )

        return_val [dimsizes(objects)] :  string

Arguments

   objects

   An array of one or more instances of NCL objects. NCL objects are
   created by using one of the many gsn functions, or by calling the NCL
   create language construct.

Description

   This function returns an array of strings which are the class names of
   each object of the objects array. This function is useful if you need
   to know what kind of object you have, so you can set or retrieve some
   resources based on it.

See Also

   NhlName

Examples

   Example 1

   This example creates a simple XY plot, and then prints the class name
   of two of its objects:
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

  print(NhlClassName(wks))    ; Should be "xWorkstationClass"
  print(NhlClassName(xy))     ; Should be "xyPlotClass"
end

   Example 2

   This example sets a different color map depending on what kind of
   workstation is opened:
load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_csm.ncl"

begin
;
; Create a simple bull's eye pattern test data set
;
  M   = 25
  N   = 25
  T   = new((/N,M/),float)
  jspn = ispan(-M/2,M/2,1)^2
  ispn = ispan(-N/2,N/2,1)^2
  do i = 0, dimsizes(ispn)-1
    T(i,:) = ispn(i) + jspn
  end do
  T = 100.0 - sqrt(8^2 * T)

;
; Start the graphics section.
;
  wks = gsn_open_wks("x11","bullseye")

;
; Change the colormap based on the type of workstation
; you have.
;
  if(NhlClassName(wks).eq."psWorkstationClass".or.\
     NhlClassName(wks).eq."pdfWorkstationClass") then
    gsn_define_colormap(wks,"rainbow")
  else
    gsn_define_colormap(wks,"BlueRed")
  end if

  cnres                   = True
  cnres@gsnMaximize       = True
  cnres@gsnSpreadColors   = True
  cnres@lbLabelAutoStride = True
  cnres@cnFillOn          = True

  contour = gsn_csm_contour(wks,T,cnres)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/attsetvalues.shtml
THE_TITLE:attsetvalues
   NCL Home > Documentation > Functions > NCL object routines

attsetvalues

   Applies resources to the given objects.

Prototype

        procedure attsetvalues (
                objects       : graphic,
                resources [1] : logical
        )

Arguments

   objects

   The list of objects to apply the resources to.
   resources

   A logical variable with the resources as attributes of this variable.

Description

   Given a list of objects and a variable containing attributes which are
   resources, attsetvalues builds a resource list and calls setvalues on
   each object

   This procedure is useful as it allows you change a plot's resources
   easily without having to regenerate the plot.

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
;
; Create a simple bull's eye pattern test data set
;

  PI = 3.14159

  M = 25
  T = new((/M,M/),float)

  jspn = ispan(-M/2,M/2,1)^2
  ispn = ispan(-M/2,M/2,1)^2
  do i = 0, dimsizes(ispn)-1
    T(i,:) = ispn(i) + jspn
  end do
  T = 100.0 - sqrt(8^2 * T)

  wks = gsn_open_wks("x11","test")

  contour = gsn_contour(wks,T,False)

  res1 = True
  res1@cnMonoLineDashPattern = False
  res1@cnMonoLineColor       = False
  res1@cnLineThicknessF      = 2.0
  res1@tiMainString          = "Dashed contour lines"
  res1@tiMainFont            = 22

  attsetvalues(contour,res1)       ; Apply resources

  draw(contour)                    ; Draw new plot.
  frame(wks)

  res2                       = True
  res2@cnLineThicknessF      = 1.0
  res2@cnMonoLineDashPattern = True
  res2@cnMonoLineColor       = True
  res2@cnFillOn              = True
  res2@cnMonoFillColor       = True
  res2@cnMonoFillPattern     = False
  res2@pmLabelBarDisplayMode = "Always"
  res2@lbPerimOn             = False
  res2@tiMainString          = "Pattern-filled contours"

  attsetvalues(contour,res2)       ; Apply resources

  draw(contour)                    ; Draw new plot.
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

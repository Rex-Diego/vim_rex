THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wmsetp.shtml
THE_TITLE:wmsetp
   NCL Home > Documentation > Functions > Graphics routines

wmsetp

   Sets parameter values for selected Wmap routines.

Prototype

        procedure wmsetp (
                pnam [1] : string,
                pval
        )

Arguments

   pnam

   Name of the parameter you want to set.
   pval

   Value of the parameter you want to set; this value must be of the type
   appropriate to the parameter being set.

Description

   The wmsetp function sets parameters for selected Wmap routines.

See Also

   wmbarb, wmbarbmap, wmdrft, wmgetp, wmlabs, wmstnm

Examples

load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
;
;  Create an X11 workstation.
;
  wks = gsn_open_wks("x11","test_wmap")

;
;  Draw wind barbs.
;
  x = (/0.25, 0.75, 0.75, 0.25/)
  y = (/0.25, 0.25, 0.75, 0.75/)
  u = (/50., -50., -50.,  50./)
  v = (/50.,  50., -50., -50./)
  wmsetp("wbs",0.2)
  wmbarb(wks, x, y, u, v)
  frame(wks)
;
;  Get parameter value.
;
  size = wmgetp("wbs")
  print(size)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wmgetp.shtml
THE_TITLE:wmgetp
   NCL Home > Documentation > Functions > Graphics routines

wmgetp

   Retrieves parameter values for selected Wmap routines.

Prototype

        function wmgetp (
                pnam [1] : string
        )

        return_val [1]

Arguments

   pnam

   Name of the parameter whose value you want to retrieve.

Description

   The wmgetp function retrieves parameters for selected Wmap routines. It
   returns a value that is of the type appropriate to the parameter type.

See Also

   wmbarb, wmbarbmap, wmdrft, wmlabs, wmsetp, wmstnm

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

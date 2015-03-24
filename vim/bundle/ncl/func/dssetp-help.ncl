THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dssetp.shtml
THE_TITLE:dssetp
   NCL Home > Documentation > Functions > Interpolation

dssetp

   Sets parameters for Dsgrid routines.

Prototype

        procedure dssetp (
                pnam [1] : string,
                pval
        )

Arguments

   pnam

   The name of the parameter you want to set.
   pval

   The value of the parameter you want to set; this value must be of the
   type appropriate to the parameter being set.

Description

   This procedure sets values for parameters for Dsgrid routines.

   The NCL language affords a convenient implementation of the parameter
   setting and retrieval functions.

See Also

   dsgetp

Examples

   Example 1

begin

  NUM = 6
  NX  = 61
  NY  = 61

  xi = (/0.00, 1.00, 0.00, 1.00, 0.40, 0.75/)
  yi = (/0.00, 0.00, 1.00, 1.00, 0.20, 0.65/)
  zi = (/0.00, 0.00, 0.00, 0.00, 1.25, 0.80/)
  xeye =  3.3
  yeye = -3.3
  zeye =  3.3

  xo = new((/NX/), float)
  yo = new((/NY/), float)

;
; Create the output grid.
;
  xinc = 1.0 / (NX - 1)
  yinc = 1.0 / (NY - 1)
  ii = fspan(0.0, 60.0, NX)
  xo = xinc * ii
  yo = yinc * ii
;
; Exponent equals 0.5
;
  dssetp("exp", 0.5)
  output = dsgrid2s(xi, yi, zi, xo, yo)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

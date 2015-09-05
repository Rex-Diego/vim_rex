THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftsetp.shtml
THE_TITLE:ftsetp
   NCL Home > Documentation > Functions > Interpolation

ftsetp

   Sets control parameters for Fitgrid routines.

Prototype

        procedure ftsetp (
                pnam [1] : string,
                pval
        )

Arguments

   pnam

   The name of the parameter you want to set. Choose one from this list.
   pval

   Value of the parameter to be set; it must be of a type appropriate to
   the parameter being set.

Description

   The function ftsetp sets the value of a named parameter of Fitgrid.

Examples

begin
  ftsetp("sig",0.9)
  cur_sig = ftgetp("sig")
  print(cur_sig)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

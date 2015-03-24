THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftgetp.shtml
THE_TITLE:ftgetp
   NCL Home > Documentation > Functions > Interpolation

ftgetp

   Retrieves control parameters for Fitgrid routines.

Prototype

        function ftgetp (
                pnam [1] : string
        )

        return_val [1]

Arguments

   pnam

   The name of the parameter you want to retrieve. Choose one from this
   list.

Return value

   A value of a type appropriate to the parameter being retrieved.

Description

   The function ftgetp retrieves the current value of a named parameter of
   Fitgrid.

Examples

begin
  ftsetp("sig",0.9)
  cur_sig = ftgetp("sig")
  print(cur_sig)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

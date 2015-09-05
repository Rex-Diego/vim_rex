THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cssetp.shtml
THE_TITLE:cssetp
   NCL Home > Documentation > Functions > Interpolation

cssetp

   Sets control parameters for Cssgrid routines.

Prototype

        procedure cssetp (
                pnam [1] : string,
                pval
        )

Arguments

   pnam

   Name of the parameter you want to set. Choose one from this list.
   pval

   Value of the parameter to be set; it must be of a type appropriate to
   the parameter being set.

Description

   The function cssetp sets the current value of a named parameter of
   Cssgrid.

Examples

   .
   .
   .

;
;  Set the value for the tension factor sigma.
;
   cssetp("sig",5.)

   .
   .
   .


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

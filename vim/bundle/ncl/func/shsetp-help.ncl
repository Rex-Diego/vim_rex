THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/shsetp.shtml
THE_TITLE:shsetp
   NCL Home > Documentation > Functions > Interpolation

shsetp

   Sets control parameters for Shgrid routines.

Prototype

        procedure shsetp (
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

   The procedure shsetp sets the value of a named parameter of Shgrid.

Examples

begin

  shsetp("nls",50)   ; parameter names can be either upper or lower case
  shsetp("nfl",5)
  shsetp("ncl",3)

  nls = shgetp("nls")
  nfl = shgetp("nfl")
  ncl = shgetp("ncl")

  print(nls)
  print(nfl)
  print(ncl)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

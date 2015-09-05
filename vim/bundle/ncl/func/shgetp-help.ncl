THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/shgetp.shtml
THE_TITLE:shgetp
   NCL Home > Documentation > Functions > Interpolation

shgetp

   Retrieves control parameters for Shgrid routines.

Prototype

        function shgetp (
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

   The function shgetp retrieves the current value of a named parameter of
   Shgrid.

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

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/changeCaseChar.shtml
THE_TITLE:changeCaseChar
   NCL Home > Documentation > Functions > String manipulation

changeCaseChar

   Changes the case of each character in a string. (Deprecated: see
   str_switch.)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function changeCaseChar (
                x  : string
        )

        return_val  :  string

Arguments

   x

   A string.

Return value

   A string of the same size as x.

Description

   This function has been deprecated in version 5.1.1; use str_switch
   instead.

   Changes the case of each character in a string. Treats each one
   separately and changes it to the opposite case. (e.g. apple => APPLE,
   aPPle => AppLE)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

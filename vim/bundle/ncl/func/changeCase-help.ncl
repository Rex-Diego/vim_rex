THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/changeCase.shtml
THE_TITLE:changeCase
   NCL Home > Documentation > Functions > String manipulation

changeCase

   Changes the case of a string. (Deprecated: see str_lower/str_upper.)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function changeCase (
                x     : string,
                case  : string
        )

        return_val  :  string

Arguments

   x

   A string.
   case

   A string equal to the case. ("up" or "low").

Return value

   A string of the same size as x.

Description

   This function has been deprecated in version 5.1.1. Use str_lower or
   str_upper instead.

   Changes case of a string to the case specified. Recognizes "up" and
   "low".


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

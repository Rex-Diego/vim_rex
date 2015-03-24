THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/cshstringtolist.shtml
THE_TITLE:cshstringtolist
   NCL Home > Documentation > Functions > Type converters

cshstringtolist

   Converts a comma delimited string from csh and breaks it up into
   separate strings.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function cshstringtolist (
                cshlist  : string
        )

        return_val [*] :  string

Arguments

   cshlist

   A comma delimited string. Note that there must be commas at the
   beginning and end (e.g. ,cat,dog,bird,).

Return value

   An array of strings.

Description

   Converts a comma delimited string from csh and breaks it up into
   separate strings.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

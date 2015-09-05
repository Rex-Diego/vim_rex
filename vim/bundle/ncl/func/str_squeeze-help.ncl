THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_squeeze.shtml
THE_TITLE:str_squeeze
   NCL Home > Documentation > Functions > String manipulation

str_squeeze

   Strips off leading and ending spaces and TABs, and replaces multiple
   spaces and/or TABs with a single space.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_squeeze (
                string_val  : string
        )

        return_val [dimsizes(string_val)] :  string

Arguments

   string_val

   A string array of any dimensionality.

Description

   This function returns an array of strings with leading and ending
   spaces, TABs removed. Multiple spaces and/or TABs, or a combination
   thereof, are substituted with a single space.

See Also

   str_left_strip, str_right_strip, str_strip

Examples

   Example

 str = "         abc       def               "
 new_string = str_squeeze(str)
 print("<" + new_string + ">")

   Output:
(0)     <abc def>


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

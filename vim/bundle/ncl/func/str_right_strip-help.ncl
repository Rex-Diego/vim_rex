THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_right_strip.shtml
THE_TITLE:str_right_strip
   NCL Home > Documentation > Functions > String manipulation

str_right_strip

   Strips ending spaces and TABs from the input strings.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_right_strip (
                string_val  : string
        )

        return_val [dimsizes(string_val)] :  string

Arguments

   string_val

   A string array of any dimensionality.

Description

   This function returns an array of strings with ending spaces and TABs
   removed.

See Also

   str_left_strip, str_strip, str_squeeze

Examples

 str = "                abc               "
 new_string = str_right_strip(str)
 print("<" + new_string + ">")

   Output:
(0)     <     abc>


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

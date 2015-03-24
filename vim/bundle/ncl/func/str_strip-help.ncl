THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_strip.shtml
THE_TITLE:str_strip
   NCL Home > Documentation > Functions > String manipulation

str_strip

   Strips leading and ending spaces and TABs from the input strings.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_strip (
                string_val  : string
        )

        return_val [dimsizes(string_val)] :  string

Arguments

   string_val

   A string array of any dimensionality.

Description

   This function returns an array of strings with leading and ending
   spaces and TABs removed.

See Also

   str_left_strip, str_right_strip, str_squeeze

Examples

   Example

 str = "        abc         def                "
 new_string = str_strip(str)
 print("<" + new_string + ">")

   Output:
(0)     <abc         def>


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_upper.shtml
THE_TITLE:str_upper
   NCL Home > Documentation > Functions > String manipulation

str_upper

   Converts all input strings to uppercase.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_upper (
                string_val  : string
        )

        return_val [dimsizes(string_val)] :  string

Arguments

   string_val

   A string array of any dimensionality.

Description

   This function converts all the characters in string_val to uppercase.

See Also

   str_lower, str_switch, str_capital

Examples

   Example

  str = "abcdefghijklmnopqrstuvwxyz_......_abcdefghijklmnopqrstuvwxyz"
  new_string = str_upper(str)
  print("<" + new_string + ">")

   Output:
(0)     <ABCDEFGHIJKLMNOPQRSTUVWXYZ_......_ABCDEFGHIJKLMNOPQRSTUVWXYZ>


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

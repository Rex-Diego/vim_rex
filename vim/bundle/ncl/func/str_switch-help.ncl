THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_switch.shtml
THE_TITLE:str_switch
   NCL Home > Documentation > Functions > String manipulation

str_switch

   Switches the case of characters in the given string(s).

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_switch (
                string_val  : string
        )

        return_val [dimsizes(string_val)] :  string

Arguments

   string_val

   A string array of any dimensionality.

Description

   This function returns strings with all characters' cases switched, e.g.
   lowercase characters will be switched to uppercase, and uppercase will
   be switched to lowercase.

See Also

   str_upper, str_lower, str_capital

Examples

   Example

 str = "abcdefghijklmnopqrstuvwxyz_......_ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 new_string = str_switch(str)
 print(new_string)

   Output:
(0)     <ABCDEFGHIJKLMNOPQRSTUVWXYZ_......_abcdefghijklmnopqrstuvwxyz>


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

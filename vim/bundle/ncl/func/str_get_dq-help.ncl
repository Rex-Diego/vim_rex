THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_get_dq.shtml
THE_TITLE:str_get_dq
   NCL Home > Documentation > Functions > String manipulation

str_get_dq

   Returns the double quote (") character as a string.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function str_get_dq (
        )

        return_val [1] :  string

Description

   This function returns a one-character string containing the double
   quote (").

   NCL cannot generate a double quote string using normal string
   assignment. This function gives a quick/direct way to get a double
   quote string.

   The result of str_get_dq() is same as tostring(tochar(34)).

See Also

   show_ascii, str_get_sq, str_get_tab, str_get_nl

Examples

   Example

 dq = str_get_dq()
 print("<" + dq + ">")
 print("dq = <" + tostring(tochar(34)) + ">")

   Output:
(0)     <">
(0)     dq = <">


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

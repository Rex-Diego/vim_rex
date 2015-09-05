THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_match_ic.shtml
THE_TITLE:str_match_ic
   NCL Home > Documentation > Functions > String manipulation

str_match_ic

   Returns a list of strings that contain the given substring (case
   insensitive).

   [new.gif] Available in version 6.0.0 and later.

Prototype

        function str_match_ic (
                string_val [*] : string,
                expression [1] : string
        )

        return_val [*] :  string

Arguments

   string_val

   A string array of any dimensionality.
   expression

   The string expression to be matched.

Description

   This function returns an array of strings with every occurrence of
   expression matched in string_val.

   If there is no expression matched in string_val, the default string
   missing value ("missing") will be returned.

   Please note that str_match_ic is case INSENSITIVE. If you need case
   sensitivity, use str_match.

See Also

   str_index_of_substr, str_sub_str, str_match, str_match_ind,
   str_match_ind_ic

Examples

   Example 1

 s = (/"Linux","LINUX","linux"/)

 dq = str_get_dq()

 print("str_match(s," + dq + "linux" + dq + ") = " + str_match(s,"linux"))

;print out:
;(0)     str_match(s,"linux") = linux

 print("str_match_ic(s," + dq + "linux" + dq + ") = " + str_match_ic(s,"linux"))

;print out:
;(0)     str_match_ic(s,"linux") = Linux
;(1)     str_match_ic(s,"linux") = LINUX
;(2)     str_match_ic(s,"linux") = linux


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

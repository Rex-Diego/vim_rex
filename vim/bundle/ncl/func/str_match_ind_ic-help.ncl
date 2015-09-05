THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_match_ind_ic.shtml
THE_TITLE:str_match_ind_ic
   NCL Home > Documentation > Functions > String manipulation

str_match_ind_ic

   Returns a list of indexes into an array of strings that contain the
   given substring (case insensitive).

   [new.gif] Available in version 6.0.0 and later.

Prototype

        function str_match_ind_ic (
                string_arr [*] : string,
                expression [1] : string
        )

        return_val [*] :  integer

Arguments

   string_arr

   A string array of any dimensionality.
   expression

   The string expression to be matched.

Description

   This function returns an array of indexes where every occurrence of
   expression is matched in string_arr. The matching is case insensitive.

   If there is no expression matched in string_arr, the default missing
   value for an integer will be returned.

   Please note, str_match_ind_ic is case insensitive. Use str_match_ind if
   you need case sensitivity.

See Also

   str_match, str_match_ic, str_match_ind, str_index_of_substr,
   str_sub_str

Examples

   Example 1

   Get the indexes of all the strings containing "Line" from the list of
   strings:

  strings = (/"cnLineColor","mpFillColor","xyLineThicknessF","txString", \
              "polyline"/)
  ii = str_match_ind_ic(strings,"Line")
  print(ii)
  print(strings(ii))

   Output:

Variable: ii
Type: integer
Total Size: 8 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [2]
Coordinates:
(0)     0
(1)     2
(2)     4

Variable: strings (subsection)
Type: string
Total Size: 8 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
(0)     cnLineColor
(1)     xyLineThicknessF
(2)     polyline


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_match.shtml
THE_TITLE:str_match
   NCL Home > Documentation > Functions > String manipulation

str_match

   Returns a list of strings that contain the given substring (case
   sensitive).

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function str_match (
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

   Please note, str_match is case SENSITIVE as of version 6.0.0. There's a
   bug in versions 6.0.0-beta and earlier in which this function is not
   case sensitive.

   Use str_match_ic if you need case insensitivity.

See Also

   str_index_of_substr, str_sub_str, str_match_ic, str_match_ind,
   str_match_ind_ic

Examples

   Example 1

   Get all the strings containing "cnConst" from the list of contour
   resources:

 class_out = NhlGetClassResources("contourPlotClass", "")

 cnConst = str_match(class_out, "cnConst")

 print(cnConst)


   Output:
(0)     cnConstFLabelAngleF
(1)     cnConstFLabelBackgroundColor
(2)     cnConstFLabelConstantSpacingF
(3)     cnConstFLabelFont
(4)     cnConstFLabelFontAspectF
(5)     cnConstFLabelFontColor
(6)     cnConstFLabelFontHeightF
(7)     cnConstFLabelFontQuality
(8)     cnConstFLabelFontThicknessF
(9)     cnConstFLabelFormat
(10)    cnConstFLabelFuncCode
(11)    cnConstFLabelJust
(12)    cnConstFLabelOn
(13)    cnConstFLabelOrthogonalPosF
(14)    cnConstFLabelParallelPosF
(15)    cnConstFLabelPerimColor
(16)    cnConstFLabelPerimOn
(17)    cnConstFLabelPerimSpaceF
(18)    cnConstFLabelPerimThicknessF
(19)    cnConstFLabelSide
(20)    cnConstFLabelString
(21)    cnConstFLabelTextDirection
(22)    cnConstFLabelZone
(23)    cnConstFUseInfoLabelRes


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

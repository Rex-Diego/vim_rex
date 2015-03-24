THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_is_blank.shtml
THE_TITLE:str_is_blank
   NCL Home > Documentation > Functions > String manipulation

str_is_blank

   Returns True for strings that contain all blanks.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_is_blank (
                string_val  : string
        )

        return_val [dimsizes(string_val)] :  logical

Arguments

   string_val

   A string array of any dimensionality.

Description

   This function returns True for strings that contain only whitespace
   (null, space, TAB, newline, and/or C-whitespace). Missing values are
   returned if the strings are missing. False is returned otherwise.

Examples

 a0 = "abc"
 b0 = str_is_blank(a0)
 print(b0)           ; b0 = False

 a1 = (/"", "  ", "  ", "  _  "/)
 b1 = str_is_blank(a1)
 print(b1)           ; b1 = (/True, True, True, False/)

 a2 = (/ (/"one","two","    "/),(/"          ",""," "/)/)
 b2 = str_is_blank(a2)
 print(b2)          ; b2 = (/(/False, False, True/),\
                    ;        (/True, True, True/))

 a3 = new((/3,4/),string)
 b3 = str_is_blank(a3)
 print(b3) ; b3 = (/(/missing, missing, missing, missing/),
           ;        (/missing, missing, missing, missing/),
           ;        (/missing, missing, missing, missing/)/)


 a3(0,0) = ""
 a3(1,1) = " "
 a3(2,2) = "b3"

 A = str_is_blank(a3)  ; b3 = (/(/True, missing, missing, missing/),
                       ;        (/missing, True, missing, missing/),
                       ;        (/missing, missing, False, missing/)/)
 print(b3)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_insert.shtml
THE_TITLE:str_insert
   NCL Home > Documentation > Functions > String manipulation

str_insert

   Inserts a substring into the given strings.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_insert (
                string_val    : string,
                subString [1] : string,
                position  [1] : integer
        )

        return_val [dimsizes(string_val)] :  string

Arguments

   string_val

   A string array of any dimensionality.
   subString

   The substring.
   position

   An integer indicating the index of where to insert the substring. Can
   be negative.

Description

   This function returns an array of strings with subString inserted at
   the given position. The positioning is 0-based, so a value of 0 means
   the beginning of the string.

   If position is negative, then indexing will begin from the end of the
   string, where -1 represents the end of the string, -2 represents the
   second-to-the-last character, and so on.

   If abs(position) is a value greater than the length of the string, then
   the new string will be padded with blanks accordingly. See the examples
   below.

See Also

   str_sub_str

Examples

   Assume the following string array for the next several examples:
 strs = (/"NCL", "has", "many", "features", "common", "to", "modern", "programmi
ng", "languages,"/)
          "including", "types,", "variables,", "operators,", "expressions,", \
          "conditional", "statements,", "loops,", "and", "functions", "and", "pr
ocedures."/)

   Example 1

   Insert a space at the beginning of every string:
 new_strP0 = str_insert(strs, " ", 0)
 print("[" + new_strP0 + "]")

   Note: this is equivalent to:
 new_strP0 = " " + strs

   Output:
(0)     [ NCL]
(1)     [ has]
(2)     [ many]
(3)     [ features]
. . .
(17)    [ and]
(18)    [ functions]
(19)    [ and]
(20)    [ procedures.]

   Example 2

   Insert a space after the first character in every string:
 new_strP1 = str_insert(strs, " ", 1)
 print("[" + new_strP1 + "]")

   Output:
(0)     [N CL]
(1)     [h as]
(2)     [m any]
(3)     [f eatures]
. . .
(17)    [a nd]
(18)    [f unctions]
(19)    [a nd]
(20)    [p rocedures.]

   Example 3

   Insert a space after the last character in every string:
 new_strM1 = str_insert(strs, " ", -1)
 print("[" + new_strM1 + "]")

   Note: this is equivalent to:
 new_strP0 = strs + " "

   Output:
(0)     [NCL ]
(1)     [has ]
(2)     [many ]
(3)     [features ]
. . .
(17)    [and ]
(18)    [functions ]
(19)    [and ]
(20)    [procedures. ]

   Example 4

   Insert a space before the last character in every string:
 new_strM2 = str_insert(strs, " ", -2)
 print("[" + new_strM2 + "]")

   Output:
(0)     [NC L]
(1)     [ha s]
(2)     [man y]
(3)     [feature s]
. . .
(17)    [an d]
(18)    [function s]
(19)    [an d]
(20)    [procedures .]

   Example 5

   Insert the word "END" starting at the 21st character in the string.
   Since none of the strings have more than 21 characters, the strings
   will be padded with blanks:
 new_strP20 = str_insert(strs, "END", 20)
 print("[" + new_strP20 + "]")

   Output:
(0)     [NCL                 END]
(1)     [has                 END]
(2)     [many                END]
(3)     [features            END]
. . .
(17)    [and                 END]
(18)    [functions           END]
(19)    [and                 END]
(20)    [procedures.         END]

   Example 6

   Insert the word "BLANK" starting 20 characters before the first
   character in the string. The strings will be padded with blanks:
 new_strM20 = str_insert(strs, "BEGIN", -20)
 print("[" + new_strM20 + "]")

   Output:

(0)     [BEGIN                 NCL]
(1)     [BEGIN                 has]
(2)     [BEGIN                many]
(3)     [BEGIN            features]
. . .
(17)    [BEGIN                 and]
(18)    [BEGIN           functions]
(19)    [BEGIN                 and]
(20)    [BEGIN         procedures.]


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

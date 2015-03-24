THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_index_of_substr.shtml
THE_TITLE:str_index_of_substr
   NCL Home > Documentation > Functions > String manipulation

str_index_of_substr

   Returns the start indexes where one or more occurrences of a substring
   is found in a string.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_index_of_substr (
                str    [1] : string,
                substr [1] : string,
                opt    [1] : integer
        )

        return_val  :  integer

Arguments

   str

   A single string in which to find one or more occurrences of substr.
   substr

   The substring to search for.
   opt

   An integer option indicating which start indexes should be returned.

Return value

   An array of integers, depending on the setting of opt.

Description

   This function returns integer values, indicating the start index(es)
   where substr is found in str. If substr is not found, or if either of
   the input strings are missing, then a missing value is returned.

   If opt is -1, it returns the last index of where substr is found in
   str.

   If opt is 0, it returns an integer array which has the indexes of all
   matches.

   If opt is some value n (>0), it returns an integer array of (up to) n
   matches.

See Also

   str_match, str_sub_str

Examples

   Example

 str = "                abc                     def     hij             def
klmn"
 print(str)

 substr = "def"

 i1  = str_index_of_substr(str, substr, 0)
 print(i1)                              ; i1 = (/40, 64/)

 i2  = str_index_of_substr(str, substr, -1)
 print(i2)                              ; i2 = 64

 i3  = str_index_of_substr(str, substr, 1)
 print(i3)                              ; i3 = 40

 substr = "xyz"
 ix  = str_index_of_substr(str, substr, 0)
 print(ix)                              ; ix = -999 (substr "xyz" is not in str)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

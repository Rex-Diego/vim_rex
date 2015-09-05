THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_sub_str.shtml
THE_TITLE:str_sub_str
   NCL Home > Documentation > Functions > String manipulation

str_sub_str

   Replaces a substring with a new substring.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_sub_str (
                string_val    : string,
                oldString [1] : string,
                newString [1] : string
        )

        return_val [dimsizes(string_val)] :  string

Arguments

   string_val

   A string array of any dimensionality.
   oldString

   The substring to be replaced.
   newString

   The substring to replace with.

Description

   This function returns an array of strings with every occurrence of
   oldString replaced by newString.

   If either oldString or newString are missing, then the original strings
   will be returned.

See Also

   str_insert, isStrSubset

Examples

   Example 1

   Replace "orange" with "strawberry", and put back into the same
   variable:
   aob = "apple_orange_banana"
   o   = "orange"
   s   = "strawberry"
   aob = str_sub_str(aob,o,s)
   print(aob)

   Output:
(0)     apple_strawberry_banana

   Example 2

   Assume you have an ASCII file "asc4.txt":
The 15 most populous nations
Data taken from Wikipedia, October 2008
----------------------------------------------------------------------
Country Population (millions) Percentage (of world)
China           1,321                 19.84%
India           1,132                 16.96%
United States   304                   4.56%
Indonesia       232                   3.47%
Brazil          187                   2.80%
Pakistan        163                   2.44%
Bangladesh      159                   2.38%
Nigeria         148                   2.22%
Russia          142                   2.13%
Japan           128                   1.92%
Mexico          107                   1.60%
Philippines     89                    1.33%
Vietnam         84                    1.31%
Germany         82                    1.23%
Egypt           81                    1.13%
----------------------------------------------------------------------
Total           4,356                 65.32%

   The following script will replace "United States" with "U.S. " and ","
   with "":
 flnm = "asc4.txt"

 strs = asciiread(flnm,-1,"string")

 strs = str_sub_str(strs, "United States", "U.S.         ")
 strs = str_sub_str(strs, ",", "")
 print(strs)


   Output:
(0)     The 15 most populous nations
(1)     Data taken from Wikipedia October 2008
(2)     ----------------------------------------------------------------------
(3)     Country Population (millions) Percentage (of world)
(4)     China           1321                  19.84%
(5)     India           1132                  16.96%
(6)     U.S.            304                   4.56%
(7)     Indonesia       232                   3.47%
(8)     Brazil          187                   2.80%
(9)     Pakistan        163                   2.44%
(10)    Bangladesh      159                   2.38%
(11)    Nigeria         148                   2.22%
(12)    Russia          142                   2.13%
(13)    Japan           128                   1.92%
(14)    Mexico          107                   1.60%
(15)    Philippines     89                    1.33%
(16)    Vietnam         84                    1.31%
(17)    Germany         82                    1.23%
(18)    Egypt           81                    1.13%
(19)    ----------------------------------------------------------------------
(20)    Total           4356                  65.32%


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

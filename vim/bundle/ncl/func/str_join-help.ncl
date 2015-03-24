THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_join.shtml
THE_TITLE:str_join
   NCL Home > Documentation > Functions > String manipulation

str_join

   Joins all strings into one string, with each string separated by
   delimiter.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_join (
                string_val  : string,
                delim   [1] : string
        )

        return_val [1] :  string

Arguments

   string_val

   A string array of any dimensionality.
   delim

   The string delimiter to use between each joined string.

Description

   This function returns a string with all input strings joined together,
   separated by the given delim delimiter.

   If any of the strings are missing, then the missing value string will
   be included in the concatenation. It's up to the user to remove missing
   strings if this behavior is not desired (see example below).

See Also

   str_concat, oneDtostring

Examples

   Example 1

 strs = (/"NCL", "has", "many", "features", "common", "to", "modern", "programmi
ng", "languages."/)
 new_str = str_join(strs, " ")
 print(new_str)

   Output

(0)     NCL has many features common to modern programming languages.

   Example 2

   See what happens when you have missing value strings:
  strs = (/"NCL","has","many","features","missing","common","to", \
           "missing","modern","programming","languages.","missing"/)
  strs@_FillValue = "missing"

  new_str = str_join(strs, " ")
  print(new_str)

   Output

(0)     NCL has many features missing common to missing modern programming langu
ages. missing

   If this behavior is not desired, then you need to remove the missing
   strings:
  strs2 = strs(ind(.not.ismissing(strs)))
  new_str = str_join(strs2," ")
  print(new_str)

   Output

(0)     NCL has many features common to modern programming languages.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

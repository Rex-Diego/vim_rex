THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_concat.shtml
THE_TITLE:str_concat
   NCL Home > Documentation > Functions > String manipulation

str_concat

   Concatenates all strings into a single string.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_concat (
                string_val  : string
        )

        return_val [1] :  string

Arguments

   string_val

   A string array of any dimensionality.

Description

   This function concatenates all the input strings into a single string.

   If any of the strings are missing, then the missing value string will
   be included in the concatenation. It's up to the user to remove missing
   strings if this behavior is not desired (see example below).

See Also

   str_join, oneDtostring

Examples

   Example 1

  strs = (/"NCL","has","many","features","common","to","modern","programming","l
anguages."/)
  new_str = str_concat(strs)
  print(new_str)

   Output

(0)     NCLhasmanyfeaturescommontomodernprogramminglanguages.

   Example 2

   See what happens when you have missing value strings:
  strs = (/"NCL","has","many","features","missing","common","to", \
           "missing","modern","programming","languages.","missing"/)
  strs@_FillValue = "missing"

  new_str = str_concat(strs)
  print(new_str)

   Output

(0)     NCLhasmanyfeaturesmissingcommontomissingmodernprogramminglanguages.missi
ng

   If this behavior is not desired, then replace the missing strings with
   "":
  strs = where(ismissing(strs),"",strs)
  new_str = str_concat(strs)
  print(new_str)

   Output

(0)     NCLhasmanyfeaturescommontomodernprogramminglanguages.

   Example 3

   An ncl-talk question was asked: "How can a 2-dimensional array be
   printed as comma-separated-values (csv)?"

   Example 2 of the write_table function in NCL 6.1.0 is one approach.
   Another approach: do your own line formatting.

     outfile = "out.txt"
     x = (/ (/ 4.35,   4.36,   9.73,   4.91 /), \
            (/ 4.39,   4.66,  -5.84,   4.59 /), \
            (/ 0.27,   3.77,   0.89,  -3.09 /)    /)


     dimx  = dimsizes (x)
     nrows = dimx(0)                                  ; ncols = dimx(1)
     lines = new (nrows, string)

     do i = 0, nrows-1
       lines(i) = str_concat (sprintf ("%7.2f,", x(i,:)))
     end do

     asciiwrite (outfile, lines)


   To conserve space, you can remove all spaces between numbers by
   changing the format string to "%0.2f,". This is standard CSV format as
   used by spreadsheet software. For single space between numbers, use "
   %0.2f,".


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

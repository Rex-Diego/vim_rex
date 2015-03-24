THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/unique_string.shtml
THE_TITLE:unique_string
   NCL Home > Documentation > Functions > String manipulation, System
   tools

unique_string

   Returns a unique string given the input string as a prefix.

Prototype

        function unique_string (
                prefix_string [1] : string
        )

        return_val [1] :  string

Arguments

   prefix_string

   A string containing the prefix name of a string that will be used for
   the return unique string.

Description

   This function returns a unique string using the prefix_string as a
   prefix, and appending a unique integer counter to it. The integer
   counter starts at 0, and is incremented by 1 every time this function
   is called within a single NCL session. If prefix_string is empty, then
   a string with just the unique integer will be returned.

Examples

   Example 1

   To see how this function works, put it inside a finite loop and print
   out its values:
  do i=1,5
    print(unique_string("tmp"))
    print(unique_string(""))
  end do

   The above code snippet will generate the following strings:

(0)     tmp0
(0)     1
(0)     tmp2
(0)     3
(0)     tmp4
(0)     5
(0)     tmp6
(0)     7
(0)     tmp8
(0)     9


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

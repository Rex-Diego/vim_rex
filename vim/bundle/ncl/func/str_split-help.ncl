THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_split.shtml
THE_TITLE:str_split
   NCL Home > Documentation > Functions > String manipulation

str_split

   Splits a string into an array of strings given a delimiter.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function str_split (
                string_val [1] : string,
                delimiter  [1] : string
        )

        return_val [*] :  string

Arguments

   string_val

   The input string to split.
   delimiter

   The delimiter to separate the string by.

Return value

   An array of string(s).

Description

   This function splits a single string based on a delimiter. If there are
   consecutive delimiters in a string, they are ignored. If you want these
   values to be set to missing instead, use str_split_csv.

See Also

   str_split_csv, str_concat

Examples

   Example 1

   Split a string according to a single space:

 str = "NCL has many features common to modern programming languages, including
types, variables, and more."
 strs = str_split(str, " ")
 print("'" + strs + "'")

   Output will be:

(0)     'NCL'
(1)     'has'
(2)     'many'
(3)     'features'
(4)     'common'
(5)     'to'
(6)     'modern'
(7)     'programming'
(8)     'languages,'
(9)     'including'
(10)    'types,'
(11)    'variables,'
(12)    'and'
(13)    'more.'

   Example 2

   Note that consecutive delimiters (in this case, spaces) will be
   ignored:
 str = "NCL    has many features common to    modern programming languages."
 strs = str_split(str, " ")
 print("'" + strs + "'")

   Output will be:

(0)     'NCL'
(1)     'has'
(2)     'many'
(3)     'features'
(4)     'common'
(5)     'to'
(6)     'modern'
(7)     'programming'
(8)     'languages.'

   Example 3

   Tabs and spaces are considered unique from each other. If you have a
   mix of tabs and spaces in your string, you can use a delimiter with a
   single tab and space to split your string.
  a = "This     is         a string     with   tabs and spaces."
  space     = " "
  tab       = " "
  tab_space = "  "

  print("str_split with space delimiter")
  print("'" + str_split(a,space) + "'")
  print("")

  print("str_split with tab delimiter")
  print("'" + str_split(a,tab) + "'")
  print("")

  print("str_split with space and tab delimiter")
  print("'" + str_split(a,tab_space) + "'")
  print("")

   Output will be:
(0)     str_split with space delimiter
(0)     'This   is      '
(1)     'a'
(2)     'string with'
(3)     'tabs'
(4)     'and'
(5)     'spaces.'
(0)
(0)     str_split with tab delimiter
(0)     'This'
(1)     'is'
(2)     '   a string'
(3)     'with   tabs and spaces.'
(0)
(0)     str_split with space and tab delimiter
(0)     'This'
(1)     'is'
(2)     'a'
(3)     'string'
(4)     'with'
(5)     'tabs'
(6)     'and'
(7)     'spaces.'


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

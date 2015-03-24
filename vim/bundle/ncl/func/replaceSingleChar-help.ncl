THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/replaceSingleChar.shtml
THE_TITLE:replaceSingleChar
   NCL Home > Documentation > Functions > String manipulation

replaceSingleChar

   Within a string replace one character with another character.
   (Deprecated: see str_sub_str.)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function replaceSingleChar (
                x    [*] : string,
                oldC [1] : string,
                newC [1] : string
        )

        return_val  :  string

Arguments

   x

   A single string or a one dimensional array of strings.
   oldC

   The single character to be replaced.
   newC

   The single character which will be substituted.

Return value

   A string of the same size as x.

Description

   This function has been deprecated in version 5.1.1. Use str_sub_str
   instead.

   Change all occurrences of a specific character to another. This is case
   sensitive.

See Also

   changeCaseChar, changeCase

Examples

   Example 1
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

  s = "apples are good"
  replaceSingleChar( s1, " ", "_")
  print(s)

  S  = (/ "Pears are even better!","NCEP 1950-1999"/)
  replaceSingleChar( S, " ", "_")
  print(S)

  replaceSingleChar( S, "!", "$")
  print(S)

   procudes
(0)     apples_are_good

(0)     Pears_are_even_better!
(1)     NCEP_1950-1999

(0)     Pears_are_even_better$
(1)     NCEP_1950-1999


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

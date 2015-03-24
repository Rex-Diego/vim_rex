THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sqsort.shtml
THE_TITLE:sqsort
   NCL Home > Documentation > Functions > General applied math

sqsort

   Sorts a singly dimensioned arrays of strings.

Prototype

        procedure sqsort (
                value [*] : string
        )

Arguments

   value

   A singly dimensioned array of two or more string values to be sorted.

Description

   This procedure sorts its input array in ascending order. If the input
   array contains a coordinate variable, then the values of the coordinate
   variable are repositioned relative to their corresponding array value.
   Missing values are sorted to either end of the array based on their
   actual value (ignoring missing values is not supported).

   Caveat: this procedure is case insensitive and thus you are not
   guaranteed if "A" is greater than "a", or vice versa. For example, if
   you do:
abc = (/"a","b","c","A","B","C"/)
sqsort(abc)

   then "abc" might be equal to any one of the following permutations:
abc = (/"a","A","b","B","c","C"/)
abc = (/"a","A","B","b","c","C"/)
abc = (/"A","a","b","B","c","C"/)

See Also

   qsort, dim_pqsort

Examples

   Example 1

   Sort an array of strings:
  s = (/"Auf Wiedersehen", "Goodbye", "Hasta Luego", "Ciao"/)
  sqsort(s)
  print(s)

Variable: s
Type: string
Total Size: 16 bytes
            4 values
Number of Dimensions: 1
Dimensions and sizes:   [4]
Coordinates:
(0)     Auf Wiedersehen
(1)     Ciao
(2)     Goodbye
(3)     Hasta Luego



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

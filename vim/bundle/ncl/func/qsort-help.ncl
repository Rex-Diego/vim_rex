THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/qsort.shtml
THE_TITLE:qsort
   NCL Home > Documentation > Functions > General applied math

qsort

   Sorts a singly dimensioned array.

Prototype

        procedure qsort (
                value [*] : numeric
        )

Arguments

   value

   A singly dimensioned array of two or more numeric values to be sorted.

Description

   This procedure sorts its input array in ascending order. If the input
   array contains a coordinate variable, then the values of the coordinate
   variable are repositioned relative to their corresponding array value.
   Missing values are sorted to either end of the array based on their
   actual value (ignoring missing values is not supported).

See Also

   sqsort, dim_pqsort

Examples

   Example 1

   Sort a floating point array:
  x = (/4.3, 0.9, 5.2, 7.7, 2.3, -4.7, -9.1/)
  qsort(x)
  print(x)

Variable: x
Type: float
Total Size: 28 bytes
            7 values
Number of Dimensions: 1
Dimensions and sizes:   [7]
Coordinates:
(0)     -9.1
(1)     -4.7
(2)     0.9
(3)     2.3
(4)     4.3
(5)     5.2
(6)     7.7



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

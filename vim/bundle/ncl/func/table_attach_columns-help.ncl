THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/table_attach_columns.shtml
THE_TITLE:table_attach_columns
   NCL Home > Documentation > Functions > Variable manipulators

table_attach_columns

   Attaches [appends] additional columns to a previously existing
   two-dimensional array.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function table_attach_columns (
                t1      : [*][*],
                t2      : [*][*],
                opt [1] : integer
        )

        return_val [*][*]

Arguments

   t1

   A two-dimensional array of any type.
   t2

   A two-dimensional array of the same type as t1. The left dimension size
   [rows] must be identical to that of t1.
   opt

   An integer. Set to 0. Currently, not used.

Return value

   A two-dimensional array. The left dimension will be the same as on
   input. The right dimension will have additional columns appended to the
   t1 table.

Description

   This function uses dimension reordering. This requires that the
   variables have named dimensions. It is not required that the dimensions
   of t1 and t2 be named upon entry. If not present, the function will
   provide temporary named dimensions.

   See the Example

See Also

   table_attach_rows, array_append_record

Examples

   Example 1

   Consider the two dimensional arrays y1 and y2. It is desired to append
   y2 to the y1 array and return a new array.

                                       ; y1 is 5X3
   y1 = (/(/-3.04, -2.05, -4.29/),\
          (/-2.07, -3.66, -1.46/),\
          (/-2.49, -3.11, -3.83/),\
          (/-4.44, -3.24, -3.08/),\
          (/-2.14, -4.68, -2.01/)/)

                                      ; y2 is 5X5
   y2 = (/(/153.50, 167.58, 115.26, 143.38, 154.57/),\
          (/190.60, 138.17, 113.66, 172.26, 150.34/),\
          (/150.35, 189.73, 146.19, 159.03, 188.25/),\
          (/148.74, 176.38, 100.36, 155.45, 196.51/),\
          (/188.72, 122.79, 176.24, 117.69, 174.37/)/)

   y1!0 = "row"   ; explicitly name dimensions
   y1!1 = "col"
   y2!0 = "row"
   y2!1 = "col"
                                      ; b is 5X8
   b = table_attach_columns(y1, y2, 0)

   ncol = 3 + 5
   write_matrix( b, ncol+"f8.2", False)

   will yield [b]

    -3.04   -2.05   -4.29  153.50  167.58  115.26  143.38  154.57
    -2.07   -3.66   -1.46  190.60  138.17  113.66  172.26  150.34
    -2.49   -3.11   -3.83  150.35  189.73  146.19  159.03  188.25
    -4.44   -3.24   -3.08  148.74  176.38  100.36  155.45  196.51
    -2.14   -4.68   -2.01  188.72  122.79  176.24  117.69  174.37


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

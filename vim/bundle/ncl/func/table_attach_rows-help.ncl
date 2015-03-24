THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/table_attach_rows.shtml
THE_TITLE:table_attach_rows
   NCL Home > Documentation > Functions > Variable manipulators

table_attach_rows

   Attaches [appends] additional rows to a previously existing
   two-dimensional array.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function table_attach_rows (
                t1      : [*][*],
                t2      : [*][*],
                opt [1] : integer
        )

        return_val [*][*]

Arguments

   t1

   A two-dimensional array of any type.
   t2

   A two-dimensional array of the same type as t1. The right dimension
   size [columns] must be identical to that of t1.
   opt

   An integer. Set to 0. Currently, not used.

Return value

   A two-dimensional array. The right dimension will be the same as on
   input. The left dimension will have additional rows appended to the t1
   table.

Description

   See the Example

See Also

   table_attach_columns, array_append_record

Examples

   Example 1

   Consider the two dimensional arrays x1 and x2. It is desired to append
   x2 to the x1 array and return a new array.

                                     ; x1 is 4X7
   x1 = (/(/-3.71, -3.70, -3.03, -3.85, -3.59, -4.38, -2.74/),\
          (/-1.72, -3.70, -3.64, -1.42, -3.65, -3.86, -2.99/),\
          (/-1.91, -4.92, -4.85, -3.84, -4.66, -2.01, -3.56/),\
          (/-4.17, -4.68, -4.41, -2.17, -3.42, -1.94, -2.42/)/)

                                       ; x2 is 2X7
   x2 = (/(/147.31, 185.95, 149.75, 100.24, 192.33, 175.25, 138.73/),\
          (/144.00, 180.11, 102.65, 115.32, 108.48, 193.24, 130.76/)/)

   Note the x1 and x2 have the same number of columns.
   a = table_attach_row (x1, x2, 0)   ; a is 6X7

  ;delete(x1)               ; no longer needed
  ;delete(x2)

   dima = dimsizes(a)
   nrow = dima(0)
   ncol = dima(1)

   write_matrix( a, ncol+"f8.2", False)

   will yield [a]

    -3.71   -3.70   -3.03   -3.85   -3.59   -4.38   -2.74
    -1.72   -3.70   -3.64   -1.42   -3.65   -3.86   -2.99
    -1.91   -4.92   -4.85   -3.84   -4.66   -2.01   -3.56
    -4.17   -4.68   -4.41   -2.17   -3.42   -1.94   -2.42
   147.31  185.95  149.75  100.24  192.33  175.25  138.73
   144.00  180.11  102.65  115.32  108.48  193.24  130.76


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

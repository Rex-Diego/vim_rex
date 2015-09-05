THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/array_append_record.shtml
THE_TITLE:array_append_record
   NCL Home > Documentation > Functions > Array manipulators, Variable
   manipulators

array_append_record

   Attaches [appends] additional records [leftmost dimension] to a
   previously existing array.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function array_append_record (
                x1      ,
                x2      ,
                opt [1] : integer
        )

Arguments

   x1

   An array of any shape and type.
   x2

   An array of the same rank as x1. All dimensions to the right of the
   record (leftmost) dimension must be identical.
   opt

   An integer. Set to 0. Currently, not used.

Return value

   A multi-dimensional array. The rightmost dimensions will be the same as
   on input. The left dimension will have additional records appended to
   the x1 array.

Description

   See the Example

See Also

   table_attach_columns, table_attach_rows

Examples

   Example 1

   Consider the two multi-dimensional arrays x1 and x2. It is desired to
   append x2 to the x1 array and return a new array.

   Let x1(ntim1, nlat,mlon) and x2(ntim2, nlat,mlon). Note that x1 and x2
   right dimensions are the same size.

   Then
   a = array_append_record (x1, x2, 0)

  ;delete(x1)
  ;delete(x2)


   will yield a(ntim, nlat, mlon) where ntim=ntim1+ntim2


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

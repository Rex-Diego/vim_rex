THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/merge_levels_sfc.shtml
THE_TITLE:merge_levels_sfc
   NCL Home > Documentation > Functions > Array manipulators, Variable
   manipulators

merge_levels_sfc

   Merges a multiple level variable with the corresponding surface
   variable.

   [new.gif] Available in version 5.2.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function merge_levels_sfc (
                x       : numeric      ,
                xsfc    : numeric   ,
                opt [1] : integer
        )

Arguments

   x

   An array of any the following shapes: x(lev), x(time,lev),
   x(lev,lat,lon), x(time,lev,lat,lon) or x(case,time,lev,lat,lon). It is
   required that the dimensions be named.
   xsfc

   An array of the one less rank than x. The shapes corresponding to the
   argument x: xsfc[1], xsfc(time), xsfc(lat,lon), xsfc(time,lat,lon) or
   xsfc(case,time,lat,lon). It is required that the dimensions be named.
   opt

   An integer:
   opt greater than or equal to zero if x is top-to-bottom ordering.
   opt less than zero if x is bottom-to-top ordering.

Return value

   A multi-dimensional array of the same rank as x but with one additional
   level.

Description

   Commonly, models and reanalysis datasets provide variable with multiple
   levels, say, x(time,lev,lat,lon) and a separate corresponding surface
   variable xsfc(time,lat,lon). In some applications, it may be useful to
   merge these into one variable. See the Example

See Also

   array_append_record, table_attach_columns, table_attach_rows

Examples

   Example 1

   Consider x(ntim,klev,nlat,mlon) and xsfc(ntim,nlat,mlon) where "x" is
   ordered bottom-to-top.
      xNew = merge_levels_sfc(x, xsfc, -1)    ; xNew(ntim,klev+1,nlat,mlon)

   Example 2

   See Example 4 at hydro. This illustrates one use of the
   merge_levels_sfc function.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

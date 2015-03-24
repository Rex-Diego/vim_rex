THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_cumsum_Wrap.shtml
THE_TITLE:dim_cumsum_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_cumsum_Wrap

   Calculates the cumulative sum along the rightmost dimension and retains
   meta data.

   [new.gif] Available in version 4.3.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_cumsum_Wrap (
                x    : numeric,
                opt  : integer
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   opt

   Option for how to treat _FillValue
     * opt = 0 ; when _FillValue is encounterd no additional summing will
       be performed.
     * opt = 1 ; when _FillValue is encounterd set element to _FillValue
       and resume summing
     * opt = 2 ; treat _FillValue as numeric zero when summing

Return value

   The same type and dimensionality x.

Description

   This function calculates the cumulative sum of all elements of the
   n-1th (rightmost) dimension for each index of the dimensions 0...n-2. A
   wrapper function. Missing values are treated differently as specified
   by opt. Use dim_cumsum_n_Wrap if you want to specify which dimension to
   do the average across.

See Also

   dim_cumsum_n_Wrap, cumsum, dim_cumsum, dim_cumsum_n, dim_rmvmean,
   dim_rmvmed

Examples

   Example 1: When no _FillValue are encountered all three options return
   the same result.
  x        = (/1,2,3,4,5/)
  x_sum    = sum(x)            ; result 15
  x_cumsum = dim_cumsum_Wrap(x, 0)  ; result (/1  3  6  10  15/)
  x_cumsum = dim_cumsum_Wrap(x, 1)  ; result (/1  3  6  10  15/)
  x_cumsum = dim_cumsum_Wrap(x, 2)  ; result (/1  3  6  10  15/)

   Example 2: When one or more _FillValue are encountered, each option
   yields a different answer.
  x        = (/1,2,-999,4,5/)
  x@_FillValue = -999
  x_sum    = sum(x)            ; result 12
  x_cumsum = dim_cumsum_Wrap(x, 0)  ; result (/1  3 -999 -999 -999/)
  x_cumsum = dim_cumsum_Wrap(x, 1)  ; result (/1  3 -999    7   12/)
  x_cumsum = dim_cumsum_Wrap(x, 2)  ; result (/1  3    3    7   12/)

   Example 3: Let p(time,lat,lon), use dimension reordering to make "time"
   the rightmost dimension and calculated cumulative sums at each time.
   The opt argument can be set by the user.

   Note: in V5.1.1, you will be able to use dim_cumsum_n_Wrap to avoid
   having to reorder your data.
  p_cumsum = dim_cumsum_Wrap(p(lat|:,lon:,time|:), opt)

  p_cumsum = dim_cumsum_n_Wrap(p, opt, 0)     ; no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

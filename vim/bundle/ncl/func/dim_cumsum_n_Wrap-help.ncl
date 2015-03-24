THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_cumsum_n_Wrap.shtml
THE_TITLE:dim_cumsum_n_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_cumsum_n_Wrap

   Calculates the cumulative sum along the given dimension(s) and retains
   meta data.

   [new.gif] Available in version 5.1.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_cumsum_n_Wrap (
                x        : numeric,
                opt      : integer,
                dims [*] : integer
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

   dims

   The dimension(s) of x on which to do the cumulative sum across.

Return value

   The same type and dimensionality x.

Description

   This function calculates the cumulative sum of all elements of
   dimensions indicated by dims for each index of the remaining
   dimensions. A wrapper function. Missing values are treated differently
   as specified by opt

See Also

   dim_cumsum_Wrap, dim_cumsum, dim_cumsum_n, cumsum, dim_cumsum,
   dim_rmvmean, dim_rmvmed

Examples

   Example 1: When no _FillValue are encountered all three options return
   the same result.
  x        = (/1,2,3,4,5/)
  x_sum    = sum(x)            ; result 15
  x_cumsum = dim_cumsum_n_Wrap(x, 0, 0)  ; result (/1  3  6  10  15/)
  x_cumsum = dim_cumsum_n_Wrap(x, 1, 0)  ; result (/1  3  6  10  15/)
  x_cumsum = dim_cumsum_n_Wrap(x, 2, 0)  ; result (/1  3  6  10  15/)

   Note: for a 1D array, it is simpler to use dim_cumsum_Wrap.

   Example 2: When one or more _FillValue are encountered, each option
   yields a different answer.
  x        = (/1,2,-999,4,5/)
  x@_FillValue = -999
  x_sum    = sum(x)            ; result 12
  x_cumsum = dim_cumsum_n_Wrap(x, 0, 0)  ; result (/1  3 -999 -999 -999/)
  x_cumsum = dim_cumsum_n_Wrap(x, 1, 0)  ; result (/1  3 -999    7   12/)
  x_cumsum = dim_cumsum_n_Wrap(x, 2, 0)  ; result (/1  3    3    7   12/)

   Example 3: Let p(time,lat,lon) and calculate cumulative sums at each
   time. The opt argument can be set by the user.
  p_cumsum = dim_cumsum_n_Wrap(p,opt,0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

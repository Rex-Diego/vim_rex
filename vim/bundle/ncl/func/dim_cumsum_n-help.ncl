THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_cumsum_n.shtml
THE_TITLE:dim_cumsum_n
   NCL Home > Documentation > Functions > General applied math

dim_cumsum_n

   Calculates the cumulative sum along the given dimension(s).

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_cumsum_n (
                x        : numeric,
                opt      : integer,
                dims [*] : integer
        )

        return_val [dimsizes(x)] :  typeof(x)

Arguments

   x

   A variable of numeric type and any dimensionality.
   opt

   Option for how to treat _FillValue.
     * opt = 0 ; when _FillValue is encountered no additional summing will
       be performed.
     * opt = 1 ; when _FillValue is encountered set element to _FillValue
       and resume summing.
     * opt = 2 ; treat _FillValue as numeric zero when summing.

   dims

   The dimension(s) of x on which to do the cumulative sum across.

Return value

   The same type and dimensionality as x.

Description

   The dim_cumsum_n function calculates the cumulative sum of all elements
   of the dimensions indicated by dims for each index of the remaining
   dimensions. Missing values are treated differently as specified by opt.

   Use dim_cumsum_n_Wrap if retention of metadata is desired.

See Also

   dim_cumsum, cumsum, dim_cumsum_n_Wrap, dim_rmvmean_n, dim_rmvmed_n

Examples

   Example 1:

   When no _FillValue are encountered all three options return the same
   result.
  x        = (/1,2,3,4,5/)
  x_sum    = sum(x)            ; result 15
  x_cumsum = dim_cumsum_n(x, 0, 0)  ; result (/1  3  6  10  15/)
  x_cumsum = dim_cumsum_n(x, 1, 0)  ; result (/1  3  6  10  15/)
  x_cumsum = dim_cumsum_n(x, 2, 0)  ; result (/1  3  6  10  15/)

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_cumsum.

   Example 2:

   When one or more _FillValue are encountered, each option yields a
   different answer.
  x        = (/1,2,-999,4,5/)
  x@_FillValue = -999
  x_sum    = sum(x)            ; result 12
  x_cumsum = dim_cumsum_n(x, 0, 0)  ; result (/1  3 -999 -999 -999/)
  x_cumsum = dim_cumsum_n(x, 1, 0)  ; result (/1  3 -999    7   12/)
  x_cumsum = dim_cumsum_n(x, 2, 0)  ; result (/1  3    3    7   12/)

   Example 3:

   Let p(time,lat,lon). Calculate cumulative sums at each time. The opt
   argument can be set by the user.
  p_cumsum = dim_cumsum_n(p, opt, 0)  ; (ntim,nlat,mlon)
or, to retain meta data
  p_cumsum = dim_cumsum_n_Wrap(p, opt, 0)

   Example 4:

   Let p(time,lev,lat,lon). Calculate cumulative sums at each time and
   level. The opt argument can be set by the user.
  p_cumsum = dim_cumsum_n(p, opt, (/0,1/))  ; (ntim,nlev,nlat,mlon)
or, to retain meta data
  p_cumsum = dim_cumsum_n_Wrap(p, opt, (/0,1/))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

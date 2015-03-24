THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_cumsum.shtml
THE_TITLE:dim_cumsum
   NCL Home > Documentation > Functions > General applied math

dim_cumsum

   Calculates the cumulative sum along the rightmost dimension.

Prototype

        function dim_cumsum (
                x    : numeric,
                opt  : integer
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

Return value

   The same type and dimensionality as x.

Description

   The dim_cumsum function calculates the cumulative sum of all elements
   of the n-1th (rightmost) dimension for each index of the dimensions
   0...n-2. Missing values are treated differently as specified by opt.

   Use dim_cumsum_n if you want to specify which dimension(s) to do the
   cumulative sum across.

   Use dim_cumsum_Wrap if retention of metadata is desired.

See Also

   cumsum, dim_cumsum_n, dim_cumsum_Wrap, dim_cumsum_n_Wrap, dim_rmvmean,
   dim_rmvmed

Examples

   Example 1: When no _FillValue are encountered all three options return
   the same result.
  x        = (/1,2,3,4,5/)
  x_sum    = sum(x)            ; result 15
  x_cumsum = dim_cumsum(x, 0)  ; result (/1  3  6  10  15/)
  x_cumsum = dim_cumsum(x, 1)  ; result (/1  3  6  10  15/)
  x_cumsum = dim_cumsum(x, 2)  ; result (/1  3  6  10  15/)

   Example 2: When one or more _FillValue are encountered, each option
   yields a different answer.
  x        = (/1,2,-999,4,5/)
  x@_FillValue = -999
  x_sum    = sum(x)            ; result 12
  x_cumsum = dim_cumsum(x, 0)  ; result (/1  3 -999 -999 -999/)
  x_cumsum = dim_cumsum(x, 1)  ; result (/1  3 -999    7   12/)
  x_cumsum = dim_cumsum(x, 2)  ; result (/1  3    3    7   12/)

   Example 3: Let p(time,lat,lon), use dimension reordering to make "time"
   the rightmost dimension and calculate cumulative sums at each time. The
   opt argument can be set by the user.

  p_cumsum = dim_cumsum(p(lat|:,lon:,time|:), opt)  ; (nlat,mlon,ntim)
or, to retain meta data
  p_cumsum = dim_cumsum_Wrap(p(lat|:,lon:,time|:), opt)

   Note: in V5.1.1, you will be able to use dim_cumsum_n to avoid having
   to reorder your data.

  p_cumsum = dim_cumsum_n(p, opt, 0)
  p_cumsum = dim_cumsum_n_Wrap(p, opt, 0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

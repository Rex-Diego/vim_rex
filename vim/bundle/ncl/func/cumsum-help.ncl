THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cumsum.shtml
THE_TITLE:cumsum
   NCL Home > Documentation > Functions > General applied math

cumsum

   Calculates the cumulative sum.

Prototype

        function cumsum (
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

   The cumsum function calculates the cumulative sum of all elements.
   Missing values are treated differently as specified by opt.

See Also

   dim_cumsum, dim_cumsum_Wrap, dim_rmvmean, dim_rmvmed

Examples

   Example 1: When no _FillValue are encountered all three options return
   the same result.
  x        = (/1,2,3,4,5/)
  x_sum    = sum(x)            ; result 15
  x_cumsum = cumsum(x, 0)  ; result (/1  3  6  10  15/)
  x_cumsum = cumsum(x, 1)  ; result (/1  3  6  10  15/)
  x_cumsum = cumsum(x, 2)  ; result (/1  3  6  10  15/)

   Example 2: When one or more _FillValue are encountered, each option
   yields a different answer.
  x        = (/1,2,-999,4,5/)
  x@_FillValue = -999
  x_sum    = sum(x)            ; result 12
  x_cumsum = cumsum(x, 0)  ; result (/1  3 -999 -999 -999/)
  x_cumsum = cumsum(x, 1)  ; result (/1  3 -999    7   12/)
  x_cumsum = cumsum(x, 2)  ; result (/1  3    3    7   12/)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

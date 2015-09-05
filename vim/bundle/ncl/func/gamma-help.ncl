THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gamma.shtml
THE_TITLE:gamma
   NCL Home > Documentation > Functions > General applied math

gamma

   Evaluates the complete gamma function.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function gamma (
                x  : numeric
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   An array of any dimensionality containing the values at which the gamma
   function is to be evaluated.

Return value

   The value returned will be the same type and dimensionality as x.

Description

   gamma calculates the complete gamma function. It may be used to compute
   factorials.

   Note that in V6.1.0 and 6.1.1, this function does not work if your data
   contains missing values. We will fix this in the next release of NCL.
   For a work-around, see example 2 below.

See Also

   cdfgam_p, cdfgam_x, gammainc

Examples

   Example 1

   N = 7
   x = new(N,"double")
   x(0) = 0.5
   x(1) = 0.33333333
   x(2) = 0.25
   x(3) = 0.20
   x(4) = 2.00
   x(5) = 3.00
   x(6) = 4.00

   xgam = gamma(x)
   print(xgam)

   Output:

(0)     1.772453850905516
(1)     2.678938451355363
(2)     3.625609908221908
(3)     4.590843639635322
(4)        1
(5)        2
(6)        6

   Example 2

   If your input data contains missing values, then you can use this
   work-around function called "gamma_fix" in place of gamma.
undef ("gamma_fix")
function gamma_fix(z:numeric)
local x, dimx, rankx, i, x1d
begin
  x = z

  if (isatt(x,"_FillValue")) then
      if (any(ismissing(x))) then
          dimx  = dimsizes(x)
          rankx = dimsizes(dimx)

          if (rankx.eq.1) then
              i    = ind(.not.ismissing(x))
              x(i) = gamma(x(i))
              return(x)
          else
              x1d    = ndtooned(x)
              i      = ind(.not.ismissing(x1d))
              x1d(i) = gamma(x1d(i))
              return( onedtond(x1d, dimx) )
          end if
      else
           x = gamma(x)
           return(x)
      end if
  else
      x = gamma(x)
      return(x)
  end if
end

   Here's an example of how to use the fix:

;=========  MAIN  =======================================

   x    = (/ 0.5, 0.33333333, 0.25, 0.2, 2, 3, 4 /)
   gx_a = gamma_fix(x)
   print(gx_a)
   print("================")

   x(1) = 1e20
   x(5) = 1e20
   print("================")
   x@_FillValue = 1e20
   gx_b = gamma_fix(x)
   print(gx_b)

   print("================")
   x@_FillValue = -999.
   gx_c = gamma_fix(x)
   print(gx_c)

;-------------------------------------------------
   nx = dimsizes(x)

   q  = conform_dims((/2,3,nx/), x, 2)
   gq = gamma_fix(q)
   print(gq)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

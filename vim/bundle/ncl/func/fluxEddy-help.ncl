THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fluxEddy.shtml
THE_TITLE:fluxEddy
   NCL Home > Documentation > Functions > Meteorology

fluxEddy

   Calculates time averaged eddy flux quantities.

Prototype

        function fluxEddy (
                x  : numeric,
                y  : numeric
        )

        return_val  :  numeric

Arguments

   x

   An array with one or more dimensions. The rightmost dimension must be
   time.
   y

   An array with one or more dimensions. It must have the same dimensions
   as x.

Return value

   An array of the same size as the input minus the rightmost dimension.
   Double if any input is double, float otherwise.

Description

   Calculates time averaged eddy flux quantities computed in one pass.
   Missing values are allowed.The approach used is:
x=X+x'
y=Y+y'

   where X and Y are time averages, then
x'y' = ave{x*y} - X*Y.

Examples

   Example 1 Let x and y be 64 x 128 x 90
    xpyp = fluxEddy(x,y)
;   xpyp = x'y' will be a 64 x 128 array

   Example 2

   Let u and v be four-dimensional with dimensions time, lev, lat, and
   lon. reorder to make time the rightmost dimension.
  upvp = fluxEddy(u(lev|:,lat|:,lon|:,time|:),v(lev|:,lat|:,lon|:,time|:))
; upvp will be three-dimensional with dimensions lev, lat, lon.

   Example 3

   Calculate the eddy variance of quantity z. (i.e. ave{z'z'}):
    zpzp = fluxEddy(z,z)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

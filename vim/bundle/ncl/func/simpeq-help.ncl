THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/simpeq.shtml
THE_TITLE:simpeq
   NCL Home > Documentation > Functions > General applied math

simpeq

   Integrates a sequence of equally spaced points using Simpson's Rule.

Prototype

        function simpeq (
                fi     : numeric,
                dx [1] : numeric
        )

        return_val  :  float or double

Arguments

   fi

   An array of one or more dimensions. The rightmost dimension is the
   dimension to be interpolated. Missing values are not allowed.
   dx

   A constant representing the interval between points.

Return value

   The return value will have same dimensions as all but the rightmost
   dimension of fi (or be a scalar if fi is one-dimensional). The return
   type will be double if fi is double, and float otherwise.

Description

   This function performs the Classic Simpson's three-point formula for
   integration. The number of points may be odd or even. Missing values
   are not allowed.

   Other integration functions that may better fit your needs include see
   vibeta and ftcurvi.

See Also

   ftcurvi, vibeta, simpne

Examples

   Example 1

   Evaluate exp^x from x=1.8 to x=3.4. Exact answer should be 23.91446:

   dx = 0.2        ; say: x  = (/1.8, 2.0, 2.2, 2.4, 2.6, 2.8, 3.0, 3.2, 3.4/)

   y  = exp(x)     ;      y  = f(x)=exp(x)
   result = simpeq(y,dx)        ; = 23.91467

   Example 2

   Assume y contains (imperfect) measurements:
   y = (/ 5.9, 7.3, 9.0, 10.8, 13.3, 15.9, 20.2, 25.3, 29.4/)
   result = simpeq(y,dx)        ; = 23.83


   dx = 0.2
   y  = exp((/1.8, 2.0, 2.2, 2.4, 2.6, 2.8, 3.0, 3.2, 3.4/)    ; y=f(x)=exp(x)
   result = simpeq(y,dx)        ; = 23.91467

   Example 3

   Assume f is dimensioned nloc x ntim. For each location, integrate over
   time:
  dt = 3.5
  result  = simpeq(f,dt)         ; result(nloc)

   Example 4

   Assume f is dimensioned ntim x klev x nlat x mlon with named dimensions
   "time", "lev", "lat", and "lon". Integrate over time:
  dt = 1.0
  result  = simpeq(f(lev|:,lat|:,lon|:,time|:),dt)    ; result(klev,nlat,mlon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

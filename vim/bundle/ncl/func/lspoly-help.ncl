THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/lspoly.shtml
THE_TITLE:lspoly
   NCL Home > Documentation > Functions > General applied math

lspoly

   Calculates a set of coefficients for a weighted least squares
   polynomial fit to the given data.

Prototype

        function lspoly (
                x     : numeric,
                y     : numeric,
                wgt   : numeric,
                n [1] : integer
        )

        return_val  :  float or double

Arguments

   x

   Abscissa values of the data.

   This can be one-dimensional or multi-dimensional. If one-dimensional,
   it must be the same length as the rightmost dimension of y. If
   multi-dimensional, it must be the same dimensionality as y.
   y

   Ordinate values of the data.

   This can be one-dimensional or multi-dimensional. If one-dimensional,
   it must be the same length as the rightmost dimension of y. If
   multi-dimensional, it must be the same dimensionality as y.
   wgt

   Weights for a weighted least squares model. If all data values are to
   be assigned equal weights, then setting the argument equal to a scalar
   1.0 will result in all the weights being set to 1.0. Note: if x or y is
   equal to _FillValue (if present), the weight will be set to 0.0 for
   that coordinate pair.
   n

   The number of coefficients desired (i.e., n-1 will be the degree of the
   polynomial). Due to the computational method used, n should be less
   than or equal to five.

Return value

   The return array will have the same dimensionality as y, except the
   rightmost dimension will be of length n.

   If either x or y are of type double, then the return array is returned
   as double. Otherwise, the returned coefficients are returned as type
   float.

Description

   Given a set of data (x(i),y(i)), i = 1,...,m, lspoly calculates a set
   of coefficients for a weighted least squares polynomial fit to the
   given data. It is necessary that the number of data points) be greater
   than n (the number of coefficients).

   Accuracy: for lower order polynomials (n .le. 5), lspoly can be
   expected to give satisfactory results.

   Algorithm: lspoly forms the normal and solves the resulting square
   linear system using gaussian elimination with full pivoting.

   Note: In NCL versions 6.1.2 and earlier, this function would fail in
   certain cases where the input data were "scaled" down. We replaced this
   routine with a SLATEC version. It takes the same arguments, but uses a
   different algorithm under the hood. You can get the "old" (pre NCL
   V6.2.0) version of lspoly by using "lspoly_old", but we don't recommend
   it for regular use.

   Use lspoly_n if you want to specify which dimension(s) to do the
   calculation across.

See Also

   lspoly_n, regCoef, regline, regcoef, reg_multlin

Examples

   Example 1

  x = (/-4.5, -3.2, -1.4, 0.8, 2.5, 4.1/)
  y = (/ 0.7,  2.3,  3.8, 5.0, 5.5, 5.6/)

  n = 4
  c = lspoly(x,y, 1, n)    ; all weights are set to one
  print(c)

   The 3rd degree polynomial is
         Y = c(0) + c(1)*x + c(2)*x^2 + c(3)*x^3

   The coefficients (which agree with those returned from Mathematica)
   are:
(0)      4.66863
(1)      0.489392
(2)     -0.0742387
(3)      0.00267663


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

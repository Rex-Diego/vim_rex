THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/csa1xs.shtml
THE_TITLE:csa1xs
   NCL Home > Documentation > Functions > Interpolation

csa1xs

   Calculates an approximating cubic spline for the input data, one
   1-dimensional section at a time.

Prototype

        function csa1xs (
                xi         : float,
                yi         : float,
                wts        : float,
                knots  [1] : integer,
                smth   [1] : float,
                nderiv [1] : integer,
                xo     [*] : float
        )

        return_val  :  float

Arguments

   xi

   An array of any dimensionality containing the X coordinates of the
   input data points. The array must either have the same dimensions as Y
   or be one-dimensional and have the same dimension as the rightmost
   dimension of Y (call the rightmost dimension nxi).
   yi

   An array of any dimensionality (see description of xi) containing the Y
   coordinates of the input data points.
   wts

   A scalar or an array of length nxi containing weights for the yi values
   at the input xi values. If wts is an array, then wts(k) is a weight for
   the value of yi(...,k) for k=0,nxi-1. If you do not desire to weight
   the input yi values, then set wts equal to -1. The weights in the wts
   array are relative and may be set to any non-negative value. When
   csa1xs is called, the weights are summed and the individual weights are
   normalized so that the weight sum is unity.
   knots

   The number of knots to be used in constructing the approximation
   spline. knots must be at least 4. The larger the value for knots, the
   closer the approximated curve will come to passing through the input
   function values.
   smth

   A parameter that controls extrapolation into sparse data regions. If
   smth is zero, then nothing special is done in sparse data regions. A
   good first choice for smth is 1.
   nderiv

   Specifies whether you want functional values (nderiv=0), first
   derivative values (nderiv=1), or second derivative values (nderiv=2) to
   be returned.
   xo

   A one-dimensional array of length nxo containing the X coordinates of
   the output curve(s).

Return value

   An array containing the calculated functional values. The array has the
   same dimensionality as yi, but with the rightmost dimension replaced by
   nxo; it contains functional values for each element of xo.

Description

   This function is part of the Csagrid package - a software package that
   implements a cubic spline approximation algorithm to fit a function to
   input data. The input for the approximation is a set of randomly-spaced
   data, which may be one-dimensional, two-dimensional, or
   three-dimensional. The general documentation for Csagrid contains
   several complete examples.

   The following three one-dimensional functions all do the same thing,
   differing only in the type of the input and output arrays: csa1
   (generic input/output); csa1s (single input/output); csa1d (double
   input/output).

   If you want to weight the input data values, calculate derivatives, or
   handle sparse data areas specially, you should instead use one of these
   "expanded" functions (note the "x" following the "1" in the name):
   csa1x (generic input/output); csa1xs (single input/output); csa1xd
   (double input/output).

Examples

begin

;  Define original data.

  xi = (/0.0 ,0.1 , 0.2 , 0.3 ,0.5 ,0.6 ,0.65 , 0.8 , 0.9 ,1. /)
  yi = (/0.0 ,0.8 ,-0.9 ,-0.9 ,0.9 ,1.0 ,0.90 ,-0.8 ,-0.8 ,0. /)

;  Create output X coordinate array.

  npts = 101
  xo   = fspan(0.0 ,1.0 ,npts)

;  Calculate approximated first derivative values.

  knots = 4
  wts = -1.
  smth = 0.
  nderiv = 1
  yo = csa1xs(xi,yi,wts,knots,smth,nderiv,xo)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

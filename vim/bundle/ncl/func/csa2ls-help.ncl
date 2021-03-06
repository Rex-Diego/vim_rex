THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/csa2ls.shtml
THE_TITLE:csa2ls
   NCL Home > Documentation > Functions > Interpolation

csa2ls

   Calculates an approximating cubic spline for two-dimensional input
   data.

Prototype

        function csa2ls (
                xi    [*] : float,
                yi    [*] : float,
                zi        : float,
                knots [2] : integer,
                xo    [*] : float,
                yo    [*] : float
        )

        return_val  :  float

Arguments

   xi

   A 1-dimensional array of length nxi containing the X coordinates of the
   input data points.
   yi

   A 1-dimensional array of length nxi containing the Y coordinates of the
   input data points.
   zi

   An array of any dimensionality (last dimension must be nxi) containing
   the functional values at the input data coordinates given by xi and yi.
   That is, zi(...,i) is the input function value at (xi(i),yi(i)) for i=0
   to nxi-1.
   knots

   The number of knots to be used in constructing the approximating
   surface. knots(0) and knots(1) must both be at least 4. The larger the
   value for knots, the closer the approximated surface will come to
   passing through the input function values.
   xo

   A one-dimensional array of length nxo containing the X coordinates of a
   list of points where functional values are desired. xo can be a single
   point.
   yo

   A one-dimensional array of the same length as xo containing the Y
   coordinates of a list of points where functional values are desired. yo
   can be a single point.

Return value

   An array containing the calculated functional values. The array will be
   the same size as zi, except that the last dimension will be of length
   nxo. If zo is the returned value, then zo(...,i) contains the
   functional value at coordinate (xo(i),yo(i)) for i=0,nxo-1.

Description

   This function is part of the Csagrid package - a software package that
   implements a cubic spline approximation algorithm to fit a function to
   input data. The input for the approximation is a set of randomly-spaced
   data, which may be one-dimensional, two-dimensional, or
   three-dimensional. The general documentation for Csagrid contains
   several complete examples.

   The following three two-dimensional functions all do the same thing,
   differing only in the type of the input and output arrays: csa2
   (generic input/output); csa2s (single input/output); csa2d (double
   input/output).

   If you want to weight the input data values, calculate derivatives, or
   handle sparse data areas specially, you should instead use one of these
   "expanded" functions (note the "x" following the "2" in the name):
   csa2x (generic input/output); csa2xs (single input/output); csa2xd
   (double input/output).

   If you want to compute function values at a specified list of
   coordinate positions, rather than at coordinate positions forming a
   rectangular grid, you should use one of these six "list form" functions
   (note the "l" following the "2" in the name): csa2l; csa2ls; csa2ld;
   csa2lx; csa2lxs; csa2lxd.

Examples

begin

;
;  Create the input arrays.
;
  xmin = -1.4
  xmax =  1.4
  ymin = -1.2
  ymax =  1.2

  ndata = 500
  xi = new(ndata,float)
  yi = new(ndata,float)
  zi = new(ndata,float)

  do i=0,ndata-1
    xi(i) = xmin + (xmax-xmin)*rand()/32767.
    yi(i) = ymin + (ymax-ymin)*rand()/32767.
    zi(i) = xi(i) + yi(i)
    t1 = 1.0/((fabs(xi(i)-0.1))^2.75 + fabs(yi(i))^2.75 + 0.09)
    t2 = 1.0/((fabs(xi(i)+0.1))^2.75 + fabs(yi(i))^2.75 + 0.09)
    zi(i) = 0.3*(zi(i)+t1-t2)
  end do

;
;  Find an approximated value at a single point.
;
  knots = (/10,10/)
  xo = 0.
  yo = 0.
  zo = csa2ls(xi,yi,zi,knots,xo,yo)

end


   �2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

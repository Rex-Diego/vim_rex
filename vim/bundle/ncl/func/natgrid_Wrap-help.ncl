THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/natgrid_Wrap.shtml
THE_TITLE:natgrid_Wrap
   NCL Home > Documentation > Functions > Interpolation

natgrid_Wrap

   Interpolates data from an unstructured (randomly-spaced) grid to a
   rectilinear grid using natural neighbor interpolation and retains
   metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function natgrid_Wrap (
                x  [*] : numeric,
                y  [*] : numeric,
                z      : numeric,
                xo [*] : numeric,
                yo [*] : numeric
        )

        return_val  :  float or double

Arguments

   x

   An array of length npts containing the X coordinates of the input data
   points.
   y

   An array of length npts containing the Y coordinates of the input data
   points.
   z

   An array of any dimensionality (with the last dimension being npts)
   containing the functional values of the input data points. That is,
   z(...,i) is the value of the input function at coordinate (x(i),y(i))
   for i=0,npts-1.
   xo

   A 1D array of any length (NumXOut) containing the X coordinates of the
   output data grid. The values in xo must be increasing, but need not be
   equally spaced.
   yo

   A 1D array of any length (NumYOut) containing the Y coordinates of the
   output data grid. The values in yo must be increasing, but need not be
   equally spaced.

Return value

   An array of dimension N x NumXOut x NumYOut, where N represents all but
   the last (rightmost) dimension of z, containing the interpolated
   functional values at the points specified by xo and yo.

   The output array will be of type double if any of the input is double,
   and float otherwise.

Description

   This function performs interpolation from data on an unstructured grid
   to data on a rectilinear grid.

   It is part of the Natgrid package, which implements a natural neighbor
   interpolation method. Much useful information is available at the above
   link, including the descriptions of many control parameters that can be
   modified to materially change the behavior of the package. (The
   functions nngetp and nnsetp are used to access these parameters.)

   natgrid_Wrap accepts a set of randomly-positioned 2D point coordinates,
   together with function values at those coordinates, and returns a set
   of interpolated function values at coordinates on a user-specified
   rectangular grid. No missing values are allowed in the input data
   arrays.

   natgrid_Wrap allows the input arrays to be of any numeric type, but it
   coerces them to type double and calls the same double-precision code as
   natgridd. It is important to know this when deciding which of the
   functions that retrieve aspects and slopes (nngetaspectd, nngetaspects,
   nngetsloped, and nngetslopes) to call.

   Note: natgrid_Wrap is meant to be used by itself. It will not work in
   conjunction with the Natgrid routines named nnpnt[init|end][s|d] and
   nngetwts[d], which are used cooperatively in "specified-point" mode.

   This function is identical to the built-in function natgrid except it
   retains metadata.

Examples

begin
  NumXOut = 21
  NumYOut = 21
  ISLIM = 6
  x = new((/ISLIM/),double)
  y = new((/ISLIM/),double)
  z = new((/ISLIM/),double)
  xi = new((/NumXOut/),double)
  yi = new((/NumYOut/),double)

  x = (/0.00, 1.00, 0.00, 1.00, 0.40, 0.75/)
  y = (/0.00, 0.00, 1.00, 1.00, 0.20, 0.65/)
  z = (/0.00, 0.00, 0.00, 0.00, 1.25, 0.80/)

  xc = 1./(NumXOut-1.)
  xi = ispan(0,NumXOut-1,1) * xc

  yc = 1./(NumYOut-1.)
  yi = ispan(0,NumYOut-1,1) * yc

  zi = natgrid_Wrap(x, y, z, xi, yi)
end

Errors

   If an error code is returned by natgrid_Wrap, you can look up the
   meaning of the code in the Natgrid error table.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

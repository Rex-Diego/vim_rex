THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/natgrid.shtml
THE_TITLE:natgrid
   NCL Home > Documentation > Functions > Interpolation

natgrid

   Interpolates data from an unstructured (randomly-spaced) grid to a
   rectilinear grid using natural neighbor interpolation.

Prototype

        function natgrid (
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

   natgrid accepts a set of randomly-positioned 2D point coordinates,
   together with function values at those coordinates, and returns a set
   of interpolated function values at coordinates on a user-specified
   rectangular grid. No missing values are allowed in the input data
   arrays.

   As of NCL version 4.2.0.a033 Natgrid culls duplicate points. If any of
   the x/y/z triples are duplicates, they will automatically be culled.
   Informational messages are printed indicating which points have been
   culled. There is an upper limit on the number of such messages, the
   default being ten. This limit can be adjusted using the control
   parameter "mdm"; setting "mdm" to zero suppress all such messages. If
   two x/y coordinate pairs are duplicates, but the z values are distinct,
   then a fatal error is issued. The user needs to figure out how to
   handle such data.

   natgrid allows the input arrays to be of any numeric type, but it
   coerces them to type double and calls the same double-precision code as
   natgridd. It is important to know this when deciding which of the
   functions that retrieve aspects and slopes (nngetaspectd, nngetaspects,
   nngetsloped, and nngetslopes) to call.

   natgrid can be used to interpolate at a list of specified points. To do
   this one must first enter "specified-point mode" by calling nnpntinit,
   then calling nnpnt to do the interpolation, and finally calling
   nnpntend to exit "specified-point mode."

See Also

   natgrid_Wrap, obj_anal_ic, obj_anal_ic_Wrap, triple2grid, triple2grid2d

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

  zi = natgrid(x, y, z, xi, yi)
end

Errors

   If an error code is returned by natgrid, you can look up the meaning of
   the code in the Natgrid error table.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

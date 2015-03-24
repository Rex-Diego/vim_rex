THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cssgrid.shtml
THE_TITLE:cssgrid
   NCL Home > Documentation > Functions > Interpolation

cssgrid

   Uses tension splines to interpolate unstructured (randomly-spaced) data
   on a unit sphere to data values on a rectilinear grid.

Prototype

        function cssgrid (
                rlat [*] : numeric,
                rlon [*] : numeric,
                fval     : numeric,
                plat [*] : numeric,
                plon [*] : numeric
        )

        return_val  :  float or double

Arguments

   rlat
   rlon

   Arrays containing latitude and longitude values specifying locations of
   the input data. rlat and rlon are one-dimensional arrays of the same
   size, specified in degrees. The first three points must not lie on a
   common great circle.
   fval

   An array containing data values. fval can have any number of
   dimensions, but the final dimension must be the same size as that of
   rlat and rlon. This allows for multiple input datasets defined at the
   coordinates specified by rlat and rlon.
   plat

   An array containing the latitudes, in degrees, of the output
   rectilinear grid.
   plon

   An array containing the longitudes, in degrees, of the output
   rectilinear grid.

Return value

   An array containing interpolated functional values. The final two
   dimensions of the output array will be the same sizes as those of plat
   and plon, respectively; the array element with indices (...,i,j) will
   be the function value at a grid point having latitude plat(i) and
   longitude plon(j).

   The other dimensions and the dimension sizes of the output array will
   be the same as the dimensions of fval preceding the final dimension.
   For example, if fval is a two-dimensional array with dimension sizes 5
   and 10, plat is of size 15 and plon is of size 17, then the output
   array will have three dimensions of sizes 5, 15, and 17, respectively.

   The array is double if any of the input values is double; otherwise, it
   is float.

Description

   cssgrid is in the Cssgrid package - a software package that implements
   a tension spline interpolation algorithm to fit a function to input
   data randomly spaced on a unit sphere.

   The general documentation for Cssgrid contains complete examples for
   entries in the package.

   If missing values are detected in the input data, then those values are
   ignored when calculating the interpolating function.

See Also

   cssgrid_Wrap, obj_anal_ic, obj_anal_ic_Wrap, natgrid, natgrid_Wrap,
   triple2grid, triple2grid2d

Examples

begin

  ndata = 1000
  rlat = new(ndata,float)
  rlon = new(ndata,float)
  fval = new(ndata,float)

;
  do i=0,ndata-1
    rlat(i) =  -90. + 180.*rand()/32767.
    rlon(i) = -180. + 360.*rand()/32767.
  end do
  cartesian = css2c(rlat,rlon)
  fval = cartesian(0,:)^2 + cartesian(1,:)^2 - 0.5*cartesian(2,:)^2

;
;  Set up the output grid.
;
  nx = 73
  ny = 143
  plat =  90.*fspan(-1.,1.,nx)
  plon = 180.*fspan(-1.,1.,ny)

;
;  Calculate the interpolated function values.
;
  fint = cssgrid(rlat,rlon,fval,plat,plon)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

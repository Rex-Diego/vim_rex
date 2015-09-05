THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/csc2s.shtml
THE_TITLE:csc2s
   NCL Home > Documentation > Functions > Interpolation

csc2s

   Converts Cartesian coordinates on a unit sphere to spherical
   coordinates (lat/lon).

Prototype

        function csc2s (
                x  : numeric,
                y  : numeric,
                z  : numeric
        )

        return_val [2,dimsizes(x)] :  float or double

Arguments

   x
   y
   z

   Cartesian coordinates on a unit sphere. These variables can have any
   number of dimensions, but all must have the same number of dimensions
   and dimension sizes.

Return value

   An array of latitudes and longitudes having first dimension 2 and other
   dimensions agreeing in number and size with those of the input arrays.
   The latitude values will have a first index of 0 and the longitude
   values a first index of 1.

   If either of the input arrays is double, the output array will be
   double; in all other cases, the output array will be float.

   If any input x, y, or z is a missing value, both the corresponding
   returned latitude and longitude will have a value calculated in the
   following way: it will be the value set for the parameter MVL if it has
   been set (see cssetp for how to set parameter values); or the value of
   x@_FillValue if x is a missing value; or the value of y@_FillValue if
   either x@_FillValue is not set or the value for x is not a missing
   value; or the value of z@_FillValue if either x@_FillValue is not set
   or the value for x is not a missing value and if either y@_FillValue is
   not set or the value for y is not a missing value.

   The default value for the MVL parameter is -8.; this is used simply as
   a flag to verify if a value has been set for that parameter.

Description

   csc2s converts Cartesian coordinates on a unit sphere to lat/lon
   coordinates on a sphere. All latitude and longitude coordinates are
   expressed in degrees. The point at 0 degrees latitude and 0 degrees
   longitude is identified with Cartesian coordinate (1.,0.,0.).

   This function is in the Cssgrid package - a software package that
   implements a tension spline interpolation algorithm to fit a function
   to input data randomly spaced on a sphere.

   The general documentation for Cssgrid contains complete examples for
   entries in the package.

Examples

begin

;
;  Specify the value to be returned when a missing value
;  is encountered in the input.
;
  missing_val_return = -100.5
  cssetp("mvl", missing_val_return)

  rlat = new((/2,5/),integer)

;
;  Define rlat that contains a missing value.
;
;  In NCL versions 5.2.x and earlier, the "new" function sets a
;  default missing value integer missing value of -999.
;  In versions 6.0.0 and greater, this value is -2147483647.
;
  imsg = -2147483647     ; In v6.0.0, can use
                         ; imsg = default_value("integer")
                         ; to get default.
  rlat = (/                                          \
           (/ -89, -45, imsg,  45 ,  89 /),     \
           (/  89,  45,    0, -45 , -89 /)      \
         /)

  rlon = (/                                     \
           (/-179., -90., 0., 90., 179./),      \
           (/ 179.,  90., 0.,-90.,-179./)       \
         /)

;
;   Convert the lat/lon input to Cartesian coordinates on the
;   unit sphere.  The _FillValue attribute for rval will be
;   set to missing_val_return on return.
;
  rval = css2c(rlat, rlon)
  print(rval)

;
;   Extract the x, y, and z coordinates of the Cartesian coordinates
;   as arrays.
;
  x = rval(0,:,:)
  y = rval(1,:,:)
  z = rval(2,:,:)

  print(x)
  print(y)
  print(z)

;
;  Do the reverse transformation.
;
  sval = csc2s(x,y,z)
  print(sval)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

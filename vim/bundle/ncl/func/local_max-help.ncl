THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/local_max.shtml
THE_TITLE:local_max
   NCL Home > Documentation > Functions > General applied math

local_max

   Determines the relative maxima for a 2-dimensional array.

Prototype

        function local_max (
                x [*][*] : float or double,
                cyclic   : logical,
                delta    : numeric
        )

        return_val [1] :  integer

Arguments

   x

   A 2-dimensional float or double array. Missing data are allowed and
   must be indicated by x@_FillValue.

   cyclic

   Set to False if the data array is not cyclic in x.

   Set to True if data are cyclic in the x-axis direction. In this case, x
   should not include the cyclic point.
   delta

   Tolerance level. If values are within delta of surrounding values it
   will not be counted as a local max value. Generally, delta=0.0

Return value

   Returns the number of relative max values found (nmax). If nmax is
   greater than zero, then nmax will have three 1-dimensional attribute
   arrays associated with it:
    1. nmax@xi - this will contain the x-axis indices (e.g. longitudes)
    2. nmax@yi - this will contain the y-axis indices (e.g. latitudes)
    3. nmax@maxval - this will contain the maximum values

   Each of these 1-dimensional attribute vectors will be of length nmax.

   If x is of type float, the return value is float. If x is of type
   double, the return value is of type double.

Description

   This function uses a simple algorithm. It looks at the points
   surrounding x and checks to see if they are greater than the central
   value. The central value is x + delta.

       1-----------8-----------7
       |           |           |
       |           |           |
       |           |           |
       2-----------0-----------6
       |           |           |
       |           |           |
       |           |           |
       3-----------4-----------5

See Also

   local_min, local_min_1d, local_max_1d

Examples

   Example 1

   Application example.

   Example 2

   Let x be a 2-dimensional array with dimension sizes nlat = 64 and mlon
   = 128 with coordinate variables "lat" and "lon," respectively. The data
   are cyclic. Do not use any tolerance [delta = 0.0]
    nmax = local_max(x, True, 0.0)

   If nmax = 3, then the attribute vectors might look like:
    nmax@xi     = (/  6,    114,     180 /)
    nmax@yi     = (/ 42,     76,     104 /)
    nmax@minval = (/ 70.0, -28.6,   -47.8 /)

   If it is desired to write this to, say, an ascii file, then:

   ncol   = 3
   data   = new ( (/nmin,ncol/) , typeof(x) )
   data(:,0) = nmax@xi
   data(:,1) = nmax@yi
   data(:,2) = nmax@minval

   opt = True
   opt@fout = "sample.max.txt"
   write_matrix( data, ncol + "f10.2", opt)

   The output file ["sample.max.txt"] would look like:
      6.00     42.00     70.00
    114.00     76.00    -28.60
    180.00    104.00    -47.80


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

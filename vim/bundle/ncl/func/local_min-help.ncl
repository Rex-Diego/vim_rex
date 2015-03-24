THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/local_min.shtml
THE_TITLE:local_min
   NCL Home > Documentation > Functions > General applied math

local_min

   Determines the relative minima for a 2-dimensional array.

Prototype

        function local_min (
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

   Set to True if data are cyclic in the x-axis direction. In this case,
   the x array should not include the cyclic point.
   delta

   Tolerance level. If values are within delta of surrounding values it
   will not be counted as a local min value. Generally, delta=0.0

Return value

   Returns the number of relative min values found (nmin). If nmin is
   greater than zero, then nmin will have three 1-dimensional attribute
   arrays associated with it:
    1. nmin@xi - this will contain the x-axis indices (e.g. longitudes)
    2. nmin@yi - this will contain the y-axis indices (e.g. latitudes)
    3. nmin@minval - this will contain the minimum values

   Each of these 1-dimensional attribute vectors will be of length nmin.

   If x is of type float, the return value is float. If x is of type
   double, the return value is of type double.

Description

   This function uses a simple algorithm. It looks at the points
   surrounding x and checks to see if they are less than the central
   value. The central value is x - delta.

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

   local_max, local_min_1d, local_max_1d

Examples

   Example 1

   Application example.

   Example 2

   Let x be a 2-dimensional array with dimension sizes nlat = 64 and mlon
   = 128 with coordinate variables "lat" and "lon". The data are cyclic
   (cyclic=True). Do not use any tolerance [delta = 0.0]
    nmin = local_min(x, True, 0.0)

   If nmin = 3, then the attribute vectors might look like:
    nmin@xi     = (/  3,     57,      90 /)
    nmin@yi     = (/ 21,     38,      52 /)
    nmin@minval = (/ 35.0,  -14.3,   -23.9 /)

   If it is desired to write this to, say, an ascii file, then:

   ncol   = 3
   data   = new ( (/nmin,ncol/) , typeof(x) )
   data(:,0) = nmin@xi
   data(:,1) = nmin@yi
   data(:,2) = nmin@minval

   opt = True
   opt@fout = "sample.txt"
   write_matrix( data, ncol + "f10.2", opt)

   The output file ["sample.txt"] would look like:
      3.00     21.00     35.00
     57.00     38.00    -14.30
     90.00     52.00    -23.90


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/runave.shtml
THE_TITLE:runave
   NCL Home > Documentation > Functions > General applied math

runave

   Calculates an unweighted running average on the rightmost dimension.

Prototype

        function runave (
                x        : numeric,
                nave [1] : integer,
                opt  [1] : integer
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   An array with one or more dimensions. The fastest varying (i.e.
   rightmost) dimension will be the dimension on which the unweighted
   running average is performed. Missing values should be indicated by
   x@_FillValue. If x@_FillValue is not set, then the NCL default
   (appropriate to the type of x) will be assumed.
   nave

   Number of points to be included in the running average.
   opt

   End-point option (opt = 0 is the most common option)

   In the following:

     N = {last point in the series, i.e. N = npts - 1}
     xi = {input series}
     xo = {output series}

opt < 0 : utilize cyclic conditions
           e.g., nave = 2
                 xo(0) = (xi(0) + xi(1))/nave
                 xo(N) = (xi(N) + xi(0))/nave
           e.g., nave = 3
                 xo(0) = (xi(N) + xi(0) + xi(1)) / nave
                 xo(N) = (xi(N - 1) + xi(N) + xi(0)) / nave
           e.g., nave = 4
                 xo(0) = (xi(N) + xi(0) + xi(1) + xi(2)) / nave
                 xo(N) = (xi(N - 1) + xi(N) + xi(0) + xi(1)) / nave

opt = 0 : set unsmoothed beginning and end pts to x@_FillValue [most common]
           e.g., nave = 2
                 xo(0) = (xi(0) + xi(1)) / nave
                 xo(N) = xi@_FillValue
           e.g., nave = 3
                 xo(0) = xi@_FillValue
                 xo(1) = (xi(0) + xi(1) + xi(2)) / nave
                 xi(N) = xi@_FillValue
           e.g., nave = 4
                 xo(0) = xi@_FillValue
                 xo(1) = (xi(0) + xi(1) + xi(2) + xi(3)) / nave
                 xo(N - 2) = (xi(N - 3) + xi(N - 2) + xi(N - 1) + xi(N)) / nave
                 xo(N - 1)= xi@_FillValue
                 xo(N)= xi@_FillValue

opt > 0 : utilize reflective (symmetric) conditions
           e.g., nave = 2
                 xo(0) = (xi(0) + xi(1)) / nave
                 xo(N) = (xi(N) + xi(N-1)) / nave
           e.g., nave = 3
                 xo(0) = (xi(1) + xi(0) + xi(1)) / nave
                 xo(N) = (xi(N - 1) + xi(N) + xi(N-1)) / nave
           e.g., nave = 4
                 xo(0) = (xi(2) + xi(1) + xi(0) + xi(1)) / nave
                 xo(N) = (xi(N - 1) + xi(N) + xi(N - 1) + xi(N - 2)) / nave

Return value

   Returns an array dimensioned the same x.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function returns an array of the same dimensionality as x with the
   last (rightmost) dimension smoothed.

   The running average is a special case of a filter where all weights are
   the same. The filter is applied to the i-th time of the requested
   series as follows:

     F(i) = SUM{UF(i - (nave / 2) + j + 1)} / nave for j = 0, nave - 1

   where F is the filtered field, UF is the unfiltered field, and nave is
   the number of elements in the running average.

   If the number of weights is even, the filter's center falls between
   series elements; in this case, the center is shifted one-half of a time
   increment towards the latter element.

   Use runave_Wrap if retention of metadata is desired.

   Use runave_n if the dimension to do the calculation on is not the
   rightmost dimension and reordering is not desired. This function can be
   significantly faster than runave.

See Also

   runave_n, runave_Wrap, runave_n_Wrap

Examples

   Example 1

   Let x be dimensioned nlat x mlon x ktimes where nlat = 64, mlon = 128,
   and ktimes = 1000. Perform a 3 point running average and use opt = 0.
   Return the smoothed value to the original x array:

  x = runave (x, 3, 0)

   Example 2

   Let x be dimensioned ntimes x nlat x mlon with named dimensions "time"
   , "lat" , "lon". Then:
    nave = 31
    opt  = 0
    y    = runave (x(lat|:, lon|:, time|:), nave, opt)

   y will be a 3-dimensional array of length nlat x mlon x time.

   Note: As of V5.2.0, you can use runave_n to avoid having to reorder
   your data:

    nave = 31
    opt  = 0
    y    = runave_n (x, nave, opt, 0)

   Example 3

   Let x be dimensioned ntimes x klev x nlat x mlon with named dimensions.
   Perform a 5 point running average use the cyclic option in the
   longitude direction:

    nave = 5
    opt = -1
    x = runave (x, nave, opt)  ; return the series in the original array


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_stat4.shtml
THE_TITLE:dim_stat4
   NCL Home > Documentation > Functions > General applied math

dim_stat4

   Computes the first four moments (average, variance, skewness, and
   kurtosis) of the rightmost dimension for all other dimensions.

Prototype

        function dim_stat4 (
                x  : numeric
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality is 4 x the first n-2 dimensions of the input.
   The average is at (0,"n-2"), variance (1,"n-2"), skewness (2,"n-2") and
   kurtosis (3,"n-2"). (See examples below.)

Description

   The dim_stat4 function computes the first four moments (average,
   variance, skewness, and kurtosis) of all elements of the n-1
   (rightmost) dimension for each index of the dimensions 0...n-2. Missing
   values are ignored.

   Use dim_stat4_n if you want to specify on which dimension(s) to
   calculate the four moments.

   This function was updated in V5.0.0 so that if a subarray of x contains
   all missing values, dim_stat4 will return missing values in the
   appropriate locations rather than quitting with a fatal error.

   The skewness (third moment) is a measure departure from symmetry. If
   skew>0 [skew<0], the distribution trails off to the right [left].

   The coefficient of kurtosis (fourth moment) measures normality. The
   normal distribution has a kurtosis of 3. This value is subtracted from
   the calculated kurtosis. Thus, negative values are possible and the
   returned value is kurtosis relative to the normal distribution. If
   kurtosis > 0 [<0], it is usually more sharply peaked [flatter] than the
   normal distribution (leptokurtic and platykurtic, respectively). E.g.,
   a rectangular function has a kurtosis of -1.2 (=1.8-3) relative to the
   normal distribution.

   The dim_num function can be used to determine the number of missing
   values. Eg:

     Nx = dim_num(ismissing(x))

See Also

   dim_stat4_n, stat4, num, avg, variance, dim_median, dim_stddev,
   dim_num, dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed,
   dim_standardize, dim_stddev, dim_sum, dim_variance

Examples

   Example 1: Let x be a 1-dimensional array. Then:
  xstat = dim_stat4(x)

   will yield a one-dimensional array of length 4. xstat(0) contains the
   mean; xstat(1) = variance; xstat(2) = skewness; xstat(3) = kurtosis.

   Example 2

   Let z be of size (ntim,nlat,mlon). Then, for each time and latitude,
   the the first four moments of each longitude (rightmost dimension) can
   be determined via:
    zLon = dim_stat4( z )    ; ==> zLon(4,ntim,nlat)

   Example 3: Let x be a 4-dimensional array with named dimensions (time,
   lev, lat, lon) and dimension sizes (ntim, klev, nlat, mlon). To
   determine the four moments in time use NCL's dimension reordering:

   Note: in V5.1.1, you will be able to use dim_stat4_n to avoid having to
   reorder your data.

  xstat = dim_stat4(x(lev|:, lat|:, lon|:, time|:))   ; ==> (4,klev,nlat,mlon)
  xstat = dim_stat4_n(x,0)                            ; no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

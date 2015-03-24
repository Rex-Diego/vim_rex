THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_stat4_n.shtml
THE_TITLE:dim_stat4_n
   NCL Home > Documentation > Functions > General applied math

dim_stat4_n

   Computes the first four moments (average, variance, skewness, and
   kurtosis) of the given dimension(s) for all other dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_stat4_n (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to calculate the first four moments.
   Must be consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be 4 x all-but-the-dims' dimensions of
   the input. The average is at (0,"dims"), variance (1,"dims"), skewness
   (2,"dims") and kurtosis (3,"dims"). (See examples below.)

Description

   The dim_stat4_n function computes the first four moments (average,
   variance, skewness, and kurtosis) of all elements of the dimensions
   indicated by dims for each index of the remaining dimensions Missing
   values are ignored.

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

   The dim_num_n function can be used to determine the number of missing
   values. Eg:

     Nx = dim_num_n(ismissing(x,0))

See Also

   stat4, num, avg, variance, dim_median, dim_stddev, dim_num,
   dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize,
   dim_stat4, dim_stddev, dim_sum, dim_variance

Examples

   Example 1: Let x be a 1-dimensional array. Then:
  xstat = dim_stat4_n(x,0)

   will yield a one-dimensional array of length 4. xstat(0) contains the
   mean; xstat(1) = variance; xstat(2) = skewness; xstat(3) = kurtosis.

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_stat4.

   Example 2

   Let z be of size (ntim,nlat,mlon). Then, for each time and latitude,
   the the first four moments of each longitude (rightmost dimension) can
   be determined via:
    zLon = dim_stat4_n( z, 2 )    ; ==> zLon(4,ntim,nlat)

   Example 3: Let x be a 4-dimensional array with named dimensions (time,
   lev, lat, lon) and dimension sizes (ntim, klev, nlat, mlon). To
   determine the four moments in time:
  xstat = dim_stat4_n(x,0)   ; ==> (4,klev,nlat,mlon)

   Example 4: Let x be as in example 3. To determine the four moments in
   time and level:
  xstat = dim_stat4_n(x,(/0,1/))   ; ==> (4,nlat,mlon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

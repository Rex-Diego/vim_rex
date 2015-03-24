THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_sum_n.shtml
THE_TITLE:dim_sum_n
   NCL Home > Documentation > Functions > General applied math

dim_sum_n

   Computes the arithmetic sum of a variable's given dimension(s) at all
   other dimensions.

Prototype

        function dim_sum_n (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to calculate the sum. Must be
   consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but dims's dimensions
   of the input variable. The dimension rank of the input variable will be
   reduced by the rank of dims.

Description

   The dim_sum_n function computes the sum of all elements of the
   dimensions indicated by dims' for each index of the remaining
   dimensions. Missing values are ignored.

   Use dim_sum_n_Wrap if retention of metadata is desired.

See Also

   dim_sum_n_Wrap , dim_sum_Wrap , sum, dim_sum, dim_median, dim_stddev,
   dim_num, dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed,
   dim_standardize, dim_stat4, dim_stddev, dim_variance

Examples

   Example 1

   Create a variable, q, of size (3,5,10) array. Then calculate the sum of
   the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    qav = dim_sum_n(q,2)   ;==>  qav(3,5)

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the zonal sum (ie, sum of all non-missing longitudes) is:
    xSumLon = dim_sum_n(x,2)    ; ==> xSumLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_sum_n_Wrap
   function
    xSumLon = dim_sum_n_Wrap(x,2)    ; ==> xSumLon(time,lat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the sum over
   time at each latitude/longitude grid point.
    xSumTime = dim_sum_n(x, 0)    ; ==> xSumTime(nlat,nlon)

   If metadata is desired use
    xSumTime = dim_sum_n_Wrap(x, 0)    ; ==> xSumTime(lat,lon)

   Example 4

   Let x be defined x(time,lev,lat,lon). Compute the sum over time and
   level at each latitude/longitude grid point.
    xSum = dim_sum_n(x, (/0,1/))    ; ==> xSum(nlat,nlon)

   To compute the sum over lat and lon at each time/lev grid point:
    xSum = dim_sum_n(x,(/2,3/))    ; ==> xSum(nlev,ntim)

   Example 5

   Let p(time,lat,lon) contain hourly (eg, 0Z, 1Z, ... 23Z) accumulated
   precipitation totals. Create a variable containing accumulated 6-hour
   (0Z, 6Z, 12Z, 18Z) totals. Note: The subscripting below assigns the
   0Z-to-5Z total to the 0 subscript (0Z time); the 6Z-to-11Z total to
   subscript 1 (6Z time); etc. If different assignments are desired the
   user should make the appropriate adjustments.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   dimp   = dimsizes( p )
   ntim   = dimp(0)                 ; number of times in array
   nlat   = dimp(1)
   mlon   = dimp(2)

   nhr    = 6                       ; 24 for daily total; 12 for twelve hour tot
al

   nhrdim = ntim/nhr                ; number of nhr-hour segments

   ptot   =  new ( (/nhrdim,nlat,mlon/), typeof(p), getFillValue(p) )
   ntStrt = 0
   ntLast = nhr-1

   do nt=0,ntim-1,nhr
        ptot(nt/nhr,:,:) = dim_sum_n( p(ntStrt:ntLast,:,:) , 0)

        ntStrt = ntStrt + nhr
        ntLast = ntLast + nhr
   end do
                                              ; optional meta data assignment
   copy_VarMeta(p(::nhr,:,:), ptot)          ; meta data;  ::nhr makes time assi
gnment
   ptot@long_name = nhr+"-hr accumulated ..."

   printVarSummary( ptot )
   printMinMax( ptot, True )


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

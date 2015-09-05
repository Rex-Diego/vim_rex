THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_rmsd_n.shtml
THE_TITLE:dim_rmsd_n
   NCL Home > Documentation > Functions > General applied math

dim_rmsd_n

   Computes the root-mean-square-difference between two variables' given
   dimensions at all other dimensions.

Prototype

        function dim_rmsd_n (
                x        : numeric,
                y        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   y

   A variable of numeric type and same dimensionality as x.
   dims

   The dimension(s) of x on which to to do the root-mean-square-difference
   on. Must be consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but dims's dimensions
   of the input variable. The dimension rank of the input variable will be
   reduced by the rank of dims.

Description

   The dim_rmsd_n function computes the root-mean-square-difference of all
   elements of the dimensions indicated by dims for each index of the
   remaining dimensions. Missing values are ignored.

   Use dim_rmsd_n_Wrap if retention of metadata is desired.

See Also

   dim_rmsd_n_Wrap , dim_avg, dim_median, dim_num, dim_product,
   dim_rmvmean, dim_rmvmed, dim_standardize, dim_stat4, dim_rmsd, dim_sum

Examples

   Example 1

   Create two variables q nd r of size (3,5,10) array. Then calculate the
   root-mean-square-difference of the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    r   = random_uniform(-50, 99,(/3,5,10/))
    rmsd= dim_rmsd_n(q,r,2)   ;==>  rmsd(3,5)

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_rmsd.

   Example 2

   Let x and y be of size (ntim,nlat,mlon) and with named dimensions
   "time", "lat" and "lon", respectively. Then, for each time and
   latitude, the root-mean-square-difference is:
    rmsdLon= dim_rmsd_n( x,y,2 )    ; ==> rmsdLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_rmsd_n_Wrap
   function.
    rmsdLon = dim_rmsd_n_Wrap( x,y,2 )    ; ==> rmsdLon(time,lat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the temporal
   root-mean-square-difference at each latitude/longitude grid point.
    rmsdTime = dim_rmsd_n(x, y, 0)    ; ==> rmsdTime(nlat,nlon)

   If metadata is desired use
    rmsdTime = dim_rmsd_n_Wrap(x, y, 0)    ; ==> rmsdTime(lat,lon)

   Example 4

   Let x be defined as x(time,lev,lat,lon). Compute the temporal
   root-mean-square-difference at each latitude/longitude grid point.
    rmsd = dim_rmsd_n(x,y,(/0,1/)) ; ==> rmsd(nlat,nlon)

   If metadata is desired use
    rmsd = dim_rmsd_n_Wrap(x,y,(/0,1/))  ; ==> rmsd(lat,lon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

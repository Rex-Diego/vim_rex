THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_rmsd.shtml
THE_TITLE:dim_rmsd
   NCL Home > Documentation > Functions > General applied math

dim_rmsd

   Computes the root-mean-square-difference between two variables'
   rightmost dimension at all other dimensions.

Prototype

        function dim_rmsd (
                x  : numeric,
                y  : numeric
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   y

   A variable of numeric type and same dimensionality as x.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality is the same as the first n-1 dimensions of
   the input variable. That is, the dimension rank of the input variable
   will be reduced by one.

Description

   The dim_rmsd function computes the root-mean-square-difference of all
   elements of the n-1 dimension for each index of the dimensions 0...n-2.
   Missing values are ignored.

   Use dim_rmsd_n if you want to specify which dimension(s) to do the
   calculation on.

   Use dim_rmsd_Wrap if retention of metadata is desired.

See Also

   dim_rmsd_Wrap , dim_avg, dim_median, dim_num, dim_product, dim_rmsd_n,
   dim_rmvmean, dim_rmvmed, dim_standardize, dim_stat4, dim_sum

Examples

   Example 1

   Create two variables q nd r of size (3,5,10) array. Then calculate the
   root-mean-square-difference of the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    r   = random_uniform(-50, 99,(/3,5,10/))
    rmsd= dim_rmsd(q,r)   ;==>  rmsd(3,5)

   Example 2

   Let x and y be of size (ntim,nlat,mlon) and with named dimensions
   "time", "lat" and "lon", respectively. Then, for each time and
   latitude, the root-mean-square-difference is:
    rmsdLon= dim_rmsd( x,y )    ; ==> rmsdLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_rmsd_Wrap
   function
    rmsdLon = dim_rmsd_Wrap( x,y )    ; ==> rmsdLon(time,lat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the temporal
   root-mean-square-difference at each latitude/longitude grid point. Use
   NCL's Named Subscripting to reorder the input array such that "time" is
   the rightmost dimension. Note: in V5.1.1, you will be able to use
   dim_rmsd_n to avoid having to reorder your data.

    rmsdTime = dim_rmsd( x(lat|:,lon|:,time|:), y(lat|:,lon|:,time|:) )    ; ==>
 rmsdTime(nlat,nlon)

    rmsdTime = dim_rmsd_n( x, y, 0 )                                       ; ==>
 no reordering needed

   If metadata is desired use
    rmsdTime = dim_rmsd_Wrap( x(lat|:,lon|:,time|:),y(lat|:,lon|:,time|:) )    ;
 ==> rmsdTime(lat,lon)

    rmsdTime = dim_rmsd_n_Wrap( x, y, 0 )                                      ;
 no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

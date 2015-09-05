THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_product.shtml
THE_TITLE:dim_product
   NCL Home > Documentation > Functions > General applied math

dim_product

   Computes the product of a variable's rightmost dimension at all other
   dimensions.

Prototype

        function dim_product (
                x  : numeric
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality is the same as the first n-2 dimensions of
   the input variable. That is, the dimension rank of the input variable
   will be reduced by one.

Description

   The dim_product function computes the product of all elements of the
   n-1th (rightmost) dimension for each index of the dimensions 0...n-2.
   Missing values are ignored.

   Use dim_product_n if you want to specify which dimension(s) to do the
   average across.

See Also

   product, dim_product_n, dim_median, dim_stddev, dim_num, dim_rmsd,
   dim_rmvmean, dim_rmvmed, dim_standardize, dim_stat4, dim_stddev,
   dim_variance, copy_VarMeta

Examples

   Example 1

   Create a variable, q, of size (3,5,10) array. Then calculate the
   product of the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    qav = dim_product(q)   ;==>  qav(3,5)

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the 'zonal product' (ie, product of all non-missing longitudes) is:
    xProLon = dim_product( x )    ; ==> xProLon(ntim,nlat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the product
   over time at each latitude/longitude grid point. Use NCL's Named
   Subscripting to reorder the input array such that "time" is the
   rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_product_n to avoid having
   to reorder your data.

    xProTime = dim_product( x(lat|:, lon|:, time|:) )    ; ==> xProTime(nlat,nlo
n)

    xProTime = dim_product_n( x, 0 )                     ; no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

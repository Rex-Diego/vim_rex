THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_product_n.shtml
THE_TITLE:dim_product_n
   NCL Home > Documentation > Functions > General applied math

dim_product_n

   Computes the product of a variable's given dimension(s) at all other
   dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_product_n (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to calculate the product. Must be
   consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but dims's dimensions
   of the input variable. The dimension rank of the input variable will be
   reduced by the rank of dims.

Description

   The dim_product_n function computes the product of all elements of the
   dimensions indicated by dims for each index of the remaining
   dimensions. Missing values are ignored.

See Also

   product, dim_product, dim_median, dim_stddev, dim_num, dim_rmsd,
   dim_rmvmean, dim_rmvmed, dim_standardize, dim_stat4, dim_stddev,
   dim_variance, copy_VarMeta

Examples

   Example 1

   Create a variable, q, of size (3,5,10) array. Then calculate the
   product of the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    qav = dim_product_n(q,2)   ;==>  qav(3,5)

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_product.

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the 'zonal product' (ie, product of all non-missing longitudes) is:
    xProLon = dim_product_n(x, 2)    ; ==> xProLon(ntim,nlat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the product
   over time at each latitude/longitude grid point.
    xProTime = dim_product_n( x, 0 )    ; ==> xProTime(nlat,nlon)

   Example 4

   Let x be x(time,lev,lat,lon). Compute the product over time and level
   at each latitude/longitude grid point.
    xProd = dim_product_n( x, (/0,1/) )    ; ==> xProd(nlat,nlon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

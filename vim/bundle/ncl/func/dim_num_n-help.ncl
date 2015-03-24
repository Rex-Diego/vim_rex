THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_num_n.shtml
THE_TITLE:dim_num_n
   NCL Home > Documentation > Functions > General applied math

dim_num_n

   Calculates the number of True values of a variable's given dimensions
   at all other dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_num_n (
                x        : logical,
                dims [*] : integer
        )

        return_val  :  integer

Arguments

   x

   An array of logical values of any dimensionality.
   dims

   The dimension(s) of x on which to count the number of True values. Must
   be consecutive and monotonically increasing.

Return value

   The output dimensionality will be the same as all but dims's dimensions
   of the input variable. The dimension rank of the input variable will be
   reduced by the rank of dims.

Description

   The dim_num_n function counts the number of True values in the
   dimensions indicated by dims for each index of the remaining
   dimensions. Missing values are ignored.

See Also

   num, dim_num, dim_avg, dim_median, dim_max, dim_min, dim_product,
   dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize, dim_stat4,
   dim_stddev, dim_sum, dim_variance, copy_VarMeta

Examples

   Example 1

   Let q be dimensioned (ntim,ny,mx). To count the number of non-missing
   values (q@_FillValue) over all of the rightmost dimension for each time
   and y value, use ismissing.
    nq = dim_num_n(.not.ismissing(q),2)  ; nq(ntim,ny)

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_num.

   Example 2

   Let z(time,lev,lat,lon). Count the number of non-missing values over
   all time for each level, lat and lon.
    nTime =  dim_num_n(.not.ismissing(z),0)  ; nTime(klev,nlat,mlon)

   Example 3

   Using the same z as Example 2, count the number of values between 5 and
   10 inclusive over all longitudes for each time, lev and lat.
    N = dim_num_n(z.ge.5.and.z.le.10,3)    ; N(ntim,klev,nlat)

   Example 4

   Using the same z as Example 2, count the number of values at all
   lat/lon values for each time and level value:
    N = dim_num_n(z,(/2,3/))    ; N(ntim,klev)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_num.shtml
THE_TITLE:dim_num
   NCL Home > Documentation > Functions > General applied math

dim_num

   Calculates the number of True values of a variable's rightmost
   dimension at all other dimensions.

Prototype

        function dim_num (
                x  : logical
        )

        return_val  :  integer

Arguments

   x

   An array of logical values of any dimensionality

Return value

   The output dimensionality is the same as the first n-2 dimensions of
   the input variable. That is, the dimension rank of the input variable
   will be reduced by one.

Description

   The dim_num function counts the number of True values in the n-1th
   (rightmost) dimension for each index of the dimensions 0...n-2. Missing
   values are ignored.

   Use dim_num_n if you want to specify which dimension(s) to do the count
   across.

See Also

   num, dim_num_n, dim_avg, dim_median, dim_max, dim_min, dim_num,
   dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize,
   dim_stat4, dim_stddev, dim_sum, dim_variance, copy_VarMeta

Examples

   Example 1

   Let q be dimensioned (ntim,ny,mx). To count the number of non-missing
   values (q@_FillValue) over all of the rightmost dimension for each time
   and y value, use ismissing.
    nq = dim_num(.not.ismissing(q))  ; nq(ntim,ny)

   Example 2

   Let z(time,lev,lat,lon) where each dimension is named. Use dimension
   reordering to reorder "z" so that time is the last dimension. Count the
   number of non-missing values over all time for each level, lat and lon.

   Note: in V5.1.1, you will be able to use dim_num_n to avoid having to
   reorder your data.

    znew  = z(lev|:,lat|:,lon|:,time|:)   ; done for clarity only
    nTime =  dim_num(.not.ismissing(znew))  ; nTime(klev,nlat,mlon)

    delete(znew)                          ; if no longer needed

   In V5.1.1, you will be able to use dim_num_n to avoid having to reorder
   your data:
    nTime =  dim_num_n(.not.ismissing(z),0)  ; nTime(klev,nlat,mlon)


   Example 3

   Using the same z as Example 2, count the number of values between 5 and
   10 inclusive over all longitudes for each time, lev and lat.
    N = dim_num(z.ge.5.and.z.le.10)    ; N(ntim,klev,nlat)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

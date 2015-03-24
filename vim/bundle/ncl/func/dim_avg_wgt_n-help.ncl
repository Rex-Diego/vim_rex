THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_avg_wgt_n.shtml
THE_TITLE:dim_avg_wgt_n
   NCL Home > Documentation > Functions > General applied math

dim_avg_wgt_n

   Computes the weighted average of a variable's given dimension at all
   other dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_avg_wgt_n (
                x       : numeric,
                w   [*] : numeric,
                opt [1] : integer,
                dim [1] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality. Missing values are
   indicated by the _FillValue attribute.
   w

   A one dimensional array of weights. The length must the same as the
   dim-th dimension of x
   opt

   A scalar: (a) opt=0 means compute the weighted average only if all
   values are not missing; (b) opt=1 means compute the weighted mean of
   all non-missing values; (c) opt>1 means to return the mean only if the
   number of non-missing values is greater-then or equal to opt.
   dim

   A scalar, the dimension of x of which to do the weighted average
   across.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but the dim-th
   dimension of the input variable. The dimension rank of the input
   variable will be reduced by one.

Description

   The dim_avg_wgt_n function computes the weighted average of all
   elements of the dim-th dimension for each index of the remaining
   dimensions.

   Basically, the following is done:

    xAvg = SUM [x*w]/SUM[w]

   The weighting is strictly positional. EG: If x@_FillValue=1e20, and the
   dim-th dimension is of size 5 and the values are (/3.7, 1e20, 14.3,
   1e20, 7.1 /) with weights (/1,3,5,3,1/) then the result will be
      (3.7*1 + 14.3*5 + 7.1*1)/(1+5+1) = 11.757

   Use dim_avg_wgt_n_Wrap if retention of metadata is desired.

See Also

   dim_avg_wgt_n_Wrap , dim_avg_wgt_Wrap , dim_avg_n, dim_avg_wgt, avg,
   dim_median_n, dim_stddev_n, dim_num_n, dim_product_n, dim_rmsd_n,
   dim_rmvmean_n, dim_rmvmed_n, dim_standardize_n, dim_stat4_n,
   dim_stddev_n, dim_sum_n, dim_variance_n

Examples

   Example 1

   Let z(12,nlat,mlon) contain monthly means and with named dimensions
   "time", "lat" and "lon", respectively. Compute the weighted annual mean
   at each lat/lon point.
    wgt = (/0.08493151, 0.076712325, 0.08493151, 0.08219178 \  ; same size as di
mension "time"
           ,0.08493151, 0.08219178 , 0.08493151, 0.08493151 \
           ,0.08219178, 0.08493151 , 0.08219178, 0.08493151 /)

    zAnn = dim_avg_wgt_n( z, wgt, 0, 0 )    ; ==> zAnn(nlat,mlon)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_avg_wgt_n_Wrap
   function.

   Example 2

   Let T(time,lev,lat,lon). Compute the weighted vertical average total at
   each time/lat/lon point.
    delp = (/50,50,100,100,100,50,25,10/)  ; same size as dimension "lev"

    Tavg = dim_avg_wgt_n( T, wgt, 0, 1 )   ; ==> Tavg(time,lat,lon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_sum_wgt.shtml
THE_TITLE:dim_sum_wgt
   NCL Home > Documentation > Functions > General applied math

dim_sum_wgt

   Computes the weighted sum of a variable's rightmost dimension at all
   other dimensions.

Prototype

        function dim_sum_wgt (
                x       : numeric,
                w   [*] : numeric,
                opt [1] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality. Missing values are
   indicated by the _FillValue attribute.
   w

   A one dimensional of weights. The length must the same as the right
   dimension of x
   opt

   A scalar: (a) opt=0 means compute the weighted sum only if all values
   are not missing; (b) opt=1 means compute the weighted sum of all
   non-missing values; (c) opt>1 means to return the sum only if the
   number of non-missing values is greater-then or equal to opt.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality is the same as the first n-2 dimensions of
   the input variable. That is, the dimension rank of the input variable
   will be reduced by one.

Description

   The dim_sum_wgt function computes the weighted sum of all elements of
   the n-1th (rightmost) dimension for each index of the dimensions
   0...n-2.

   Basically, the following is done for the rightmost dimension.

    xAvg = SUM [x*w]/SUM[w]

   The weighting is strictly positional. EG: If x@_FillValue=1e20, and the
   rightmost dimension is of size 5 and the values are (/3.7, 1e20, 14.3,
   1e20, 7.1 /) with weights (/1,3,5,3,1/) then the result will be
      (3.7*1 + 14.3*5 + 7.1*1) = 82.3

   Use dim_sum_wgt_n if you want to specify which dimension to do the
   weighted sum across.

   Use dim_sum_wgt_Wrap if retention of metadata is desired.

See Also

   dim_sum_wgt_Wrap , dim_avg_wgt_Wrap , dim_sum, avg, dim_avg,
   dim_median, dim_stddev, dim_num, dim_product, dim_rmsd, dim_rmvmean,
   dim_rmvmed, dim_standardize, dim_stat4, dim_stddev, dim_variance

Examples

   Example 1

   Let z(12,nlat,mlon) contain monthly means and with named dimensions
   "time", "lat" and "lon", respectively. Compute the weighted annual sum
   (total) at each lat/lon point. Use dimension reordering to make time
   the rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_sum_wgt_n to avoid having
   to reorder your data.

    wgt = (/0.08493151, 0.076712325, 0.08493151, 0.08219178 \   ; same size as d
imension "time"
           ,0.08493151, 0.08219178 , 0.08493151, 0.08493151 \
           ,0.08219178, 0.08493151 , 0.08219178, 0.08493151 /)

    pTot = dim_sum_wgt(precip(lat|:,lon|:,time|:), wgt, 0 )    ; ==> pTot(nlat,m
lon)
    pTot = dim_sum_wgt_n(precip, wgt, 0, 0)                    ; no reordering n
eeded

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_sum_wgt_Wrap
   function.

   Example 2

   Let T(time,lev,lat,lon). Compute the weighted vertical sum total at
   each time/lat/lon point. Use dimension reordering to make time the
   rightmost dimension.
    delp = (/50,50,100,100,100,50,25,10/) ; same size as dimension "lev"

    Tsum = dim_sum_wgt( T(time|:,lat|:,lon|:,lev|:), wgt, 0 )   ; ==> Tsum(time,
lat,lon)
    Tsum = dim_sum_wgt_n( T, wgt, 0, 0 )                        ; no reordering
needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

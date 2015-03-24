THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_avg_wgt_Wrap.shtml
THE_TITLE:dim_avg_wgt_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_avg_wgt_Wrap

   Computes the weighted average of a variable's rightmost dimension at
   all other dimensions and retains metadata.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_avg_wgt_Wrap (
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

   A scalar: (a) opt=0 means compute the weighted average only if all
   values are not missing; (b) opt=1 means compute the weighted mean of
   all non-missing values; (c) opt>1 means to return the mean only if the
   number of non-missing values is greater-then or equal to opt.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality is the same as the first n-2 dimensions of
   the input variable. That is, the dimension rank of the input variable
   will be reduced by one.

Description

   Computes the weighted average of all elements of the n-1th (rightmost)
   dimension for each index of the dimensions 0...n-2 and retains
   metadata. A wrapper function.

   Use dim_avg_wgt_n_Wrap if you want to specify which dimension to do the
   average across.

See Also

   dim_avg_wgt, dim_avg_wgt_n_Wrap, avg, dim_median, dim_stddev, dim_num,
   dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize,
   dim_stat4, dim_stddev, dim_sum, dim_variance

Examples

   Example 1

   Let z(12,nlat,mlon) contain monthly means and with named dimensions
   "time", "lat" and "lon", respectively. Compute the weighted annual mean
   at each lat/lon point. Use dimension reordering to make time the
   rightmost dimension.
    wgt = (/0.08493151, 0.076712325, 0.08493151, 0.08219178 \ ; same size as dim
ension "lev"
           ,0.08493151, 0.08219178 , 0.08493151, 0.08493151 \
           ,0.08219178, 0.08493151 , 0.08219178, 0.08493151 /)


    zAnn = dim_avg_wgt_Wrap( z(lat|:,lon|:,time|:), wgt, 0 )    ; ==> zAnn(lat,l
on)

    zAnn = dim_avg_wgt_n_Wrap( z, wgt, 0, 0 )    ; no reordering needed

   All attributes and, if present, latitude and longitude coordinate
   variables are retained.

   Note: in V5.1.1, you will be able to use dim_avg_wgt_n_Wrap to avoid
   having to reorder your data.

   Example 2

   Let T(time,lev,lat,lon). Compute the weighted vertical average total at
   each time/lat/lon point. Use dimension reordering to make time the
   rightmost dimension.
    delp = (/50,50,100,100,100,50,25,10/)  ; same size as dimension "time"

    Tavg = dim_avg_wgt_Wrap( T(time|:,lat|:,lon|:,lev|:), wgt, 0 )    ; ==> Tavg
(time,lat,lon)

    Tavg = dim_avg_wgt_n_Wrap( T, wgt, 0, 1 )                         ; no reord
ering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

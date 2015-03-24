THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_min_n_Wrap.shtml
THE_TITLE:dim_min_n_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_min_n_Wrap

   Computes the minimum of a variable's given dimensions at all other
   dimensions and retains metadata.

   [new.gif] Available in version 6.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_min_n_Wrap (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  typeof(x))

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to determine the minimum values. Must be
   consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but the dims's
   dimensions of the input variable. The dimension rank of the input
   variable will be reduced by the rank of dims.

Description

   The dim_min_n_Wrap function finds the minimum of all elements of the
   dimensions indicated by dims for each index of the remaining dimensions
   and retains metadata. This function is a wrapper function.

   Missing values are ignored.

See Also

   dim_max_n_Wrap, dim_min, dim_max, dim_min_n, dim_max_n

Examples

   Example 1

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the minimum and maximum is:
    xmin = dim_min_n( x, 2 )    ; ==> xmin(ntim,nlat)
    xmax = dim_max_n( x, 2 )    ; ==> xmax(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_min_n_Wrap and
   dim_max_n_Wrap functions:

    xmin = dim_min_n_Wrap( x,2 )    ; ==> xmin(time,lat)
    xmax = dim_max_n_Wrap( x,2 )    ; ==> xmax(time,lat)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/linrood_latwgt.shtml
THE_TITLE:linrood_latwgt
   NCL Home > Documentation > Functions > General applied math

linrood_latwgt

   Computes the latitudes and weights used by the Lin-Rood Model.

Prototype

        function linrood_latwgt (
                nlat [1] : byte, short, integer or long
        )

        return_val [nlat] :  double

Arguments

   nlat

   Total number of latitude points. This may be odd or even.

   As of version 6.0.0, this can be of type byte, short, integer or long.

Description

   This function returns a two dimensional array where the 0th element of
   the 0th dimension contains the computed latitudes, and the 1st element
   of the 0th dimension contains the Lin-Rood weights. The returned values
   are of type double. The weights will sum to 2.0.

See Also

   linrood_wgt

Examples

   Example 1

   Generate Lin-Rood latitudes and weights (type double) for a user
   specified number of latitudes:

  nlat = 8

  latwt    = linrood_latwgt(nlat)
  lat      = latwt(:,0)  ; Lin-Rood latitudes [ascending order]
  wgt      = latwt(:,1)  ; Lin-Rood weights

   Output:

           lat         wgt      sum[wgt]
         -------      ------     -------
    1  -90.00000     0.02507     0.02507
    2  -64.28571     0.19310     0.21817
    3  -38.57143     0.34795     0.56612
    4  -12.85714     0.43388     1.00000
    5   12.85714     0.43388     1.43388
    6   38.57143     0.34795     1.78183
    7   64.28571     0.19310     1.97493
    8   90.00000     0.02507     2.00000

   Example 2

   Use the doubletofloat function to generate Lin-Rood latitudes and
   weights (type float) for a user specified number of latitudes:

  nlat     = 24     ; for globe
  latwt    = doubletofloat( linrood_latwgt(nlat) )
  lat      = latwt(:,0)  ; lat is of type float
  wgt      = latwt(:,1)  ; wgt is of type float


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/linrood_wgt.shtml
THE_TITLE:linrood_wgt
   NCL Home > Documentation > Functions > General applied math

linrood_wgt

   Computes the weights used by the Lin-Rood Model.

Prototype

        function linrood_wgt (
                nlat [1] : byte, short, integer or long
        )

        return_val [nlat] :  double

Arguments

   nlat

   Total number of latitude points. This may be odd or even.

   As of version 6.0.0, this can be of type byte, short, integer or long.

Description

   This function returns a one dimensional array of Lin-Rood weights. The
   returned values are of type double. The sum of the weights will be 2.0.

See Also

   linrood_latwgt

Examples

   Example 1

   Generate Lin-Rood weights (type double) for a user specified number of
   latitudes:

  nlat = 8

  wgt  = linrood_wgt(nlat)

   Output:

          wgt      sum[wgt]
         ------     -------
    1   0.02507     0.02507
    2   0.19310     0.21817
    3   0.34795     0.56612
    4   0.43388     1.00000
    5   0.43388     1.43388
    6   0.34795     1.78183
    7   0.19310     1.97493
    8   0.02507     2.00000

   The doubletofloat function can be used to convert the output from
   double to float, if desired:

  nlat = 8

  wgt  = doubletofloat(linrood_wgt(nlat))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gaus_lobat_wgt.shtml
THE_TITLE:gaus_lobat_wgt
   NCL Home > Documentation > Functions > Lat/Lon functions

gaus_lobat_wgt

   Computes Gauss-Lobatto weights given a one-dimensional array of
   Gauss-Lobatto latitudes.

Prototype

        function gaus_lobat_wgt (
                lat [*] : numeric
        )

        return_val [lat] :  double

Arguments

   lat

   A one-dimensional array of Gauss-Lobatto latitudes. The number of
   elements may be odd or even.

Return value

   A one-dimensional array of Gauss-Lobatto weights. The size is the same
   as lat. By default the returned values are of type double.

Description

   Computes Gauss-Lobatto weights given a one-dimensional array of
   Gauss-Lobatto latitudes. The sum of the weights will be 2.0.

See Also

   There are numerous other latitude/longitude functions.

Examples

   Example 1

   Generates Gauss-Lobatto weights for a specified series of latitudes.
  lat = (/ -90.,-78.45661,-53.25302,-18.83693, \
           18.83693, 53.25302, 78.45661,  90. /)
  gw  = gaus_lobat_wgt(lat)

   Output:
           gw        sum[gw]
         -------     -------
    0    0.03571     0.03571
    1    0.21070     0.24642
    2    0.34112     0.58754
    3    0.41246     1.00000
    4    0.41246     1.41246
    5    0.34112     1.75358
    6    0.21070     1.96429
    7    0.03571     2.00000


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

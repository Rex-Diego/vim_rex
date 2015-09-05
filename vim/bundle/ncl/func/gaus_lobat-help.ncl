THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gaus_lobat.shtml
THE_TITLE:gaus_lobat
   NCL Home > Documentation > Functions > Lat/Lon functions

gaus_lobat

   Computes gaussian latitudes and weights using Gauss-Lobatto quadrature.

Prototype

        function gaus_lobat (
                nlat [1] : byte, short, integer or long
        )

        return_val [nlat,2] :  double

Arguments

   nlat

   A scalar integer equal to the total number of latitude points. This may
   be odd or even.

   As of version 6.0.0, this can be of type byte, short, integer or long.

Return value

   A two dimensional array containing both the Gauss-Lobatto latitudes
   (first dimension) and the Gauss-Lobatto weights (second dimension). By
   default the returned values are of type double.

Description

   Computes gaussian latitudes and weights using Gauss-Lobatto quadrature.
   The max and min gaussian latitudes will include the poles. The weights
   will sum to 2.0.

See Also

   There are numerous other latitude/longitude functions.

Examples

   Example 1

   Generates Gauss-Lobatto latitudes and weights (type double) for a
   specified number of latitudes:
  nlat = 8

  gau_info = gaus_lobat(nlat)
  glat     = gau_info(:,0)  ; Gauss-Lobatto latitudes [ascending order]
  gwgt     = gau_info(:,1)  ; Gauss-Lobatto weights

   Output:
          glat        gwgt      sum[gwgt]
         -------      ------     -------
    0  -90.00000     0.03571     0.03571
    1  -78.45661     0.21070     0.24642
    2  -53.25302     0.34112     0.58754
    3  -18.83693     0.41246     1.00000
    4   18.83693     0.41246     1.41246
    5   53.25302     0.34112     1.75358
    6   78.45661     0.21070     1.96429
    7   90.00000     0.03571     2.00000

   Example 2

   Use doubletofloat to generate Gauss-Lobatto latitudes and weights (type
   float) for a specified number of latitudes:
  nlat     = 24     ; for globe
; conversion is embedded
  gau_info = doubletofloat(gaus_lobat(nlat))
  glat     = gau_info(:,0)                ; glat ==> float
  gwgt     = gau_info(:,1)                ; gwgt ==> float


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

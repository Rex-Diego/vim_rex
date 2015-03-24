THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/NormCosWgtGlobe.shtml
THE_TITLE:NormCosWgtGlobe
   NCL Home > Documentation > Functions > Lat/Lon functions

NormCosWgtGlobe

   Create normalized cosine weights that sum to 2.0.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function NormCosWgtGlobe (
                lat [*] : numeric
        )

        return_val [*] :  float

Arguments

   lat

   Latitudes of global grid [degrees].

Return value

   A one-dimensional array of same size and type as lat.

Description

   Generates cosine based weights that sum to 2.0. This is analogous to
   latGauWgt and latRegWgt .

See Also

   latGauWgt, latRegWgt, latGau, latGlobeF, latGlobeFo, lonGlobeF,
   lonGlobeFo, gaus

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Consider a variable, lat which is of type "double" that spans 87.5S to
   87.5N [5 deg spacing].
  wgt  = NormCosWgtGlobe(lat)

  printVarSummary(wgt)
  print(lat+"    "+wgt)
  print("sum(wgt)="+sum(wgt))

   The output looks like:
Variable: wgt
Type: double
Total Size: 288 bytes
            36 values
Number of Dimensions: 1
Dimensions and sizes:   [lat | 36]
Coordinates:
            lat: [-87.5..87.5]
Number Of Attributes: 1
  long_name :   latitude weight

=======
         lat      wgt
(0)     -87.5   0.0038053
(1)     -82.5   0.0113869
(2)     -77.5   0.0188819
[snip]
(16)     -7.5   0.0864924
(17)     -2.5   0.0871557
(18)      2.5   0.0871557
(19)      7.5   0.0864924
[snip]
(33)     77.5   0.0188819
(34)     82.5   0.0113869
(35)     87.5   0.0038053
=======
(0)     sum(wgt)=2

   Example 2

   Consider a variable, lat which is of type float that spans 90S to 90N
   [5 deg spacing].
  wgt  = NormCosWgtGlobe(lat)

  printVarSummary(wgt)
  print(lat+"    "+wgt)
  print("sum(wgt)="+sum(wgt))

   The edited output looks like:
Variable: wgt
Type: float
Number of Dimensions: 1
Dimensions and sizes:   [lat | 37]
Coordinates:
            lat: [-90.0..90.0]
Number Of Attributes: 1
  long_name :   latitude weight

=======
         lat      wgt
(0)     -90   0.0
(1)     -85   0.0076106
(2)     -80   0.0151633
[snip]
(16)    -10   0.0859952
(17)     -5   0.0869896
(18)      0   0.0873219
(19)      5   0.0869896
(20)     10   0.0859952
[snip]
(34)     80   0.0151633
(35)     85   0.00761061
(36)     90   0.0
=======
(0)     sum(wgt)=2


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

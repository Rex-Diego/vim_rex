THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/latRegWgt.shtml
THE_TITLE:latRegWgt
   NCL Home > Documentation > Functions > Lat/Lon functions

latRegWgt

   Generates [sin(lat+dlat/2)-sin(lat-dlat/2) weights for equally spaced
   (regular) global grids that will sum to 2.0.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function latRegWgt (
                lat   [*] : numeric,
                nType [1] : string,
                opt   [1] : integer
        )

        return_val [*] :  float

Arguments

   lat

   Latitudes of global grid [degrees].
   nType

   Type of variable to be returned [float or double].
   opt

   Not used. Set to 0.

Return value

   A one-dimensional array of same size as lat.

Description

   Generates [sin(lat+dlat/2)-sin(lat-dlat/2)] for global grids. The
   weights will sum to 2.

See Also

   latGauWgt, NormCosWgtGlobe, latGau, latGlobeF, latGlobeFo, lonGlobeF,
   lonGlobeFo, gaus

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Consider a variable lat that spans 87.5S to 87.5N [5 deg spacing].
  wgt  = latRegWgt(lat, "double", 0)

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

   Consider a variable lat that spans 90S to 90N [5 deg spacing].
  wgt  = latRegWgt(lat, "float", 0)

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
(0)     -90   0.000951778
(1)     -85   0.00760336
(2)     -80   0.0151489
[snip]
(16)    -10   0.0859134
(17)     -5   0.0869068
(18)      0   0.0872388
(19)      5   0.0869068
(20)     10   0.0859134
[snip]
(34)     80   0.0151489
(35)     85   0.00760336
(36)     90   0.000951778
=======
(0)     sum(wgt)=2


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

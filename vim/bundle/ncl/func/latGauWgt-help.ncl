THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/latGauWgt.shtml
THE_TITLE:latGauWgt
   NCL Home > Documentation > Functions > Lat/Lon functions

latGauWgt

   Generates gaussian weights and associated metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function latGauWgt (
                nlat     [1] : integer or long,
                name     [1] : string,
                longname [1] : string,
                units    [1] : string
        )

        return_val [*] :  float

Arguments

   nlat

   A scalar equal to the number of latitudes desired.

   As of version 6.0.0, this can be of type integer or long.
   name

   A string that will become the named dimension of the output (e.g.
   "lat").
   longname

   A string that will become the long_name of the output variable (e.g.
   "gaussian weights").
   units

   A string that will become the units of the output. Gaussian weights are
   dimemsionless. Setting units to "" (no space between the "") will
   result in no units attribute. The user may prefer to explicitly have a
   units attribute. If so, setting units to (say) "dimensionless" will
   result in an explicit units attribute.

Return value

   A one-dimensional array of size nlat. Type float by default. If double
   precision is desired, set nlat@double = True prior to invoking the
   function.

Description

   Generates gaussian weights and associated metadata.

See Also

   latRegWgt, NormCosWgtGlobe, latGau, latGlobeF, latGlobeFo, lonGlobeF,
   lonGlobeFo, gaus

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Create a one dimensional array of gaussian weights.
      nlat = 64
      gwt  = latGauWgt(nlat, "lat", "gaussian weights", "")
      print(gwt)

   The above returns a 1D array of length nlat values.
Variable: gwt
Type: float               [ double if nlat@double = True ]
Total Size: 256 bytes
            64 values
Number of Dimensions: 1
Dimensions and sizes:   [lat | 64]
Number Of Attributes: 2
  long_name :   gaussian weights

(0)     0.001783281
(1)     0.004147033
(2)     0.006504458
(3)     0.00884676
(4)     0.01116814
[snip]
(28)    0.04799939
(29)    0.04834476
(30)    0.04857547
(31)    0.04869096
(32)    0.04869096
(33)    0.04857547
(34)    0.04834476
(35)    0.04799939
[snip]
(59)    0.01116814
(60)    0.00884676
(61)    0.006504458
(62)    0.004147033
(63)    0.001783281



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/clmMonLLT.shtml
THE_TITLE:clmMonLLT
   NCL Home > Documentation > Functions > Climatology

clmMonLLT

   Calculates long term monthly means (monthly climatology) from monthly
   data (lat,lon,time version)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function clmMonLLT (
                x [*][*][*] : numeric
        )

        return_val [*][*][12] :  numeric

Arguments

   x

   A three-dimensional array of any numeric type. Dimensions must be lat,
   lon, time. The time dimension must be a multiple of 12. The dimensions
   must be named.

Return value

   An array of the same size and type as x except that the rightmost
   dimension with be of size 12.

Description

   Calculate long term monthly means (monthly climatology) from monthly
   data.

See Also

   clmMonLLLT, clmMonTLL, clmMonTLLL, calcMonAnomLLLT, calcMonAnomLLT,
   calcMonAnomTLL, calcMonAnomTLLL

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Calculate the monthly climatology of u(lev,lat,lon,time) where
[lat | 128] x [lon | 256] x [time | 528]

   This represent 44 years [44*12=528] of monthly data. Consider the
   following code snippet:
      f    = addfile("x.1958-2001.nc, "r")
      t    = f->T2m
      tClm = clmMonLLT( t )
      printVarSummary(tClm)

   The result is:
variable: tClm
Type: float
Total Size: 36175872 bytes
            9043968 values
Number of Dimensions: 3
Dimensions and sizes:  [lat | 128] x [lon | 256] x [month | 12]
Coordinates:
            lat: [-88.92773..88.92773]
            lon: [ 0..358.53]
            month: [0..11]
Number Of Attributes: 7
  time_op_ncl : Climatology: 44 years
  cell_method : time: mean
  standard_name :       eastward_wind
  units :       m/s
  long_name :   U velocity
  _FillValue :  -999


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

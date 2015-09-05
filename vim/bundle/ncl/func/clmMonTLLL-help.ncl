THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/clmMonTLLL.shtml
THE_TITLE:clmMonTLLL
   NCL Home > Documentation > Functions > Climatology

clmMonTLLL

   Calculates long term monthly means (monthly climatology) from monthly
   data: (time,lev,lat,lon) version

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function clmMonTLLL (
                x [*][*][*][*] : float or double
        )

        return_val [12][*][*][*] :  numeric

Arguments

   x

   A four-dimensional array of type float or double. Dimensions must be
   time, lev, lat, lon. The size of time dimension must be a multiple of
   12. The dimensions must be named.

Return value

   An array of the same size and type as x except that the leftmost
   dimension with be of size 12.

Description

   Calculate long term monthly means (monthly climatology) from monthly
   data.

See Also

   clmMonLLT, clmMonTLL, clmMonLLLT, calcMonAnomLLLT, calcMonAnomLLT,
   calcMonAnomTLL, calcMonAnomTLLL

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Calculate the monthly climatology of u(time,lev,lat,lon) where
[time | 528] x [lev | 23] x [lat | 128] x [lon | 256]

   This represent 44 years [44*12=528] of monthly data. Consider the
   following code snippet:
      f    = addfile("x.1958-2001.nc, "r")
      u    = f->U
      uClm = clmMonTLL( u )
      printVarSummary(uClm)

   The result is:
variable: uClm
Type: float
Total Size: 36175872 bytes
            9043968 values
Number of Dimensions: 4
Dimensions and sizes:   [month | 12] x [lev | 23] x [lat | 128] x [lon | 256]
Coordinates:
            month: [0..11]
            lev: [1..1000]
            lat: [-88.92773..88.92773]
            lon: [ 0..358.53]
Number Of Attributes: 7
  time_op_ncl : Climatology: 44 years
  cell_method : time: mean
  standard_name :       eastward_wind
  units :       m/s
  long_name :   U velocity
  _FillValue :  -999


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

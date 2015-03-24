THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/wave_number_spc.shtml
THE_TITLE:wave_number_spc
   NCL Home > Documentation > Functions > General applied math

wave_number_spc

   Computes the total power spectrum as a function of latitudinal wave
   number.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function wave_number_spc (
                x          : numeric,
                grid_type  : string
        )

Arguments

   x

   A 'global' array with at least two dimensions and up to four
   dimensions. The rightmost two dimensions must be lat x lon.
   grid_type

   A string. "g" or "G" stands for gaussian grid and "f" or "F" stands for
   a regular (fixed) grid.

Return value

   The results are returned in an array of the same type x. The rightmost
   two (spatial) dimensions ([time,lev,]lat,lon) will be replaced by a
   dimension of the same size as the number of latitudes. [See Examples]

Description

   The function performs a spherical harmonic analysis on the array x. It
   uses the returned coefficients to compute the power. It returns the
   power spectrum as a function of latitudinal wave number.

   Note: The returned variable is not space-time spectra.

Examples

   power = wave_number_spc (T, "G") ; T is gaussian grid
   power = wave_number_spc (X, "F") ; X is fixed grid

   Example 1

   Consider U(lat,lon): the grid is gaussian with dimension sizes
   (64,128), then
       uWave = wave_number_spc ( U, "G")
       print(uWave)

yields

Variable: uWave
Type: float
Total Size: 256 bytes
            64 values
Number of Dimensions: 1
Dimensions and sizes:   [wave_number | 64]
Coordinates:
            wave_number: [ 1..64]
Number Of Attributes: 6
  time :        7
  _FillValue :  -999
  long_name :   Power
  short_name :  U
  units :       (m/s)^2
  lon : -180
(0)     472.4236
(1)     220.2668
(2)     64.95421
(3)     185.1783
(4)     178.0586
(5)     11.71589
(6)     2.819393
[SNIP]
(60)    0.0001299343
(61)    7.760734e-05
(62)    0.0001256109
(63)    5.20107e-05

   Example 2

   Consider DIV(time,lev,lat,lon): the grid is gaussian with dimension
   sizes (108,4,64,128), then
       divWave = wave_number_spc ( DIV, "G")

yields

Variable: divWave
Type: float
Total Size: 110592 bytes
            27648 values
Number of Dimensions: 3
Dimensions and sizes:   [time | 108] x [lev | 4] x [wave_number | 64]
Coordinates:
            time: [0..107]
            lev: [300..150]
            wave_number: [ 1..64]
Number Of Attributes: 5
  _FillValue :  -999
  long_name :   Power
  short_name :  DIV
  units :       (1/s)^2

(0,0,0) 4.532027e-30
(0,0,1) 1.009428e-14
(0,0,2) 1.469836e-14
[SNIP]
(0,0,62)        3.129701e-29
(0,0,63)        4.321575e-29

(0,1,0) 8.445624e-31
(0,1,1) 5.238072e-14
(0,1,2) 5.273766e-14
[SNIP]


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

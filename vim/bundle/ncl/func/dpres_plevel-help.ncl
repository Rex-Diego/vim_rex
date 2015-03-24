THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dpres_plevel.shtml
THE_TITLE:dpres_plevel
   NCL Home > Documentation > Functions > CESM

dpres_plevel

   Calculates the pressure layer thicknesses of a constant pressure level
   coordinate system.

Prototype

        function dpres_plevel (
                plev [*] : numeric,
                psfc     : numeric,
                ptop [1] : numeric,
                iopt     : integer
        )

        return_val  :  numeric

Arguments

   plev

   A one dimensional array containing the constant pressure levels. May be
   in ascending or descending order. Must have the same units as psfc.
   psfc

   A scalar or an array of up to three dimensions containing the surface
   pressure data in Pa or hPa (mb). The rightmost dimensions must be
   latitude and longitude. Must have the same units as plev.
   ptop

   A scalar specifying the top of the column. Must have the same units as
   plev.
   iopt

   Set to zero. Currently not used.

Return value

   If psfc is a scalar the return variable will be a one-dimensional array
   the same size as plev; if psfc is two-dimensional [e.g. (lat,lon)] or
   three-dimensional [e.g. (time,lat,lon)] then the return array will have
   an additional level dimension: (lev,lat,lon) or (time,lev,lat,lon). The
   size of the lev dimension is the same as the size of plev. The returned
   type will be double if psfc is double, float otherwise.

Description

   Calculates the layer pressure thickness of a constant pressure level
   system. It is analogous to dpres_hybrid_ccm for hybrid coordinates. At
   each grid point the sum of the pressure thicknesses equates to
   [psfc-ptop]. At each grid point, the returned values above ptop and
   below psfc will be set to psfc@_FillValue. If there is no
   psfc@_FillValue then the _FillValue will be set to the default for
   float or double (in V5.2.x and earlier, 1e20 is used). If ptop or psfc
   is between plev levels then the layer thickness is modifed accordingly.
   If psfc is set to _FillValue, all layer thicknesses are set to the
   appropriate _FillValue.

   The primary purpose of this function is to return layer thicknesses to
   be used to weight observations for integrations.

See Also

   dpres_plevel_Wrap, dpres_hybrid_ccm, dz_height

Examples

   Example 1 Consider a rawindsonde sounding and it is desired to compute
   the "internal energy" which is an integrated quantity.
                             ; PRESSURE (hPa)
  plev = (/ 1000.,950.,900.,850.,800.,750.,700.,650.,600., \
             550.,500.,450.,400.,350.,300.,250.,200., \
             175.,150.,125.,100., 80., 70., 60., 50., \
              40., 30., 25., 20. /)

                             ; TEMPERATURE (C)
  t    =(/29.3,28.1,23.5,20.9,18.4,15.9,13.1,10.1, 6.7, 3.1,   \
          -0.5,-4.5,-9.0,-14.8,-21.5,-29.7,-40.0,-52.4,   \
         -59.2,-66.5,-74.1,-78.5,-76.0,-71.6,-66.7,-61.3, \
         -56.3,-51.7,-50.7,-47.5 /)

  plev       = plev*100.
  plev@units = "Pa"        ; Pa   =  kg/(m s2) (Pascal)

  t          = t+273.15
  t@units    = "K"

  ptop       = min(plev)

  psfc       = 1018*100.
  psfc@units = "Pa"

  dp   = dpres_plevel(plev, psfc, ptop, 0)  ; dp(30)
  print("dp="+dp+"    t="+t)

  CP = 1004.               ; J/(K kg)     [ m2/(K s2) ]
  GR = 9.81                ; gravity      [ m/s2 ]

                           ; integrate vertically
  IE   = (CP/GR)*sum( t*dp )

  IE@long_name = "Internal Energy: Cp*sum( T*dp )/gravity"
  IE@units     = "kg/s2"
                           ; weighted vertical average
  IE_average   = IE/sum(dp)
  IE_average@long_name = "Internal Energy: Weighted vertical average"

   The output from the print statement is:
        psfc=101800
(0)     plev=100000 dp=4300    t=302.45
(1)     plev=95000  dp=5000    t=301.25
(2)     plev=90000  dp=5000    t=296.65
(3)     plev=85000  dp=5000    t=294.05
(4)     plev=80000  dp=5000    t=291.55
(5)     plev=75000  dp=5000    t=289.05
(6)     plev=70000  dp=5000    t=286.25
(7)     plev=65000  dp=5000    t=283.25
(8)     plev=60000  dp=5000    t=279.85
(9)     plev=55000  dp=5000    t=276.25
(10)    plev=50000  dp=5000    t=272.65
(11)    plev=45000  dp=5000    t=268.65
(12)    plev=40000  dp=5000    t=264.15
(13)    plev=35000  dp=5000    t=258.35
(14)    plev=30000  dp=5000    t=251.65
(15)    plev=25000  dp=5000    t=243.45
(16)    plev=20000  dp=3750    t=233.15
(17)    plev=17500  dp=2500    t=220.75
(18)    plev=15000  dp=2500    t=213.95
(19)    plev=12500  dp=2500    t=206.65
(20)    plev=10000  dp=2250    t=199.05
(21)    plev=8000   dp=1500    t=194.65
(22)    plev=7000   dp=1000    t=197.15
(23)    plev=6000   dp=1000    t=201.55
(24)    plev=5000   dp=1000    t=206.45
(25)    plev=4000   dp=1000    t=211.85
(26)    plev=3000   dp=750     t=216.85
(27)    plev=2500   dp=500     t=221.45
(28)    plev=2000   dp=750     t=222.45
(29)    plev=1000   dp=500     t=225.65



Variable: IE
Type: float
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
Number Of Attributes: 2
  units :       W/m2
  long_name :   Internal Energy: Cp*sum( T*dp )/gravity
(0)     2.72987e+09

   Example 2 and Example 3 See additional examples. These illustrate use
   for multidimensional data.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

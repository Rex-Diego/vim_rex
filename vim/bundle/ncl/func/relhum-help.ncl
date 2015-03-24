THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/relhum.shtml
THE_TITLE:relhum
   NCL Home > Documentation > Functions > Meteorology

relhum

   Calculates relative humidity given temperature, mixing ratio, and
   pressure.

Prototype

        function relhum (
                t  : numeric,
                w  : numeric,
                p  : numeric
        )

        return_val [dimsizes(t)] :  numeric

Arguments

   t

   A scalar or multi-dimensional array containing the temperature in K.
   w

   A scalar or multi-dimensional array containing the mixing ratio in
   kg/kg. Must be the same size and shapeas t.
   p

   A scalar or multi-dimensional array equal to the pressure in Pa. Must
   be the same size and shape as t.

Return value

   A multi-dimensional array of the same sizes as t. The output will be
   double if any of the input is double, and float otherwise.

   NOTE: 6.2.0: The return missing value is whatever the default missing
   value is for the type being returned, and *not* t@_FillValue, as it was
   in the past.

Description

   Calculates relative humidity given temperature, mixing ratio, and
   pressure, using a table look-up procedure. The algorithm and tables can
   yield some very high relative humidities (>> 100%) at high pressures
   and very low temperature.

   Low temperatures and very dry conditions can yield relative humidities
   greater that 100% (super saturation). In all NCL versions through
   v5.1.1, any value greater than 100% was set to 100%. Beginning with
   v5.2.0, the returned relative humidities will be allowed to be greater
   than 100%. If the pre-v5.2.0 results are desired the user can use the
   NCL clipping operator ( < ).
  rh = relhum (t, w, conform(t,p,1))
  rh = rh < 100       ; change all rh values greater that 100 to 100.

   The returned values are similar to the results obtained using the
   algorithm in:

Murray (1967), On the computation of saturation vapor pressure,
J. Applied Met., pp 203-204

 http://dx.doi.org/10.1175/1520-0450(1967)006<0203:OTCOSV>2.0.CO;2

See Also

   relhum_ttd, dewtemp_trh

Examples

   Example 1

   Wallace and Hobbs (Atmospheric Science: An introductory Survey,
   Academic Press [p73]) state that at p=1000 [hPa], t=18 [C] and q=6
   [g/kg] the relative humidity is approximately 45.6%.
  p  = 1000.*100.       ; hPa  ==> Pa
  t  =   18.+273.15     ; C    ==> K
  q  =    6./1000.      ; g/kg ==> kg/kg

  rh = relhum (t, q, p) ; rh = 46.4 %

   Example 2

   Consider a sounding with the following values:
begin
  p  =(/ 1008.,  \      ; hPA (mb)
         1000.,950.,900.,850.,800.,750.,700.,650.,600., \
               550.,500.,450.,400.,350.,300.,250.,200., \
               175.,150.,125.,100., 80., 70., 60., 50., \
                40., 30., 25., 20. /)
  t  =(/  29.3,  \      ; C
          28.1,23.5,20.9,18.4,15.9,13.1,10.1, 6.7, 3.1,   \
          -0.5,-4.5,-9.0,-14.8,-21.5,-29.7,-40.0,-52.4,   \
         -59.2,-66.5,-74.1,-78.5,-76.0,-71.6,-66.7,-61.3, \
         -56.3,-51.7,-50.7,-47.5 /)
  q  =(/  20.38, \      ; g/kg
          19.03,16.14,13.71,11.56,9.80,8.33,6.75,6.06,5.07, \
           3.88, 3.29, 2.39, 1.70,1.00,0.60,0.20,0.00,0.00, \
           0.00, 0.00, 0.00, 0.00,0.00,0.00,0.00,0.00,0.00, \
           0.00, 0.00 /)

  q    = q/1000.

  tk   = t+273.15
  pPa  = p*100.

  rh   = relhum(tk, q, pPa)

  print(pPa+"  "+tk+"  "+q+"  "+rh)
end

   The (edited) output is:
            P       T       Q       RH
           (Pa)    (K)   (KG/KG)    (%)
         ------  ------  -------  -------
(0)      100800  302.45  0.02038  79.8228
(1)      100000  301.25  0.01903  79.3578
(2)       95000  296.65  0.01614  84.1962
(3)       90000  294.05  0.01371  79.4898
(4)       85000  291.55  0.01156  73.989
(5)       80000  289.05  0.0098   69.2401
(6)       75000  286.25  0.00833  66.1896
(7)       70000  283.25  0.00675  61.1084
(8)       65000  279.85  0.00606  64.21
(9)       60000  276.25  0.00507  63.8305
(10)      55000  272.65  0.00388  58.0412
(11)      50000  268.65  0.00329  60.8194
(12)      45000  264.15  0.00239  57.927
(13)      40000  258.35  0.0017   62.3734
(14)      35000  251.65  0.001    62.9706
(15)      30000  243.45  0.0006   73.8184
(16)      25000  233.15  0.0002   62.71
(17)      20000  220.75  0         0
(18)      17500  213.95  0         0
(19)      15000  206.65  0         0
(20)      12500  199.05  0         0
(21)      10000  194.65  0         0
(22)       8000  197.15  0         0
(23)       7000  201.55  0         0
(24)       6000  206.45  0         0
(25)       5000  211.85  0         0
(26)       4000  216.85  0         0
(27)       3000  221.45  0         0
(28)       2500  222.45  0         0
(29)       2000  225.65  0         0


   Example 3

   Let t, w and p be four-dimensional of size (ntim,nlvl,nlat,nlon). The
   returned value (rh) will be the same size. Every grid point will use
   the local pressure values.
   rh = relhum (t, w, p)

   Example 4

   Let t and w be four-dimensional of size (ntim,nlvl,nlat,nlon). Let p be
   a one-dimensional of size (nlvl) in units of Pascals. Use conform to
   expand p to the same dimensions as t and w. Placing the conform
   directly into the call to relhum has the advantage that the temporary
   array created lasts only as long as the function.
  rh = relhum (t, w, conform(t,p,1))


   Example 5

   Let t and w be four-dimensional of size (ntim,nlvl,nlat,nlon). Derive p
   using various model output quantities.
  p0   = 1000.
  ps   = a->PS               ; 3D (time,lat,lon) variable [sfc pressure]

  hyam = a->hyam             ; needed for interpolation
  hybm = a->hybm

  pres  = new ( dimsizes(t), typeof(t) )
  do n=0,nlvl-1
     pres(:,n,:,:)  = p0*hyam(n) + hybm(n)*ps
  end do

  rh = relhum (t, q, pres)  ; rel humidity
  delete (pres)

   Example 6

   An example of very high relative humidities returned by relhum,
   consider the following data:

          P         T         Q           RH
         (Pa)      (K)     (KG/KG)       (%)
       ------    ------    --------     -------
(0)     10000   223.961   6.3001e-08   0.0232985
(1)     12500   223.74    4.0001e-08   0.0189869
(2)     15000   222.816   3.0001e-08   0.0191538
(3)     17500   221.682   4.0001e-08   0.0343044
(4)     20000   220.958   5.00001e-07   0.537078
(5)     22500   219.778   3.00001e-06   4.20652
(6)     25000   218.297   7.70006e-06   14.5205
(7)     27500   217.017   1.49002e-05   36.4838
(8)     30000   216.814   2.34198e-05   64.1835
(9)     35000   220.258   3.80014e-05   78.0791
(10)    40000   226.401   6.99829e-05   76.9895
(11)    45000   231.785   0.000116013   76.3989
(12)    50000   236.517   0.000180032   77.4502
(13)    55000   240.872   0.000239057   70.6865
(14)    60000   244.73    0.000310096   66.8574
(15)    65000   247.981   0.000453205   76.1782
(16)    70000   250.727   0.000620385   85.5402
(17)    72500   251.972   0.000680463   86.1031
(18)    75000   253.466   0.000750563   84.7697
(19)    77500   255.406   0.000850723   81.1474
(20)    80000   257.311   0.00101102    82.192
(21)    82500   258.765   0.00119142    86.6692
(22)    85000   256.656   0.00107913    99.4496
(23)    87500   238.462   0.000260503  158.623  <====
(24)    90000   240.861   0.000369483  179.003
(25)    92500   246.884   0.000539779  144.127
(26)    95000   248.407   0.000600361  141.323
(27)    97500   249.947   0.000675252  140.065
(28)   100000   250.6     0.00070049   139.722  <====


   The algorithm allows relative humidities >100 to allow for
   supersaturation. In the case where the relhum yields values above some
   maximum (say, MaxRh), the user can use the where function:

   rh = where(rh.gt.MaxRh, MaxRh, rh)  ; MaxRh=105   (user specified)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

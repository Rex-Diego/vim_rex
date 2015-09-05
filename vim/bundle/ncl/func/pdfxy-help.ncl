THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/pdfxy.shtml
THE_TITLE:pdfxy
   NCL Home > Documentation > Functions > General applied math

pdfxy

   Generates a joint probability density distribution.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function pdfxy (
                x         : numeric,
                y         : numeric,
                nbinx [1] : integer,
                nbiny [1] : integer,
                opt   [1] : logical
        )

        return_val [*] :  double

Arguments

   x

   An array of any dimensionality.
   y

   An array of the same dimensionality of x.
   nbinx

   Number of bins to use for x. Specifying 0 will result in 25 bins being
   used. This must be greater than 2.
   nbiny

   Number of bins to use for y. Specifying 0 will result in 25 bins being
   used. This must be greater than 2. This may be different than nbinx
   opt

   Attributes may be associated with this variable. The attributes will
   alter the default behavior of the pdfxy.

   Setting opt=True will activate use of the options.
     * binx_min - minimum value for the x bin boundary.
     * biny_min - minimum value for the y bin boundary.
     * binx_max - maximum value for the x bin boundary.
     * biny_max - maximum value for the y bin boundary.
     * binx_nice - let NCL calculate "nice" bin boundary values x
     * biny_nice - let NCL calculate "nice" bin boundary values y

Return value

   A two-dimensional array of size (nbiny,nbinx). Values will be in
   percent of total. Numerous attributes will be associated with the
   return variable. These will include:

     * nbinx - the number of bins used for x.
     * nbiny - the number of bins used for y.
     * binx_spacing - the spacing of the bins used for x.
     * biny_spacing - the spacing of the bins used for y.
     * binx_bound_min - the minimum boundary bin value x.
     * biny_bound_min - the minimum boundary bin value y..
     * binx_bound_max - the maximum boundary bin value x..
     * biny_bound_max - the maximum boundary bin value y..
     * binx_center - a one-dimensional array of size nbinx containing the
       center points of each bin. For plotting these can be used as the
       "x" [abscissa].
     * biny_center - a one-dimensional array of size nbiny containing the
       center points of each bin. For plotting these can be used as the
       "y" [ordinate].
     * binx_bounds - a one-dimensional array of size (nbinx +1) containing
       the boundaries of each bin.
     * biny_bounds - a one-dimensional array of size (nbiny +1) containing
       the boundaries of each bin.

Description

   The input arrays x and y are partitioned into nbinx and y sections. The
   user may set the desired minimum, maximum and the number of bins. The
   returned PDF will be in percent of total.

See Also

   pdfx, genNormalDist, gsn_histogram

   histogram plot examples

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Using default settings:
  x    = random_normal ( 0,50, (/96,144/))
  y    = random_normal (10,25, dimsizes(x))
  pdf2 = pdfxy(x, y, 0, 0, False)   ; default is 25 bins
  printVarSummary( pdf2 )
  print("pdf2@binx_center="+pdf2@binx_center +"   " \
      +"pdf2@biny_center="+pdf2@biny_center)

   The (edited) printVarSummary yields:

Variable: pdf2
Type: double
Total Size: 5000 bytes
            625 values
Number of Dimensions: 2
Dimensions and sizes:   [y | 25] x [x | 25]
Coordinates:
            y: [-49.46327590942383..133.8606376647949]
            x: [-194.5512237548828..204.6318817138672]
Number Of Attributes: 26
  _FillValue :  1e+20
[snip]
  xMIN :        -202.8675384521484
  xMAX :        212.9481964111328
  binx_center :
  binx_bounds :
  binx_bound_min :      -202.8675384521484
  binx_bound_max :      212.9481964111328
  binx_spacing :        16.63262939453125
  nbinsx :      25
  yMIN :        -53.28252410888672
  yMAX :        137.6798858642578
  biny_center :
  biny_bounds :
  biny_bound_min :      -53.28252410888672
  biny_bound_max :      137.6798858642578
  biny_spacing :        7.638496398925781
  nbinsy :      25
[snip]


   The print("pdf2@binx_center="+pdf2@binx_center+"
   pdf2@biny_center="+pdf2@biny_center) yields:

(0)     pdf2@binx_center=-194.551   pdf2@biny_center=-49.4633
(1)     pdf2@binx_center=-177.919   pdf2@biny_center=-41.8248
(2)     pdf2@binx_center=-161.286   pdf2@biny_center=-34.1863
(3)     pdf2@binx_center=-144.653   pdf2@biny_center=-26.5478
(4)     pdf2@binx_center=-128.021   pdf2@biny_center=-18.9093
(5)     pdf2@binx_center=-111.388   pdf2@biny_center=-11.2708
(6)     pdf2@binx_center=-94.7554   pdf2@biny_center=-3.6323
(7)     pdf2@binx_center=-78.1228   pdf2@biny_center=4.0062
(8)     pdf2@binx_center=-61.4902   pdf2@biny_center=11.6447
(9)     pdf2@binx_center=-44.8576   pdf2@biny_center=19.2832
(10)    pdf2@binx_center=-28.2249   pdf2@biny_center=26.9217
(11)    pdf2@binx_center=-11.5923   pdf2@biny_center=34.5602
(12)    pdf2@binx_center=5.04033    pdf2@biny_center=42.1987
(13)    pdf2@binx_center=21.673     pdf2@biny_center=49.8372
(14)    pdf2@binx_center=38.3056    pdf2@biny_center=57.4757
(15)    pdf2@binx_center=54.9382    pdf2@biny_center=65.1142
(16)    pdf2@binx_center=71.5708    pdf2@biny_center=72.7527
(17)    pdf2@binx_center=88.2035    pdf2@biny_center=80.3912
(18)    pdf2@binx_center=104.836    pdf2@biny_center=88.0297
(19)    pdf2@binx_center=121.469    pdf2@biny_center=95.6682
(20)    pdf2@binx_center=138.101    pdf2@biny_center=103.307
(21)    pdf2@binx_center=154.734    pdf2@biny_center=110.945
(22)    pdf2@binx_center=171.367    pdf2@biny_center=118.584
(23)    pdf2@binx_center=187.999    pdf2@biny_center=126.222
(24)    pdf2@binx_center=204.632    pdf2@biny_center=133.861


   A simple contour plot could be generated by using the

  wks  = gsn_open_wks ("x11","PDFX")
  res  = True
  res@gsnCenterString = "default 25 bins"
  plot = gsn_csm_contour (wks, pdf2, res)


   Example 2:

   Have NCL calculate "nice" boundary bin values and spacing.

  opt          = True
  opt@bin_nice = True
  pdf2 = pdfxy(x, y, 0, 0, opt)

   Example 3:

   More joint (bivariate) examples are at Probability Distributions


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

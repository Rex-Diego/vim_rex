THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/exp_tapersh_wgts.shtml
THE_TITLE:exp_tapersh_wgts
   NCL Home > Documentation > Functions > Spherical harmonic routines

exp_tapersh_wgts

   Calculates weights which can be used to perform tapering (filtering) of
   spherical harmonic coefficients.

Prototype

        function exp_tapersh_wgts (
                M  : byte, short, integer, or long,
                N  : numeric,
                r  : integer
        )

        return_val [dimsizes(M)] :  float or double

Arguments

   M

   Maximum number of weights to be generated.

   As of version 6.0.0, this can be of type byte, short, integer or long.
   N

   mode at which the taper weight will equal exp(-1) [=0.3678795 ]. (N <
   maximum-wave-number possible)
   r

   power of exponent. This determines the rate at which the coefficients
   decrease (see below).

Description

   exp_tapersh_wgts calculates weights which will be used to perform
   tapering (filtering) on the spherical harmonic coefficients.

   The weights can be used to perform (spatial) isotropic smoothing by
   reducing the amplitude of the coefficients at higher modes. Most
   frequently, this is done for graphical purposes. The formula used is:

     S(n) = EXP{-[ n(n+1)/N(N+1)]^r }

   n = total wavenumber, N,r defined above. This is equation (9) in the
   following reference:

   Reference:

     Spatial Smoothing on the Sphere
     P. D. Sardeshmukh and B. J. Hoskins
     Monthly Weather Review, December 1984, pp 2424-2529.

See Also

   exp_tapershC, exp_tapersh, shagC, shaeC, shagc, shaec

Examples

   Example 1

   Calculate taper (filter) weights using various combinations of N and r.
   The "*" merely indicates the mode at which the weight=exp(-1). Note the
   different rates of decrease.
   M   = 64
   wgt = exp_tapersh_wgts (M,30,4)
   WGT = exp_tapersh_wgts (M,25,10)

   Results:
         m     wgt         WGT
         1  1.000000    1.000000
         2  1.000000    1.000000
         3  1.000000    1.000000
         4  1.000000    1.000000
         5  0.999999    1.000000
         6  0.999996    1.000000
         7  0.999987    1.000000
         8  0.999964    1.000000
         9  0.999912    1.000000
        10  0.999804    1.000000
        11  0.999594    1.000000
        12  0.999209    0.999999
        13  0.998534    0.999997
        14  0.997404    0.999988
       [SNIP]
        15  0.995575    0.999953
        16  0.99271     0.999835
        17  0.988348    0.999465
        18  0.981878    0.998375
        19  0.972511    0.995347
        20  0.959256    0.987393
        21  0.940915    0.967629
        22  0.916097    0.921522
        23  0.883278    0.822752
        24  0.840927    0.638179
        25  0.787708    0.367879*
        26  0.72278     0.115449
        27  0.646183    0.0107822
        28  0.559252    9.55298e-05
        29  0.464937    9.68527e-09
        30  0.367879*   2.43905e-16
        31  0.274024    1.70129e-30
        32  0.189692    0
        33  0.120205    0
        34  0.0685119   0
        35  0.0344109   0
        36  0.0148747   0
        37  0.00538533  0
        38  0.00158284  0
        39  0.000364455 0
        40  6.31258e-05 0
        41  7.85462e-06 0
        42  6.66453e-07 0
       [SNIP]
        64  0           0


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

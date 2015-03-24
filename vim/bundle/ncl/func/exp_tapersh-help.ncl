THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/exp_tapersh.shtml
THE_TITLE:exp_tapersh
   NCL Home > Documentation > Functions > Spherical harmonic routines

exp_tapersh

   Performs tapering (filtering) of the spherical harmonic coefficients.

Prototype

        procedure exp_tapersh (
                a  : float or double,
                b  : float or double,
                N  : numeric,
                r  : integer
        )

Arguments

   a
   b

   spherical harmonic coefficients returned to the user by the NCL
   procedures shagc/shaec.

   N

   mode at which the taper weight will equal exp(-1) [=0.3678795 ]. (N <
   maximum-wave-number possible)
   r

   power of exponent. This determines the rate at which the coefficients
   decrease (see below).

Description

   exp_tapersh performs tapering on the spherical harmonic coefficients.

   The effect is to perform (spatial) isotropic smoothing by reducing the
   amplitude of the coefficients at higher modes. Most frequently, this is
   done for graphical purposes. The formula used is:

     S(n) = EXP{-[ n(n+1)/N(N+1)]^r }

   n = total wavenumber, N,r defined above. This is equation (9) in the
   following reference:

   Reference:

     Spatial Smoothing on the Sphere
     P. D. Sardeshmukh and B. J. Hoskins
     Monthly Weather Review, December 1984, pp 2424-2529.

   exp_tapersh is the procedural version of exp_tapershC.

See Also

   exp_tapershC, exp_tapersh_wgts, shagc, shaec

Examples

   Example 1

   a and b are calculated from a procedure (say shagc/shaec). Array space
   for a and b must be preallocated by the user prior to calling the NCL
   procedures shagc/shaec. g is a data array dimensioned ntim x nlat x
   nlon, h is a preallocated, equally-spaced grid, and no cyclic points
   are included
  a  = new ( nlat, nlat )
  b  = new ( nlat, nlat )

  T  = 62
  shaec(g,a,b)
  tri_trunc (a,b,T)                     ;triangularly truncate the spherical har
monic coefficients
  exp_tapersh (a,b, 45, 2)              ;taper the spherical harmonic coefficien
ts

  shsec(a,b,h)                  ;perform the spherical harmonic synthesis on the
 truncated coefficients, store results in h



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

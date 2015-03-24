THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/shsgc_R42_Wrap.shtml
THE_TITLE:shsgc_R42_Wrap
   NCL Home > Documentation > Functions > Spherical harmonic routines

shsgc_R42_Wrap

   Computes spherical harmonic synthesis of a scalar quantity via
   rhomboidally truncated (R42) spherical harmonic coefficients onto a
   (108x128) gaussian grid. (creates metadata).

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function shsgc_R42_Wrap (
                a  : numeric,
                b  : numeric
        )

        return_val  :  float or double

Arguments

   a
   b

   real and imaginary spherical harmonic coefficients (input, array with
   two or more dimensions). The rightmost dimensions must be of size
   (43,43).

Return value

   This function is "hard-wired" to return one or more latitude x
   longitude grids of size 108 x 128. Coordinate arrays are assigned. If
   meta data is available it is copied. The return type is floating point
   if the input is floating point, and double if the input is of type
   double.

Description

   shsgc_R42_Wrap performs the spherical harmonic synthesis via the arrays
   a and b.

   NOTE: This function does not allow for missing data input values.

See Also

   shsgc_R42

Examples

   The following offer some typical scenarios. Of course, the _Wrap
   version of the function can be used if meta data is desired. Example 1

   The file contains coefficients for one grid.
  f      = addfile("foo.nc","r")
  a      = f->A                     ; a(43,43)
  b      = f->B                     ; b(43,43)
  x      = shsgc_R42(a,b)           ; x(108,128)
 or
  x      = shsgc_R42_Wrap(a,b)      ; x(108,128)

   Example 2

   Same as Example 1 but the coefficients are stored as a one-dimensional
   array (AB). Use onedtond to make the required 43x43 array. For clarity,
   one-dimensional coefficients will be created separately.
  f      = addfile("foo.nc","r")
  a1     = f->AB(0::2)              ; a1(43*43) ==> a(1849)
  b1     = f->AB(1::2)              ; b1(43*43) ==> b(1849)
  a      = onedtond(a1, (/43,43/) )
  b      = onedtond(b1, (/43,43/) )
  x      = shsgc_R42(a,b)           ; x(108,124)
 or
  x      = shsgc_R42_Wrap(a,b)      ; x(108,128)


   Example 3

   Let the coefficients be stored as (ntim,klevel,43,43). The following
   illustrates recreating the entire variable array.
  f      = addfile("foo.nc","r")
  a      = f->A                     ; a(ntim,klevel,43,43)
  b      = f->B                     ; b(ntim,klevel,43,43)
  x      = shsgc_R42(a,b)           ; x(ntim,klevel,108,124)
 or
  x      = shsgc_R42_Wrap(a,b)      ; x(108,128)

   Of course, it is possible to process one array at a time via do loops.
  f      = addfile("foo.nc","r")
  do nt=0,ntim-1
    do kl=0,klevel-1
       a = f->A(nt,kl,:,:)          ; a(43,43)
       b = f->B(nt,kl,:,:)          ; b(43,43)
       x = shsgc_R42(a,b)           ; x(108,128)
    end do
  end do

   Example 4

   Same as Example 3 but the real and imaginary coefficients are in an
   alternating sequence. Use of both onedtond and ndtooned is required.
  f      = addfile("foo.nc","r")
  A      = f->AB(:,:,0::2)          ; A(ntim,klevel,1849)
  B      = f->AB(:,:,1::2)          ; B(ntim,klevel,1849)
  a      = onedtond( ndtooned(A), (/ntim,klevel,43,43/) )
  b      = onedtond( ndtooned(B), (/ntim,klevel,43,43/) )
  x      = shsgc_R42(a,b)           ; x(ntim,klevel,108,124)
 or
  x      = shsgc_R42_Wrap(a,b)      ; x(108,128)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

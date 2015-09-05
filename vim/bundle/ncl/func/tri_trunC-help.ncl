THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tri_trunC-1.shtml
THE_TITLE:tri_trunC
   NCL Home > Documentation > Functions > Spherical harmonic routines

tri_trunC

   Performs triangular truncation on spherical harmonic coefficients.

Prototype

        function tri_trunC (
                ab  : numeric,
                T   : integer
        )

        return_val [dimsizes(ab)] :  float or double

Arguments

   ab

   Spherical harmonic coefficients returned to user by the NCL functions
   shagC/shaeC. The first dimension must be 2, which addresses the real
   and imaginary parts.

   T

   Triangular truncation parameter. T is the constant number of total wave
   numbers to keep.

Return value

   A double array is returned if the input is double; otherwise a float
   array is returned. The returned array will be of size dimsizes(ab).

Description

   tri_trunC performs triangular truncation on coefficients returned by
   the Spherepack analysis routines shagC or shaeC.

See Also

   tri_trunc, rhomb_trunC, rhomb_trunc, shagC, shsgC shaeC, shseC

Examples

   Example 1

   g(nlat,nlon)
  T  = 42
  ab = shagC (g)
  ab = tri_trunC (ab,T)
  g  = shsgC (ab,nlon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

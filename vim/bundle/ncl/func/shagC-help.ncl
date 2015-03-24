THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/shagC-1.shtml
THE_TITLE:shagC
   NCL Home > Documentation > Functions > Spherical harmonic routines

shagC

   Computes spherical harmonic analysis of a scalar field on a gaussian
   grid via spherical harmonics.

Prototype

        function shagC (
                g  : numeric
        )

        return_val  :  float or double

Arguments

   g

   discrete function to be analyzed (input, array with two or more
   dimensions). The last two dimensions must be nlat x nlon. Note:
     * input values must be in ascending latitude order
     * input arrays must be on a global grid

Return value

   If the last two dimensions of g are nlat x nlon, then the last two
   dimensions of the return array ab will be nlat x N, where N is
   determined as follows:

     N = minimum(nlat, (nlon+2)/2) if nlon is even
     N = minimum(nlat, (nlon+1)/2) if nlon is odd

   The first dimension of ab will be 2, which addresses the real and
   imaginary parts.

   For example, if g is a two dimensional array (nlat,nlon), then the
   dimensions of ab will be 2 x nlat x N, where ab(0,nlat,N) contains the
   "real" coefficients and ab(1,nlat,N) contains the "imaginary"
   coefficients.

   If g is a three dimensional array (nt,nlat,nlon), then ab(0,nt,nlat,N)
   will contain the "real" coefficients, and ab(1,nt,nlat,N) will contain
   the "imaginary" coefficients.

   If g is a four dimensional array (nt,nlvl,nlat,nlon), then
   ab(0,nt,nlvl,nlat,N) will contain the "real" coefficients, and
   ab(1,nt,nlvl,nlat,N) will contain the "imaginary" coefficients.

   The return array will be double if the input is double, and float
   otherwise.

Description

   shagC performs the spherical harmonic analysis on the array g. In
   general, shagC (performs spherical harmonic analysis) is used in
   conjunction with shsgC (performs spherical harmonic synthesis). Note
   that both shagC and shsgC operate on a gaussian grid.

   NOTE: This function does not allow for missing data (defined by the
   _FillValue attribute) to be present. g should not include the cyclic
   (wraparound) points, as this procedure uses spherical harmonics. (NCL
   procedures/functions that use spherical harmonics should never be
   passed input arrays that include cyclic points.)

   Normalization: Let m be the Fourier wave number (rightmost dimension)
   and let n be the Legendre index (next-to-last dimension). Then ab = 0
   for n < m. The Legendre index, n, is sometimes referred to as the total
   wave number.

   The associated Legendre functions are normalized such that:
    sum_lat sum_lon { [ Pmn(lat,lon)e^im lon ]^2 w(lat)/mlon } = 0.25  (m=0)

    sum_lat sum_lon {
          { [ Pmn(lat,lon)e^im lon ]^2
          + [ Pmn(lat,lon)e^i-m lon ]^2 } w(lat)/mlon } = 0.5  (m /= 0)

   where w represents the Gaussian weights:
  sum_lat { w(lat) } = 2.

   If the input array g is on a fixed grid, shaeC should be used. Also,
   note that shagC is the function version of shagc.

See Also

   shagc, shsgC, shsgc, shaeC, shaec, shsec, shseC, rhomb_trunC, tri_trunC

Examples

   In the following examples, g is on a gaussian grid and no cyclic points
   are included.

   Example 1

   g(nlat,nlon):
   ab = shagC (g)
     [do something with the coefficients]
   g  = shsgC (ab,nlon)       ; or, shsgc (ab(0,:,:), ab(1,:,:), g)

   Example 2

   g(nt,nlat,nlon):
   ab = shagC (g)
      [do something with the coefficients]
   g  = shsgC (ab,nlon)       ; or, shsgc (ab(0,:,:,:), ab(1,:,:,:), g)

   Example 3

   g(nt,nlvl,nlat,nlon):
   ab = shagC (g)
   ab = rhomb_trunC (ab,15)
   g  = shsgC (ab,nlon)       ; or, shsgc (ab(0,:,:,:,:), ab(1,:,:,:,:), g)

   Note: if g has dimensions, say, nlat = 64 and nlon = 129, where the
   "129" represents the cyclic points, then the user should pass the data
   to the function such that the cyclic points are not included. In the
   following examples, g is a gaussian grid that contains cyclic points.
   (Remember NCL subscripts start at zero.)

   Example 4

   g(nlat,nlon)
   nlon1 = nlon -1
   ab = shagC (g(:,0:nlon1-1))         ; only use the non-cyclic data
     [do something with the coefficients]
   g(:,0:nlon1-1) = shsgC (ab,nlon1)  ; reconstruct
   g(:,nlon1)     = g(:,0)           ; add new cyclic pt

   Example 5

   g(nt,nlat,nlon)
   nlon1 = nlon -1
   ab = shagC (g(:,:,0:nlon1-1))
     [do something with the coefficients]
   g(:,:,0:nlon1-1) = shsgC (ab,nlon1) ; reconstruct
   g(:,:,nlon1)   = g(:,:,0)          ; add new cyclic pt

   Example 6

   g(nt,nlvl,nlat,nlon)
   nlon1 = nlon-1
   ab = shagC (g(:,:,:,0:nlon1-1))
     [do something with the coefficients]
   g(:,:,:,0:nlon1-1) = shsgC (ab,nlon1)
   g(:,:,:,nlon1)   = g(:,:,:,0)  ; add new cyclic pt

   Example 7

   Given the spherical harmonic coefficients, to get the (amplitude^2)/2
   to plot a spatial spectrum normalized by 0.25 for m = 0 and 0.5 for m
   ne 0.

   Let g(nlat,nlon) and "ntr" be the maximum truncation (or as big as
   nlat) since spec is 0 beyond "ntr":
   ab = shagC (g)
                                 ; for clarity place in separate arrays
   cr = ab(0,:,:)                ; real coef  (nlat,nlat)
   ci = ab(1,:,:)                ; imaginary  (nlat,nlat)

   pwr = (cr^2 + ci^2)/2.        ; (nlat,nlat)  array

   spc = new ( nlat, typeof(cr) )
   delete(spc@_FillValue)
                                ; for clarity use do loops
   do n=1,ntr
     spc(n) = pwr(n,0)
     do m=1,n
       spc(n) = spc(n) + 2.*pwr(n,m)
     end do
     spc(n) = 0.25*spc(n)
   end do

   Or, using array syntax and the built-in function sum:
   do n=1,ntr
      spc(n) = 0.25*(pwr(n,0) + 2.*sum( pwr(n,1:n) ) )
   end do

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of nt (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

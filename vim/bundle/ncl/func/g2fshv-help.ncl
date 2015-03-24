THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/g2fshv.shtml
THE_TITLE:g2fshv
   NCL Home > Documentation > Functions > Regridding

g2fshv

   Interpolates a vector quantity from a Gaussian grid to a fixed grid.

Prototype

        procedure g2fshv (
                ua  : numeric,
                va  : numeric,
                ub  : float,    ; or double
                vb  : float     ; or double
        )

Arguments

   ua
   va

   Vector arrays of 2 or more dimensions whose rightmost two dimensions
   must be latitude x longitude. The values must be in ascending latitude
   order.
   ub
   vb

   (output)
   Vector arrays of 2 or more dimensions whose rightmost two dimensions
   must be latitude x longitude. Values will be in ascending latitude
   order. All but the two rightmost dimensions must be the same as all but
   the two rightmost dimensions of ua and va.

   Since g2fshv is a procedure, the user must explicitly preallocate
   memory for these return arrays.

Description

   g2fshv interpolates a vector pair on a Gaussian grid (ua,va) to a fixed
   grid (ub,vb) using spherical harmonics (via the Spherepack code).

   Arrays which have dimensions [...] x nlata x nlona should not include
   the cyclic (wrap-around) points when invoking this procedure. For
   example, if arrays u and v have dimensions nlata = 64 and nlona = 129,
   where the "129" represents the cyclic point, then the user should pass
   the data to g2fshv via:
  z = g2fshv(u(...,0:nlona-2), v(...,0:nlona-2),...)  ; does not include cyclic
points

   This procedure can only be used on grids that span the globe. It cannot
   be used for limited area grids.

   Please read the caveats that you should be aware of when using
   spherical harmonic regridding.

   Use g2fshv_Wrap if retention of metadata is desired.

See Also

   f2foshv, f2fshv, f2gshv, fo2fshv, g2fshv, g2gshv

Examples

   Example 1

   Assume u and v are dimensioned nt x nlat x nlon, and that they are of
   type float or double.

   The code below interpolates from a Gaussian T63 grid (nlat=94,
   nlon=192) to a fixed 2.5 x 5.0 degree grid (jlat=73,ilon=72):
  uNew = new ( (/nt,jlat,ilon/), typeof(u) )
  vNew = new ( (/nt,jlat,ilon/), typeof(v) )

  g2fshv (u,v, uNew,vNew)

Errors

   ier is equal to:

     4 or 10 if nlona (ilon) is less than 4
     5 or 10 if nlata (jlat) is less than 3
     8 if nlonb is less than 4
     9 if nlatb is less than 3


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

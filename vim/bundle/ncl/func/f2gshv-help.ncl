THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/f2gshv.shtml
THE_TITLE:f2gshv
   NCL Home > Documentation > Functions > Regridding

f2gshv

   Interpolates a vector quantity on a fixed grid to a Gaussian grid
   (optional truncation).

Prototype

        procedure f2gshv (
                ua        : numeric,
                va        : numeric,
                ub        : float,    ; or double
                vb        : float,    ; or double
                twave [1] : integer
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

   Since f2gshv is a procedure, the user must explicitly preallocate
   memory for these return arrays.
   twave

   Scalar integer indicating the optional wave truncation:
   twave = 0 => exact interpolation
       twave > 0 => exact interpolation and triangular truncation at twave
       twave < 0 => exact interpolation, triangular truncation at twave
       and spectral coefficient tapering (the effect is to smooth the
       data)

Description

   f2gshv interpolates a vector pair on a fixed grid (ua,va) to a Gaussian
   grid (ub,vb) (optional truncation) using spherical harmonics (via the
   Spherepack code).

   Arrays which have dimensions [...] x nlata x nlona should not include
   the cyclic (wrap-around) points when invoking this procedure. For
   example, if arrays u and v have dimensions nlata = 64 and nlona = 129,
   where the "129" represents the cyclic point, then the user should pass
   the data to f2gshv via:
  z = f2gshv(u(...,0:nlona-2), v(...,0:nlona-2),...)  ; does not include cyclic
points

   This procedure can only be used on grids that span the globe. It cannot
   be used for limited area grids.

   Please read the caveats that you should be aware of when using
   spherical harmonic regridding.

   Use f2gshv_Wrap if retention of metadata is desired.

See Also

   f2foshv, f2fshv, f2gshv, fo2fshv, g2fshv, g2gshv

Examples

   Example 1

   Assume u and v are dimensioned nt x nlat x nlon, and that they are of
   type float or double.

   The code below interpolates from a fixed 2.5 degree grid (nlat=73,
   nlon=144) to a Gaussian "t42" grid (jlat=64,ilon=128) with triangular
   truncation at wave 42:
  uNew = new ( (/nt,jlat,ilon/), typeof(u) )
  vNew = new ( (/nt,jlat,ilon/), typeof(v) )

  f2gshv (u,v, uNew,vNew, 42)

Errors

   ier is equal to:

     4 or 10 if nlona (ilon) is less than 4
     5 or 10 if nlata (jlat) is less than 3
     8 if nlonb is less than 4
     9 if nlatb is less than 3


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/g2gshv_Wrap.shtml
THE_TITLE:g2gshv_Wrap
   NCL Home > Documentation > Functions > Regridding

g2gshv_Wrap

   Interpolates a vector quantity from one Gaussian to another (optional
   truncation) (retains metadata).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure g2gshv_Wrap (
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

   Since g2gshv_Wrap is a procedure, the user must explicitly preallocate
   memory for these return arrays.
   twave

   Scalar integer indicating the optional wave truncation:
   twave = 0 => exact interpolation
       twave > 0 => exact interpolation and triangular truncation at twave
       twave < 0 => exact interpolation, triangular truncation at twave
       and spectral coefficient tapering (the effect is to smooth the
       data)

Description

   g2gshv_Wrap interpolates a vector pair from one Gaussian grid (ua,va)
   to another (ub,vb) (optional truncation) using spherical harmonics (via
   the Spherepack code). Values will be in ascending latitude order.

   Arrays which have dimensions [...] x nlata x nlona should not include
   the cyclic (wrap-around) points when invoking this procedure. For
   example, if arrays u and v have dimensions nlata = 64 and nlona = 129,
   where the "129" represents the cyclic point, then the user should pass
   the data to g2gshv_Wrap via:
  z = g2gshv_Wrap(u(...,0:nlona-2), v(...,0:nlona-2),...)  ; does not include cy
clic points

   This procedure can only be used on grids that span the globe. It cannot
   be used for limited area grids.

   Please read the caveats that you should be aware of when using
   spherical harmonic regridding.

   This function is identical to the built-in function g2gshv except it
   retains metadata.

See Also

   f2foshv_Wrap, f2fshv_Wrap, f2gshv_Wrap, fo2fshv_Wrap, g2fshv_Wrap,
   g2gshv_Wrap

Examples

   Example 1

   Assume u and v are dimensioned nt x nlat x nlon, and that they are of
   type float or double.

   The code below interpolates from a Gaussian T63 grid (nlat=94,
   nlon=192) to a Gaussian T42 grid (jlat=64,ilon=128) with triangular
   truncation at wave 42:
  uNew = new ( (/nt,jlat,ilon/), typeof(u) )
  vNew = new ( (/nt,jlat,ilon/), typeof(v) )

  g2gshv_Wrap (u,v, uNew,vNew, 42)

Errors

   ier is equal to:

     4 or 10 if nlona (ilon) is less than 4
     5 or 10 if nlata (jlat) is less than 3
     8 if nlonb is less than 4
     9 if nlatb is less than 3


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/fo2fshv_Wrap.shtml
THE_TITLE:fo2fshv_Wrap
   NCL Home > Documentation > Functions > Regridding

fo2fshv_Wrap

   Interpolates a vector quantity from a fixed-offset grid to a fixed grid
   (retains metadata).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure fo2fshv_Wrap (
                uoff  : numeric,
                voff  : numeric,
                ureg  : float,    ; or double
                vreg  : float     ; or double
        )

Arguments

   uoff
   voff

   Vector arrays of 2 or more dimensions whose rightmost two dimensions
   must be latitude x longitude. The values must be in ascending latitude
   order.
   ureg
   vreg

   (output)
   Vector arrays of 2 or more dimensions whose rightmost two dimensions
   must be latitude x longitude. Values will be in ascending latitude
   order.

   The arrays must be the same size as the uoff and voff arrays, except
   the latitude dimension must have one extra element.

   Since fo2fshv_Wrap is a procedure, the user must explicitly preallocate
   memory for these return arrays.

Description

   fo2fshv_Wrap interpolates a vector pair on a fixed-offset grid
   (uoff,voff) (including pole points) to a fixed grid (ureg,vreg) using
   spherical harmonics (via the Spherepack code). The output array
   dimensions must be the same as the input array dimensions, except jlat
   is replaced by jlat+1. For example, a 5 degree fixed-offset grid would
   have dimensions nlata=36, nlona=72, and the return fixed grid would
   have dimensions nlatb=37, nlonb=72.

   Arrays which have dimensions [...] x nlata x nlona should not include
   the cyclic (wrap-around) points when invoking this procedure. For
   example, if arrays u and v have dimensions nlata = 64 and nlona = 129,
   where the "129" represents the cyclic point, then the user should pass
   the data to fo2fshv_Wrap via:
  z = fo2fshv_Wrap(u(...,0:nlona-2), v(...,0:nlona-2),...)  ; does not include c
yclic points

   This procedure can only be used on grids that span the globe. It cannot
   be used for limited area grids.

   Please read the caveats that you should be aware of when using
   spherical harmonic regridding.

   This function is identical to the built-in function fo2fshv except it
   retains metadata.

See Also

   f2foshv_Wrap, f2fshv_Wrap, f2gshv_Wrap, fo2fshv_Wrap, g2fshv_Wrap,
   g2gshv_Wrap

Examples

   Example 1

   Assume u and v are dimensioned nt x nlat x nlon, and that they are of
   type float or double.

   The code below interpolates from a fixed offset 2.5 degree grid
   (nlat=72, nlon=144) to a fixed grid with 2.5 degree resolution
   (jlat=73, ilon=144):
  uNew = new ( (/nt,jlat,ilon/), typeof(u) )
  vNew = new ( (/nt,jlat,ilon/), typeof(v) )

  fo2fshv_Wrap (u,v, uNew,vNew)

Errors

   ier is equal to:

     4 or 10 if nlona (ilon) is less than 4
     5 or 10 if nlata (jlat) is less than 3
     8 if nlonb is less than 4
     9 if nlatb is less than 3


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

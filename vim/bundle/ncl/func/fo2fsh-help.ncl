THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fo2fsh.shtml
THE_TITLE:fo2fsh
   NCL Home > Documentation > Functions > Regridding

fo2fsh

   Interpolates a scalar quantity from a fixed-offset grid to a fixed
   grid.

Prototype

        function fo2fsh (
                grid  : numeric
        )

        return_val  :  float or double

Arguments

   grid

   An array of 2 or more dimensions whose rightmost two dimensions must be
   latitude x longitude. The values must be in ascending latitude order.

Return value

   The return array dimensions are the same as grid's dimensions, except
   the latitude dimension (nlata) is increased by one. For example, a 5
   degree fixed-offset grid would have dimensions nlata=36, nlona=72 and
   the return fixed grid would have dimensions nlatb=37, nlonb=72. The
   type will be double if the input is double, and float otherwise.

Description

   fo2fsh interpolates a scalar quantity on a fixed-offset grid to a fixed
   grid using spherical harmonics (via the Spherepack code). Values will
   be in ascending latitude order.

   If missing values are encountered in a 2D subsection of the input
   array, then no interpolation will be performed on that 2D array, and
   the corresponding 2D subsection of the return array will be filled with
   missing values.

   Arrays which have dimensions [...] x nlata x nlona should not include
   the cyclic (wrap-around) points when invoking this function. For
   example, if an array x has dimensions nlata = 64 and nlona = 129, where
   the "129" represents the cyclic point, then the user should pass the
   data to fo2fsh via:
  z = fo2fsh ( x(...,0:nlona-2) )  ; does not include cyclic points

   This function can only be used on grids that span the globe. It cannot
   be used for limited area grids.

   Please read the caveats that you should be aware of when using
   spherical harmonic regridding.

   Use fo2fsh_Wrap if retention of metadata is desired.

See Also

   f2fosh, f2fsh, f2gsh, fo2fsh, g2fsh, g2gsh

Examples

   Assume x is dimensioned nt x nlat x nlon. The code below interpolates
   from a fixed offset 2.5 degree grid (nlat=72, nlon=144) to a fixed grid
   with 2.5 degree resolution (jlat=73, ilon=144):

  X = fo2fsh (x)        ; ==> X(nt,jlat,ilon)

Errors

   ier is equal to:

     4 or 10 if nlona is less than 4
     5 or 10 if nlata is less than 3
     8 if nlonb is less than 4
     9 if nlatb is less than 3


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

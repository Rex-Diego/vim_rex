THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dv2uvF-1.shtml
THE_TITLE:dv2uvF
   NCL Home > Documentation > Functions > Spherical harmonic routines

dv2uvF

   Computes the divergent (irrotational) wind components for a fixed grid
   via spherical harmonics.

Prototype

        function dv2uvF (
                dv  : numeric
        )

        return_val [2, dimsizes(dv)] :  float or double

Arguments

   dv

   Divergence array (input, two or more dimensions, where the rightmost
   two dimensions must be lat x lon)
     * input values must be in ascending latitude order
     * input array must be on a global grid

Return value

   The results are returned in an array dimensioned 2 x N x nlat x nlon,
   where the leftmost 0-th dimension contains the u component and the
   leftmost 1-th dimension contains the v component (both in ascending
   latitude order). N represents all but the last two dimensions of dv. If
   the input array is two-dimensional, then N can either be considered
   equal to 1 or nothing at all. The array returned will be of type double
   if the input is double, and float otherwise.

Description

   The function dv2uvF computes the divergent wind components given an
   array, dv, containing divergence and operates on a fixed grid.

   This function does not handle missing values (defined by the _FillValue
   attribute). If any missing values are encountered in a particular 2D
   input grid, then all of the values in the corresponding output grid
   will be set to the default missing value appropriate to the type of the
   output.

   Arrays which have dimensions N x nlat x nlon should not include the
   cyclic (wraparound) points when invoking the procedures and functions
   which use spherical harmonics (Spherepack).

   Use dv2uvF_Wrap if retention of metadata is desired.

   If the input array dv is on a gaussian grid, dv2uvG should be used.
   Also, note that dv2uvF is the function version of dv2uvf.

See Also

   dv2uvG, dv2uvf, dv2uvg, uv2dvF, uv2dvG

Examples

   Example 1

   Let div(nlat,mlon) be an array on a fixed grid. Then:
    uvd = dv2uvF (div)

   will return the divergent zonal and meridional wind components.

     uvd(0,nlat,mlon) <== divergent zonal wind components
     uvd(1,nlat,mlon) <== divergent meridional wind components

   These values are the same as those returned by the procedural version
   of this routine but the user does not have to explicitly allocate
   memory. For example:

  ud = new (dimsizes(div), typeof(div))
  vd = new (dimsizes(div), typeof(div))
  dv2uvf (div, ud, vd)

   Example 2

   Read u/v from a netCDF file and compute divergence:
  f = addfile ("UV.nc", "r")
  u = f->U
  v = f->V
  div = uv2dvF(u,v)     ;computes divergence given the u and v components (on a
fixed grid)

  uvd = dv2uvF (div)

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of nt (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

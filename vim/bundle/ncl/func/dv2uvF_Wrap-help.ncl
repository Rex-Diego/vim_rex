THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dv2uvF_Wrap.shtml
THE_TITLE:dv2uvF_Wrap
   NCL Home > Documentation > Functions > Spherical harmonic routines

dv2uvF_Wrap

   Computes the divergent (irrotational) wind components for a fixed grid
   via spherical harmonics and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dv2uvF_Wrap (
                dv  : float or double
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

   The function dv2uvF_Wrap computes the divergent wind components given
   an array, dv, containing divergence and operates on a fixed grid.

   This function is identical to the built-in function dv2uvF_Wrap except
   it retains metadata.

   This function does not handle missing values (defined by the _FillValue
   attribute). If any missing values are encountered in a particular 2D
   input grid, then all of the values in the corresponding output grid
   will be set to the default missing value appropriate to the type of the
   output.

   Arrays which have dimensions N x nlat x nlon should not include the
   cyclic (wraparound) points when invoking the procedures and functions
   which use spherical harmonics (Spherepack).

   If the input array dv is on a gaussian grid, dv2uvG_Wrap should be
   used.

See Also

   dv2uvG_Wrap, dv2uvG_Wrap, dv2uvf, dv2uvg, uv2dvF, uv2dvG_Wrap

Examples

   Example 1

   Let div(nlat,mlon) be an array on a fixed grid. Then:
    uvd = dv2uvF_Wrap (div)

   will return the divergent zonal and meridional wind components.

     uvd(0,nlat,mlon) <== divergent zonal wind components
     uvd(1,nlat,mlon) <== divergent meridional wind components

   Example 2

   Read u/v from a netCDF file and compute divergence:
  f = addfile ("UV.nc", "r")
  u = f->U
  v = f->V
  div = uv2dvF_Wrap(u,v)        ;computes divergence given the u and v component
s (on a fixed grid)

  uvd = dv2uvF_Wrap (div)

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of nt (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

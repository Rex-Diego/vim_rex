THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/vr2uvF_Wrap.shtml
THE_TITLE:vr2uvF_Wrap
   NCL Home > Documentation > Functions > Spherical harmonic routines

vr2uvF_Wrap

   Computes the rotational wind components via spherical harmonics, given
   an array containing relative vorticity on a fixed grid (retains
   metadata).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function vr2uvF_Wrap (
                vr  : numeric
        )

        return_val [2,dimsizes(vr)] :  float or double

Arguments

   vr

   vorticity array (input, array with two or more dimensions, last two
   dimensions must be nlat x nlon)
     * input values must be in ascending latitude order
     * array must be on a global grid

Return value

   The returned array will be dimensioned 2 x dimsizes(vr), where the
   leftmost 0-th dimension contains the u component and the leftmost 1-th
   dimension contains the v component (both in ascending latitude order).
   The returned array will be of type double if the input is double, and
   float otherwise.

Description

   vr2uvF_Wrap computes the rotational wind components given an array, vr,
   containing relative vorticity. vr2uvF_Wrap operates on a fixed grid.
   This function is identical to the built-in function vr2uvF, except it
   retains metadata.

   This function does not handle missing values (defined by the _FillValue
   attribute). If any missing values are encountered in a particular 2D
   input grid, then all of the values in the corresponding output grids
   will be set to the missing value defined by the output grids'
   _FillValue attributes.

   Input arrays should not include the cyclic (wraparound) points when
   invoking this function, or any procedure or function which uses
   spherical harmonics (Spherepack).

   If the input array vr is on a gaussian grid, vr2uvG_Wrap should be
   used.

See Also

   vr2uvG_Wrap, vr2uvF, vr2uvg, vrdv2uvF, vrdv2uvf, vrdv2uvG, vrdv2uvg,
   uv2vrdvF, uv2vrdvG, uv2vrF, uv2vrG, uv2vr_cfd

Examples

   Example 1

   Let vrt(nlat,mlon) be on a fixed grid, and contain the relative
   vorticity. Then:
uvr = vr2uvF_Wrap (vrt)

   will return the rotational zonal and meridional wind components.

     uvr(0,nlat,mlon) <== ROTATIONAL zonal wind components
     uvr(1,nlat,mlon) <== ROTATIONAL meridional wind components

   These values are the same as those returned by the procedural version
   of this routine but the user does not have to explicitly allocate
   memory. For example:

  ur = new (dimsizes(vrt), typeof(vrt))
  vr = new (dimsizes(vrt), typeof(vrt))
  vr2uvF_Wrap (vrt, ur, vr)

   Example 2

   Let vrt(ntim,klev,nlat,mlon) be on a fixed grid, and contain the
   relative vorticity. Then:
  uvr = vr2uvF_Wrap (vrt)

   will return the rotational zonal and meridional wind components.

     uvr(0,ntim,klev,nlat,mlon) <== ROTATIONAL zonal wind components
     uvr(1,ntim,klev,nlat,mlon) <== ROTATIONAL meridional wind components

   Example 3

   Read u/v (on a fixed grid) from a netCDF file, compute relative
   vorticity, and then compute the rotational wind components.
  f = addfile ("UV.nc", "r")
  u = f->U
  v = f->V

  vrt = uv2vrF_Wrap (u, v)   ; compute vorticity
  uvr = vr2uvF_Wrap (vrt)    ; compute rotational wind components

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

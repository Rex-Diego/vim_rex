THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/uv2dvF_Wrap.shtml
THE_TITLE:uv2dvF_Wrap
   NCL Home > Documentation > Functions > Spherical harmonic routines

uv2dvF_Wrap

   Computes the divergence using spherical harmonics given the u and v
   wind components on a fixed grid (retains metadata).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function uv2dvF_Wrap (
                u  : numeric,
                v  : numeric
        )

        return_val [dimsizes(u)] :  float or double

Arguments

   u
   v

   wind components (input, arrays with two or more dimensions, rightmost
   two dimensions must be nlat x nlon)
     * input values must be in ascending latitude order
     * input array must be on a global grid

Return value

   This function returns a double array if u or v are double; a float
   array otherwise. Divergence is returned in an array dimensioned
   dimsizes (u)

Description

   Given wind components u and v, uv2dvF_Wrap computes the divergence.
   This function operates on a fixed grid. This function is identical to
   the built-in function uv2dvF, except it retains metadata.

   This function does not allow for missing data (defined by the
   _FillValue attribute) to be present. If any missing values are
   encountered in a particular 2D input grid, then all of the values in
   the corresponding output grid will be set to the default missing value
   appropriate to the type of the output.

   Note, if the input arrays are not global or contain missing data, then
   it is recommended that uv2dv_cfd be used.

   Note: For the arrays whose rightmost two dimensions are nlat x nlon,
   the rest of the dimensions (if any) are collectively referred to as N.
   If the input/output arrays are just two dimensions, then N can either
   be considered equal to 1 or nothing at all.

   Arrays which have dimensions N x nlat x nlon should not include the
   cyclic (wraparound) points when invoking the procedures and functions
   which use spherical harmonics (Spherepack).

   If the input arrays u and v are on a gaussian grid, uv2dvG_Wrap should
   be used.

See Also

   uv2dvG_Wrap, uv2dvf, uv2dvg, uv2dv_cfd, dv2uvF_Wrap

Examples

   Example 1

   Calculate the divergence from the wind components u,v, and then
   calculate the divergent wind components. u and v are on a fixed grid.
begin
   a = addfile("/cgd/cas/shea/MURPHYS/ATMOS/example.nc","r")
   u = a->U(:,0,:,:)
   v = a->V(:,0,:,:)
   dv    = uv2dvF_Wrap (u,v)               ; u,v ==> divergence
   uvd   = dv2uvF_Wrap (dv)                ; dv  ==> divergent  wind components
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

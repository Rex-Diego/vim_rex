THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/lapsF-1.shtml
THE_TITLE:lapsF
   NCL Home > Documentation > Functions > Spherical harmonic routines

lapsF

   Computes the Laplacian using spherical harmonics, given a scalar z on a
   fixed grid.

Prototype

        function lapsF (
                z  : numeric
        )

        return_val [dimsizes(z)] :  float or double

Arguments

   z

   scalar function array (input, two or more dimensions, last two
   dimensions must be nlat x nlon)
     * values must be in ascending latitude order
     * array must be on a global grid

Return value

   The return type will be double if z is double, and float otherwise. The
   returned array will be of size dimsizes(z).

Description

   Given scalar function z, lapsF computes the Laplacian and returns an
   array with the same dimensions as z (values will be in ascending
   latitude order). lapsF operates on a fixed grid.

   This function does not handle missing values. If any missing values are
   encountered in a particular 2D input grid, then all of the values in
   the corresponding output grid will be set to the default missing value
   appropriate to the type of the output.

   Note: For the arrays whose last two dimensions are nlat x nlon, the
   rest of the dimensions (if any) are collectively referred to as N. If
   the input/output arrays are just two dimensions, then N can either be
   considered equal to 1 or nothing at all.

   Arrays which have dimensions N x nlat x nlon should not include the
   cyclic (wraparound) points when invoking the procedures and functions
   which use spherical harmonics (Spherepack).

   For example, if an array x has dimensions nlat = 64 and nlon = 129,
   where the "129" represents the cyclic points, then the user should pass
   the data to the procedure/function via:
    z = sample ( x([...],:,0:nlon-2) )  ; does not include cyclic points

   If the input array z is on a gaussian grid, lapsG should be used. Also,
   note that lapsF is the function version of lapsf.

See Also

   lapsG, lapsf, lapsg, ilapsF, ilapsG, ilapsf, ilapsg

Examples

   Example 1

   Read Z (on a fixed grid) from a netCDF file and compute the laplacian:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
begin
   a = addfile("/cgd/cas/shea/MURPHYS/ATMOS/80.fixed.nc","r")
   z200 = a->Z(0,{189.},:,:)                    ; z200 is dimensioned nlat x nlo
n
   printVarSummary(z200)
   lapl = lapsF(z200)
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

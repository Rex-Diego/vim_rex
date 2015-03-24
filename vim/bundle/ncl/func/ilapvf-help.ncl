THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ilapvf.shtml
THE_TITLE:ilapvf
   NCL Home > Documentation > Functions > Spherical harmonic routines

ilapvf

   Inverts the vector Laplacian (on a fixed grid) using spherical
   harmonics.

Prototype

        procedure ilapvf (
                ulap  : numeric,
                vlap  : numeric,
                u     : float,    ; or double
                v     : float     ; or double
        )

Arguments

   ulap
   vlap

   the vector Laplacian arrays to invert (input, two or more dimensions,
   last two dimensions must be nlat x nlon)
     * input values must be in ascending latitude order
     * input arrays must be on a global grid

   u
   v

   vector arrays (output, same dimensions as ulap, vlap)
     * values will be in ascending latitude order
     * input arrays must be on a global grid

Description

   ilapvf inverts the Laplacian vector ulap, vlap and returns the results
   in the arrays u and v. ilapvf operates on a fixed grid. If the input
   arrays ulap and vlap are on a gaussian grid, ilapvg should be used.

   This procedure does not handle missing values. If any missing values
   are encountered in a particular 2D input grid, then all of the values
   in the corresponding output grids will be set to the missing value
   defined by the output grids' _FillValue attribute.

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

See Also

   ilapvg, ilapsF, ilapsG, lapsG, lapsF, ilapsf, ilapsg

Examples

   Example 1

   Read u and v (on a fixed grid) from a netCDF file and compute the
   inverse vector laplacian:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
begin
   a = addfile("/cgd/cas/shea/MURPHYS/ATMOS/80.fixed.nc","r")
   v200 = a->V(0,{189.},:,:)                    ; v200 is dimensioned nlat x nlo
n
   u200 = a->U(0,{189.},:,:)                    ; u200 is dimensioned nlat x nlo
n
   printVarSummary(v200)
   ilapl_u = u200                       ; preallocate space for return array
   ilapl_v = v200                       ; preallocate space for return array
   ilapvf(u200,v200,ilapl_u,ilapl_v)
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ilapsG-1.shtml
THE_TITLE:ilapsG
   NCL Home > Documentation > Functions > Spherical harmonic routines

ilapsG

   Inverts the Laplacian (on a gaussian grid) using spherical harmonics.

Prototype

        function ilapsG (
                zlap    : numeric,
                zlmbda  : numeric
        )

        return_val [dimsizes(zlap)] :  float or double

Arguments

   zlap

   An array of two or more dimensions containing the Laplacian values to
   invert. Last two dimensions must be lat and lon. Values must be in
   ascending latitudinal order. Grid must be global.
   zlmbda

   A constant if zlap is a two-dimensional. If zlap has three or more
   dimensions then must be the same size as zlap minus the rightmost two
   dimensions.

Return value

   An array of the same size as zlap. Double if zlap or zlmbda is double,
   float otherwise.

Description

   Inverts the Laplacian (on a gaussian grid) using spherical harmonics.
   Missing values are not allowed.
   If zlmbda is identically zero, the poisson equation is solved.
   Otherwise, the Helmholtz equation is solved.

   Should not include the cyclic (wraparound) points. This is a
   restriction of the spherical harmonic (Spherepack) routines. Here is an
   example of passing in a two-dimensional array in which the last
   longitude point is left out.
    z = sample ( x(:,0:nlon-2) )  ; does not include cyclic points

   If zlap is on a fixed grid, ilapsF should be used. Also, note that
   ilapsG is the function version of ilapsg.

   Use ilapsG_Wrap if retention of metadata is desired.

See Also

   ilapsg, ilapsF, ilapsf, lapsG, lapsF, ilapvf, ilapvg

Examples

   Example 1

   Read Z (on a gaussian grid) from a netCDF file and compute the inverse
   laplacian, solving the Poisson equation (k=0):
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
begin
   a = addfile("/cgd/cas/shea/MURPHYS/ATMOS/80.nc","r")
   z200 = a->Z(0,{189.},:,:)                    ; v200 is dimensioned nlat x nlo
n
   printVarSummary(z200)
   ilapl = ilapsG(z200,0)
end

   Example 2

   Read Z (on a gaussian grid) from a netCDF file and compute the inverse
   laplacian, solving the Poisson equation (k=0). Use ilapsG_Wrap to
   retain the metadata. Note that contributed.ncl needs to be loaded to
   use ilapsG_Wrap.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
begin
   a = addfile("/cgd/cas/shea/MURPHYS/ATMOS/80.nc","r")
   z200 = a->Z(0,{189.},:,:)                    ; z200 is dimensioned nlat x nlo
n
   printVarSummary(z200)
   ilapl = ilapsG_Wrap(z200,0)
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

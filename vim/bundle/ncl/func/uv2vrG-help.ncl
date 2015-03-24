THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/uv2vrG-1.shtml
THE_TITLE:uv2vrG
   NCL Home > Documentation > Functions > Spherical harmonic routines

uv2vrG

   Computes the vorticity via spherical harmonics, given the u and v wind
   components on a gaussian grid.

Prototype

        function uv2vrG (
                u  : numeric,
                v  : numeric
        )

        return_val [dimsizes(u)] :  float or double

Arguments

   u
   v

   wind components (input, arrays with two or more dimensions, last two
   dimensions must be nlat x nlon)
     * input values must be in ascending latitude order
     * input array must be on a global grid

Return value

   A double array is returned if u or v are double; a float array is
   returned otherwise. The returned array will be of dimension size
   dimsizes (u).

Description

   Given wind components u and v, uv2vrG computes the vorticity and
   returns it as an array with the same dimensions as u and v (values will
   be in ascending latitude order). uv2vrG operates on a gaussian grid.

   This function does not handle missing values (defined by the _FillValue
   attribute). If any missing values are encountered in a particular 2D
   input grid, then all of the values in the corresponding output grids
   will be set to the default missing value appropriate to the type of the
   output.

   Note: For the arrays whose last two dimensions are nlat x nlon, the
   rest of the dimensions (if any) are collectively referred to as N. If
   the input/output arrays are just two dimensions, then N can either be
   considered equal to 1 or nothing at all.

   Arrays which have dimensions N x nlat x nlon should not include the
   cyclic (wraparound) points when invoking the procedures and functions
   which use spherical harmonics (Spherepack).

   Use uv2vrG_Wrap if retention of metadata is desired.

   If the input arrays u and v are on a fixed grid, uv2vrF should be used.
   Also, note that uv2vrG is the function version of uv2vrg.

   Note, if the input arrays are not global or contain missing data, then
   it is recommended that uv2vr_cfd be used.

See Also

   uv2vrF, uv2vrg, uv2vrf, uv2vrdvg, vr2uvG, uv2vr_cfd, uv2vrdvg, uv2vrdvf

Examples

   Example 1

   Compute the vorticity given u and v on a gaussian grid. Also, compute
   the rotational wind components.
begin
  nlat  = 128                                       ; dimensions
  mlon  = 256
  mlon1 = mlon+1
  fbfile = "uv300.hs"

  nrec  = fbinnumrec(fbfile)       ; total number of records in the file
  ntim  = nrec/2                       ; number of time steps in dataset

  uvmsg = 1e+36

  do i = 0,nrec-1,2
   month = 1                         ; january
   if (i .ge. 2) then
       month = 7                     ; july
   end if

   work = fbinrecread(fbfile,i  ,(/nlat,mlon1/),"float")
   u    = work(:,0:mlon-1)
   work = fbinrecread(fbfile,i+1,(/nlat,mlon1/),"float")
   v    = work(:,0:mlon-1)

   vr    = uv2vrG (u,v)               ; u,v ==> vorticity (rel)
   uvr   = vr2uvG (vr)                ; vr  ==> rotational wind components
  end do
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/uv2vrdvG-1.shtml
THE_TITLE:uv2vrdvG
   NCL Home > Documentation > Functions > Spherical harmonic routines

uv2vrdvG

   Computes the vorticity and divergence via spherical harmonics, given
   the u and v wind components on a gaussian grid.

Prototype

        function uv2vrdvG (
                u  : numeric,
                v  : numeric
        )

        return_val [2,dimsizes(u)] :  float or double

Arguments

   u
   v

   wind component (input, two or more dimensions, where the rightmost two
   dimensions must be lat x lon)
     * input values must be in ascending latitude order
     * input array must be on a global grid

Return value

   The returned array will be dimensioned 2 x dimsizes(u), where the
   leftmost 0-th dimension contains the vorticity and the leftmost 1-th
   dimension contains the divergence (both in ascending latitude order).
   The returned array will be of type double if the input is double, and
   float otherwise.

Description

   uv2vrdvG takes as input u and v and computes the vorticity and
   divergence. uv2vrdvG operates on a gaussian grid.

   This function does not handle missing values (defined by the _FillValue
   attribute). If any missing values are encountered in a particular 2D
   input grid, then all of the values in the corresponding output grids
   will be set to the missing value defined by the output grids'
   _FillValue attributes.

   Input arrays should not include the cyclic (wraparound) points when
   invoking this function, or any procedure or function which uses
   spherical harmonics (Spherepack).

   If the input arrays u and v are on a fixed grid, uv2vrdvF should be
   used. Also, note that uv2vrdvG is the function version of uv2vrdvg.

   Note, if the input arrays are not global or contain missing data, then
   it is recommended that uv2vr_cfd be used to compute vorticity.

See Also

   uv2vrdvg,uv2vrdvF, uv2vrdvf, uv2vr_cfd, uv2vrG, uv2vrg, uv2vrF, uv2vrf,
   vr2uvG, dv2uvG, vrdv2uvG, uv2sfvpG

Examples

   Example 1

   Compute the vorticity and divergence given u and v on a gaussian grid.
   Also, compute the rotational wind components and the divergent wind
   components, and finally reconstruct the original wind from the
   divergence and vorticity fields.

begin
  nlat  =  64                                       ; dimensions
  mlon  = 128
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

   vrdvx = uv2vrdvG (u,v)             ; u,v ==> div and vort
   uvd   = dv2uvG (dv)                ; dv  ==> divergent  wind components
   uvr   = vr2uvG (vr)                ; vr  ==> rotational wind components
   uuvv  = vrdv2uvG (vr,dv)           ; vr,dv > reconstruct original wind
  end do
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

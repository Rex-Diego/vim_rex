THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/uv2sfvpG-1.shtml
THE_TITLE:uv2sfvpG
   NCL Home > Documentation > Functions > Spherical harmonic routines

uv2sfvpG

   Computes the stream function and velocity potential via spherical
   harmonics given u and v on a gaussian grid.

Prototype

        function uv2sfvpG (
                u  : numeric,
                v  : numeric
        )

        return_val [2,dimsizes(u)] :  float or double

Arguments

   u
   v

   wind components (input, arrays with two or more dimensions, rightmost
   two dimensions must be nlat x nlon)
     * input values must be in ascending latitude order
     * input array must be on a global grid

Return value

   The returned array will be dimensioned 2 x dimsizes(u), where the
   leftmost 0-th dimension contains the stream function and the leftmost
   1-th dimension contains the velocity potential (both in ascending
   latitude order). The array returned will be of type double if the input
   is double, and float otherwise.

Description

   Given wind components u and v, uv2sfvpG computes the stream function
   and the velocity potential. uv2sfvpG operates on a gaussian grid.

   This function does not handle missing values (defined by the _FillValue
   attribute). If any missing values are encountered in a particular 2D
   input grid, then all of the values in the corresponding output grids
   will be set to the missing value defined by the output grids'
   _FillValue attributes.

   Input arrays should not include the cyclic (wraparound) points when
   invoking this function, or any procedure or function which uses
   spherical harmonics (Spherepack).

   If the input arrays u and v are on a fixed grid, uv2sfvpF should be
   used. Also, note that uv2sfvpG is the function version of uv2sfvpg.

See Also

   uv2sfvpg, uv2sfvpF, uv2sfvpf,uv2vrg

Examples

   Example 1

   Compute the stream function and velocity potential, given the u and v
   wind components on a gaussian grid.

begin
  nlat  = 128                                       ; dimensions
  mlon  = 256
  mlon1 = mlon+1
  fbfile = "uv300.hs"
                                       ; Generic Workstation setup
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

   sfvp  = uv2sfvpG (u,v)             ; u,v ==> stream function + velocity pot
  end do
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

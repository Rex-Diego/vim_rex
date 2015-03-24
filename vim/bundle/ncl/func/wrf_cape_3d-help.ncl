THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_cape_3d.shtml
THE_TITLE:wrf_cape_3d
   NCL Home > Documentation > Functions > WRF, RIP

wrf_cape_3d

   Computes convective available potential energy (CAPE) and convective
   inhibition (CIN).

Prototype

        function wrf_cape_3d (
                p       : numeric,
                t       : numeric,
                q       : numeric,
                z       : numeric,
                zsfc    : numeric,
                psfc    : numeric,
                opt [1] : logical
        )

        return_val [2,...] :  float or double

Arguments

   p

   An array containing full model pressure values [must be Pa]. Could be
   ordered bottom_top or top_bottom. This array must be the same
   dimensionality as t, q, and z. See the description section for more
   information on dimension requirements.
   t

   An array containing temperature values [K]. Must be ordered similar to
   p, q, and z. This array must be the same dimensionality as p, q, and z.
   See the description section for more information on dimension
   requirements.
   q

   An array containing water vapor mixing ratio [kg/kg]. Must be ordered
   similar to p, t, and z. This array must be the same dimensionality as
   p, t, and z. See the description section for more information on
   dimension requirements.
   z

   An array containing full model height [m]. Must be ordered similar to
   p, t, and q. This array must be the same dimensionality as p, t, and q.
   See the description section for more information on dimension
   requirements.
   zsfc

   A scalar or array containing surface height (terrain) [m]. Must be the
   same dimensionality as psfc. See the description section for more
   information on dimension requirements.
   psfc

   A scalar or array containing surface pressures [hPa]. Must be the same
   dimensionality as zsfc. See the description section for more
   information on dimension requirements.
   opt

   Set to False for pressure level data. Set to True for terrain-following
   data.

Return value

   This function returns a 2 x dimsizes(p) array, where index 0 of the
   leftmost dimension contains the CAPE values, and index 1 of the
   leftmost dimension contains the CIN values.

   In version 6.1.0, this function was upgraded to return a "_FillValue"
   attribute. See the description section below for more information.

Description

   This function replaces the now obsolete rip_cape_3d.

   This function uses the RIP [Read/Interpolate/plot] code to compute both
   convective available potential energy [CAPE: j/kg] and convective
   inhibition [CIN: j/kg] for every grid point in the entire 3D domain
   (testing each grid point as a parcel). CAPE is defined as the
   accumulated buoyant energy from the level of free convection (LFC) to
   the equilibrium level (EL). CIN is defined as the accumulated negative
   buoyant energy from the parcel starting point to the LFC. The word
   "parcel" here refers to a 500 meter deep parcel, with actual
   temperature and moisture averaged over

   There are three possible cases for the input dimension sizes:
     * p, t, q, z (time,lev,lat,lon) and psfc, zsfc (time,lat,lon)
     * p, t, q, z (lev,lat,lon) and psfc, zsfc (lat,lon)
     * p, t, q, z (lev) and psfc, zsfc (scalars)

   The return array, return_val, will be dimensioned 2 x dimsizes(p):

     return_val(0,...) will contain CAPE
     return_val(1,...) will contain CIN

   Previous to version 6.1.0, this function returned a value of -0.1 for
   out-of-range values. This has been replaced with a missing value, and a
   "_FillValue" attribute is also set. The value of the missing value
   depends on the type of the return array (float or double).

   This routine does not do anything special with missing values. If you
   pass in missing values, they will get used as if they were valid values
   in the calculations. So, make sure your data contains no missing values
   before you call this routine.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_cape_2d

Examples

   Example 1

   Assume the file PTZQ.txt contains values of p, t, z and q at 33 levels
   from a sounding. The station's geopotential elevation is 117.6 gpm and
   the surface presure is 996.95 hPa. The data follows the terrain.

     data = asciiread("PTQZ.txt", (/33,4/), "float")
     p    = data(:,0)
     t    = data(:,1)
     q    = data(:,2)
     z    = data(:,3)

     zsfc = 117.6
     psfc = 996.95

     cinfo= wrf_cape_3d(p, t, q, z, zsfc, psfc, True) ; cinfo(2,...)

   Example 2

   Read model data from a file. Each of the p, t, z and q variables is
   3-dimensional (lev,lat,lon) or 4-dimensional (time,lev,lat,lon). The
   surface elevations are 2-dimensional (lat,lon). The surface pressure is
   2-dimensional (lat,lon) if there is no time dimension and 3-dimensional
   (time,lat,lon) if there is a time dimension. The data is on pressure
   levels.

     f = addfile("model.nc" , "r")

     p = f->P             ; (lev,lat,lon) or (time,lev,lat,lon)
     t = f->T
     q = f->Q
     z = f->Z

     zsfc = f->TOPOGRAPHY ; (lat,lon)
     psfc = f->PS         ; (lat,lon) or (time,lat,lon)

     cinfo = wrf_cape_3d(p, t, q, z, zsfc, psfc, False) ; cinfo(2,...)

   Example 3

   The function wrf_user_getvar, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to calculate many diagnostics in one step.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  cape3d = wrf_user_getvar(a,"cape_3d",-1)

  ;cape = cape3d(0,....)
  ;cin = cape3d(1,....)


   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

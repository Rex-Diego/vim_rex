THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_cape_2d.shtml
THE_TITLE:wrf_cape_2d
   NCL Home > Documentation > Functions > WRF, RIP

wrf_cape_2d

   Computes maximum convective available potential energy (CAPE), maximum
   convective inhibition (CIN), lifted condensation level (LCL), and level
   of free convection (LFC).

Prototype

        function wrf_cape_2d (
                p       : numeric,
                t       : numeric,
                q       : numeric,
                z       : numeric,
                zsfc    : numeric,
                psfc    : numeric,
                opt [1] : logical
        )

        return_val [4,...] :  float or double

Arguments

   p

   An array containing full model pressure values [must be Pa], Could be
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

   An array containing full modelheight [m]. Must be ordered similar to p,
   t, and q. This array must be the same dimensionality as p, t, and q.
   See the description section for more information on dimension
   requirements.
   zsfc

   A scalar or array containing surface height (terrain) [m]. Must be the
   same dimensionality as psfc. See the description section for more
   information on dimension requirements.
   psfc

   A scalar or array containing surface pressures (hPa). Must be the same
   dimensionality as zsfc. See the description section for more
   information on dimension requirements.
   opt

   Set to False for pressure level data. Set to True for terrain-following
   data.

Return value

   A multi-dimensional array whose leftmost dimension is 4 (0=CAPE, 1=CIN,
   2=LCL, 3=LFC). The rightmost dimension sizes depend on the input
   dimension sizes. The type will be double if any of the input is double,
   and float otherwise.

   In version 6.1.0, this function was upgraded to return a "_FillValue"
   attribute. See the description section below for more information.

Description

   This function replaces the now obsolete rip_cape_2d function.

   This function uses the RIP [Read/Interpolate/plot] code to calculate
   potential energy (CAPE) and convective inhibition (CIN) (in m**2/s**2
   or J/kg) only for the parcel with max theta-e in the column (i.e.
   something akin to Colman's MCAPE). CAPE is defined as the accumulated
   buoyant energy from the level of free convection (LFC) to the
   equilibrium level (EL). CIN is defined as the accumulated negative
   buoyant energy from the parcel starting point to the LFC. The word
   "parcel" here refers to a 500 meter deep parcel, with actual
   temperature and moisture averaged over that depth.

   There are two possible cases for the input and output dimension sizes:
     * p, t, q, z (time,lev,lat,lon) and psfc, zsfc (time,lat,lon)
       --> return_val(4,time,lat,lon)
     * p, t, q, z (lev,lat,lon) and psfc, zsfc (lat,lon)
       --> return_val(4,lat,lon)

   The leftmost dimension of the return array represents four different
   quantities:

     return_val(0,...) will contain CAPE
     return_val(1,...) will contain CIN
     return_val(2,...) will contain LCL
     return_val(3,...) will contain LFC

   The return variable will contain the following attribute:

     return_val@description = "mcape_mcin_lcl_lfc"

   LCL is the lifted condensation level in (m), and is the LCL for the
   parcel in each column with maximum qe below 3000 m AGL.

   LFC is the level of free convection (LFC), m (AGL). This is the LFC for
   the parcel in each column with maximum qe below 3000 m AGL.

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

   wrf_cape_3d

Examples

   Note that if your netCDF file doesn't have a ".nc" suffix, you must
   include it in the call to addfile so it knows what kind of file to
   open. The addfile call below will cause NCL to look for both a file
   called "wrfout_d01_2005-12-14_13:00:00.nc" and
   "wrfout_d01_2005-12-14_13:00:00".

   Example 1

begin
  a = addfile("wrfout_d01_2005-12-14_13:00:00.nc","r")

  T  = a->T
  P  = a->P
  PB = a->PB
  QV = a->QVAPOR
  PH  = a->PH
  PHB = a->PHB
  HGT = a->HGT
  PSFC = a->PSFC

  T = T + 300.
  P  = P + PB
  tk = wrf_tk( P , T )
  PH =  PH + PHB
  z = wrf_user_unstagger(PH,PH@stagger)
  z = z/9.81

  cinfo = wrf_cape_2d( P, tk, QV, z, HGT, PSFC, True )

  ;mcape = cinfo(0,.....)
  ;mcin  = cinfo(1,.....)
  ;lcl  = cinfo(2,.....)
  ;lfc  = cinfo(3,.....)

end

   Example 2

   The function wrf_user_getvar, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to calculate many diagnostics in one step.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  cape2d = wrf_user_getvar(a,"cape_2d",-1)

  ;mcape = cape2d(0,.....)
  ;mcin  = cape2d(1,.....)
  ;lcl  = cape2d(2,.....)
  ;lfc  = cape2d(3,.....)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

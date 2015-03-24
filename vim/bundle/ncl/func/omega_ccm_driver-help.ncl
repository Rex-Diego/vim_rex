THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/omega_ccm_driver.shtml
THE_TITLE:omega_ccm_driver
   NCL Home > Documentation > Functions > CESM

omega_ccm_driver

   Computes vertical pressure velocity [omega] via model diagnostic code.

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function omega_ccm_driver (
                p0   [1] : numeric,
                psfc     : numeric,
                u        : numeric,
                v        : numeric,
                hyam [*] : numeric,
                hybm [*] : numeric,
                hyai [*] : numeric,
                hybi [*] : numeric
        )

        return_val [dimsizes(u)] :  float or double

Arguments

   p0

   A scalar value equal to the surface reference pressure. Must have the
   same units as psfc.
   psfc

   An array of 2 or 3 dimensions containing surface pressure [Pa]. The two
   rightmost dimensions must be lat x lon [e.g. PSFC(time,lat,lon)].
   u

   An array of 3 or 4 dimensions containing zonal wind component. The
   three rightmost dimensions must be lev x lat x lon [e.g.
   U(time,lev,lat,lon)].
   v

   An array of 3 or 4 dimensions containing meridional wind component.
   Same dimension structure as u.
   hyam

   A one-dimensional array containing the mid-level hybrid A coefficients.
   Must have the same dimension as the level dimension of u. The order
   must be top-to-bottom.
   hybm

   A one-dimensional array containing the mid-level hybrid B coefficients.
   Must have the same dimension as the level dimension of u. The order
   must be top-to-bottom.
   hyai

   A one-dimensional array containing the interface-level hybrid A
   coefficients. The dimension size is one greater than the dimension size
   of u. The order must be top-to-bottom.
   hybi

   A one-dimensional array containing the interface-level hybrid B
   coefficients. The dimension size is one greater than the dimension size
   of u. The order must be top-to-bottom.

Return value

   A double array is returned if u is double; a float array is returned
   otherwise. The returned array will be of dimension size dimsizes (u).

Description

   This function simplifies the use of omega_ccm by using commonly
   available variables. It computes assorted intermediate quantities that
   are input to omega_ccm.

See Also

   omega_ccm

Examples

   Example 1

   Use the driver located in contributed.ncl. It calculates the
   intermediate quantities required for omega_ccm.
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"


  fccm  = addfile ("dummy_ccm.nc" , "r")
  hyam  = fccm->hyam
  hybm  = fccm->hybm
  hyai  = fccm->hyai
  hybi  = fccm->hybi
  p0    = fccm->P0
  psfc  = fccm->PS
  u     = fccm->U
  v     = fccm->V
  omega = omega_ccm_driver(p0,psfc,u,v,hyam,hybm,hyai,hybi)


   Example 2

   Several additional omega examples are available.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

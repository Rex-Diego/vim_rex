THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/omega_ccm.shtml
THE_TITLE:omega_ccm
   NCL Home > Documentation > Functions > CESM

omega_ccm

   Calculates omega [vertical pressure velocity] using the model
   diagnostic method.

Prototype

        function omega_ccm (
                u          : numeric,
                v          : numeric,
                div        : numeric,
                dpsl       : numeric,
                dpsm       : numeric,
                pmid       : numeric,
                pdel       : numeric,
                psfc       : numeric,
                hybdif [*] : numeric,
                hybm   [*] : numeric,
                nprlev [1] : integer
        )

        return_val  :  numeric

Arguments

   u

   An array of 3 or 4 dimensions containing zonal wind component. The
   order of the dimensions is specific. The three rightmost dimensions
   must be level x lat x lon [e.g. U(time,lev,lat,lon)]. The order of the
   level dimension must be top-to-bottom.
   v

   An array of 3 or 4 dimensions containing meridional wind component.
   Same dimension structure as u.
   div

   An array of 3 or 4 dimensions containing divergence. Same dimension
   structure as u.
   dpsl

   An array of 3 or 4 dimensions containing longitudinal component of grad
   ln(psfc). Same dimension structure as u.
   dpsm

   An array of 3 or 4 dimensions containing latitudinal component of grad
   ln(pfc). Same dimension structure as u.
   pmid

   An array of 3 or 4 dimensions containing mid-level pressure values.
   Same dimension structure as u.
   pdel

   An array of 3 or 4 dimensions containing layer pressure thickness
   values. Same dimension structure as u.
   psfc

   An array of 2 or 3 dimensions containing surface pressure [Pa]. The two
   rightmost dimensions must be lat x lon [e.g. PSFC(time,lat,lon)].
   hybdif

   A one-dimensional array containing the difference between the hybrid
   interface coefficients [eg, hybi(k+1)-hybi(k)]. The size is the size of
   the level dimension of u. The order must be top-to-bottom.
   hybm

   A one-dimensional array containing the hybrid B coefficients. Must have
   the same dimension as the level dimension of u. The order must be
   top-to-bottom.
   nprlev

   Number of pure pressure levels (i.e. the number of levels where the
   sigma component of the hybrid coefficients is zero).

Return value

   A multi-dimensional array of the same size as u containing the vertical
   pressure velocity [Pa/s].

   The type of the output data will be double if u or v are of type
   double. Otherwise, the return type will be float.

Description

   Computes omega [ dp/dt: vertical pressure velocity (Pa/s)] via the same
   approach used by the model. Only minor changes were made to the code:
   omcalc.F90,v 1.1.2.1.

See Also

   Use the omega_ccm_driver to facilitate use of this built-in function.
   It takes the commonly available variables and computes the assorted
   intermediate quantities used by omega_ccm.

Examples

   Example 1

   Use the driver located in contributed.ncl. It leads to much cleaner
   code,
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        :

  fccm  = addfile ("dummy.ccm" , "r")
  hyam  = fccm->hyam
  hybm  = fccm->hybm
  hyai  = fccm->hyai
  hybi  = fccm->hybi
  p0    = fccm->P0
  psfc  = fccm->PS
  u     = fccm->U
  v     = fccm->V
  omega = omega_ccm_driver(p0,psfc,u,v,hyam,hybm,hyai,hybi)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

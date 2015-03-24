THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/vintp2p_ecmwf.shtml
THE_TITLE:vintp2p_ecmwf
   NCL Home > Documentation > Functions > CESM

vintp2p_ecmwf

   Interpolates data at multidimensional pressure levels to constant
   pressure coordinates and uses an ECMWF formulation to extrapolate
   values below ground.

Prototype

        function vintp2p_ecmwf (
                datai      : numeric,
                presi      : numeric,
                plevo  [*] : numeric,
                psfc       : numeric,
                intyp  [1] : integer,
                ii     [1] : integer,
                kxtrp  [1] : logical,
                varflg [1] : integer,
                tbot       : numeric,
                phis       : numeric
        )

        return_val  :  numeric

Arguments

   datai

   An array of at most *five* dimensions. The order of the dimensions is
   specific. The three right-most dimensions must be level,lat,lon [e.g.
   TS(time,lev,lat,lon) or TS(case,time,lev,lat,lon]. The order of the
   level dimension must be top-to-bottom.
   presi

   An array with the same dimensions as datai containing the pressues
   [hPa] at each grid point. The order of the level dimension must be
   top-to-bottom.
   plevo

   A one-dimensional array of output pressure levels in mb
   psfc

   A multi-dimensional array of surface pressures in Pa. Must have the
   same dimension sizes as the corresponding dimensions of datai
   intyp

   Scalar integer value equal to the interpolation type 1 - LINEAR, 2 -
   LOG, 3 - LOG LOG
   ii

   Not used at this time. Set to 1.
   kxtrp

   Logical. False = no extrapolation when the pressure level is outside of
   the range of psfc.
   varflg

   A scalar integer indicating which variable to interpolate: 1 =
   temperature, -1 = geopotential height, 0 = all others.
   tbot

   A multi-dimensional array the same sizes as psfc equal to temperature
   at the lowest (i.e, closest to the surface) level. While this is used
   only if varflg=-1 (ie, geopotential height), it must still be provided
   for all cases.
   phis

   A multi-dimensional array of surface geopotential (m^2/sec) in which
   the rightmost two dimensions are the same as psfc.

Return value

   A multi-dimensional array of the same size as datai except that the
   level coordinate has been replaced by plevo. The function automatically
   copies the metadata from datai to return_val.

   The type of the output data will be double only if psfc and datai are
   of type double. Otherwise, the return type will be float.

See Also

   vinth2p, vinth2p_ecmwf

Examples

   Example 1
  fccm = addfile ("dummy.nc" , "r")
  PSFC = f->PS
  P0mb = 0.01*f->P0
  PHIS = f->PHIS                       ; surface geopotential [2D]

  PRESI= f->PRESI
  T    = f->T                          ; temperature at pressure levels
  Z    = f->Z3                         ; geo hgt at hybrid levels
  U    = f->U                          ; zonal wind

  tbot = T(:,nlev-1,:,:)               ; bot temp level [clarity]

  nlev = dimsizes(hyam)                ; number of vertical levels
                                       ; specify levels to be interpolated
  lev_p   = (/ 850., 700., 500., 300., 200. /)
  lev_p!0         = "lev_p"            ; variable and dimension name the same
  lev_p&lev_p     = lev_p              ; create coordinate variable
  lev_p@long_name = "pressure"         ; attach some attributes
  lev_p@units     = "hPa"
  lev_p@positive  = "down"

  intyp = 1                             ; 1=linear, 2=log, 3=log-log
  kxtrp = True                          ; True=extrapolate

  varflg = 1                           ; temperature is variable
  Tp     = vintp2p_ecmwf(T, PRESI,lev_p,PSFC,intyp,P0mb, \
                 1,kxtrp,varflg,tbot,PHIS)
  varflg = -1                          ; geo pot hgt is variable [tbot is used]
  Zp     = vintp2p_ecmwf(Z, PRESI, lev_p ,PSFC, intyp, P0mb, \
                 1,kxtrp,varflg,tbot,PHIS)
  varflg = 0                           ; not T or Z
  Up     = vintp2p_ecmwf(U,PRESI,lev_p,PSFC,intyp,P0mb,\
                 1,kxtrp,varflg,tbot,PHIS)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

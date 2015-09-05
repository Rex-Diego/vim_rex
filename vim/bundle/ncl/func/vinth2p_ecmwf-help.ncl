THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/vinth2p_ecmwf.shtml
THE_TITLE:vinth2p_ecmwf
   NCL Home > Documentation > Functions > CESM

vinth2p_ecmwf

   Interpolates CESM hybrid coordinates to pressure coordinates but uses
   an ECMWF formulation to extrapolate values below ground.

Prototype

        function vinth2p_ecmwf (
                datai      : numeric,
                hbcofa [*] : numeric,
                hbcofb [*] : numeric,
                plevo  [*] : numeric,
                psfc       : numeric,
                intyp  [1] : integer,
                p0     [1] : numeric,
                ii     [1] : integer,
                kxtrp  [1] : logical,
                varflg [1] : integer,
                tbot       : numeric,
                phis       : numeric
        )

        return_val  :  numeric

Arguments

   datai

   An array of at most five* dimensions. Needs to contain a level
   dimension in hybrid coordinates. The order of the dimensions is
   specific. The three right-most dimensions must be level,lat,lon [e.g.
   TS(time,lev,lat,lon) or TS(case,time,lev,lat,lon]. The order of the
   level dimension must be top-to-bottom.

   * Note: this function was updated in version version 4.3.0 to allow
   datai to be 5 dimensions.
   hbcofa

   A one-dimensional array containing the hybrid A coefficients. Must have
   the same dimension as the level dimension of datai. The order must be
   top-to-bottom. (These are expected to be normalized to one (1.0). If
   not, divide by P0.)
   hbcofb

   A one-dimensional array containing the hybrid B coefficients. Must have
   the same dimension as the level dimension of datai. The order must be
   top-to-bottom.
   plevo

   A one-dimensional array of output pressure levels in mb
   psfc

   A multi-dimensional array of surface pressures in Pa. Must have the
   same dimension sizes as the corresponding dimensions of datai
   intyp

   Scalar integer value equal to the interpolation type 1 - LINEAR, 2 -
   LOG, 3 - LOG LOG
   p0

   Scalar numeric value equal to surface reference pressure in Mb.
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

   A multi-dimensional array of surface geopotential (m^2/sec^2) in which
   the rightmost two dimensions are the same as psfc.

Return value

   A multi-dimensional array of the same size as datai except that the
   level coordinate has been replaced by plevo. The function automatically
   copies the metadata from datai to return_val.

   The type of the output data will be double only if psfc and datai are
   of type double. Otherwise, the return type will be float.

Description

   Interpolates CESM hybrid coordinates to pressure coordinates. The type
   of interpolation is currently a variant of transformed pressure
   coordinates with the interpolation type specified by intyp. All hybrid
   coordinate values are transformed to pressure values. If datai is on
   midlevels (interfaces), then hyam/hybm (hyai/hybi) coefficients should
   be input.

   This is similar to the routine used within the CESM Processor. The
   mixture of Pa for psfc and mb for plevo and p0 is specified by that
   source routine.

   This function differs from vinth2p in the method it uses to extrapolate
   to levels below psfc. It uses the ECMWF formulation as described in
Vertical Interpolation and Truncation of Model-Coordinate Data
Trenberth, Berry, Buja
[NCAR/TN-396, 1993].

   in which special formulations are used for temperature and geopotential
   height below ground. All other variables are simply held constant below
   ground at the values from the lowest model level.

See Also

   Use the vinth2p in no extrapolation below ground for temperature and
   geopotential is desired.

Examples

   CESM1.0 output files in CCM History Tape (CCMHT) format. These files
   may be read into NCL directly using addfile with a ".ccm" extension.
   Alternatively, these files may be converted to netCDF using ccm2nc. The
   reason for mentioning this is that there are differences. The netCDF
   files produced by ccm2nc or output directly from later versions of the
   model:
    1. have the reference pressure (P0) contained within the file while
       earlier files do not. In the latter case the user must explicitly
       provide that information.
    2. produce variables with level, latitude and longitude being the
       three rightmost (fastest varying) dimensions [e.g.
       TS(time,lev,lat,lon)]. The variables in CCMHT format are ordered
       differently [e.g. (lat,lev,lon) or (time,lat,lev,lon)]. It is
       therefore necessary to reorder the variable before input.
    3. have a time dimension while the CCMHT files may or may not have a
       time dimension.

   Example 1 Use the ECMWF formulation to extrapolate below ground. The
   syntax T(:,nlev-1,:,:) extracts the temperatures from the lowest hybrid
   level of the model. tbot is a 3D array dimensioned(time,lat,lon).
  fccm = addfile ("dummy.nc" , "r")
  hyam = f->hyam
  hybm = f->hybm
  PSFC = f->PS
  P0mb = 0.01*f->P0
  PHIS = f->PHIS                       ; surface geopotential [2D]

  T    = f->T                          ; temperature at hybrid levels
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
  Tp     = vinth2p_ecmwf(T,hyam,hybm,lev_p,PSFC,intyp,P0mb, \
                 1,kxtrp,varflg,tbot,PHIS)
  varflg = -1                          ; geo pot hgt is variable [tbot is used]
  Zp     = vinth2p_ecmwf(Z, hyam,hybm, lev_p ,PSFC, intyp, P0mb, \
                 1,kxtrp,varflg,tbot,PHIS)
  varflg = 0                           ; not T or Z
  Up     = vinth2p_ecmwf(U,hyam,hybm,lev_p,PSFC,intyp,P0mb,\
                 1,kxtrp,varflg,tbot,PHIS)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

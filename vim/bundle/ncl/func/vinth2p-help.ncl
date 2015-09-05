THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/vinth2p.shtml
THE_TITLE:vinth2p
   NCL Home > Documentation > Functions > CESM

vinth2p

   Interpolates CESM hybrid coordinates to pressure coordinates

Prototype

        function vinth2p (
                datai      : numeric,
                hbcofa [*] : numeric,
                hbcofb [*] : numeric,
                plevo  [*] : numeric,
                psfc       : numeric,
                intyp  [1] : integer,
                p0     [1] : numeric,
                ii     [1] : integer,
                kxtrp  [1] : logical
        )

        return_val  :  numeric

Arguments

   datai

   An array of 3, 4, or 5 dimensions. Needs to contain a level dimension
   in hybrid coordinates. The order of the dimensions is specific. The
   three rightmost dimensions must be level x lat x lon [e.g.
   T(time,lev,lat,lon)]. The order of the level dimension must be
   top-to-bottom.

   Note: the ability to handle 5 dimensions was added in version a034. An
   example would be T(case,time,lev,lat,lon).
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

   A one-dimensional array of output pressure levels in mb.
   psfc

   A multi-dimensional array of surface pressures in Pa. Must have the
   same dimension sizes as the corresponding dimensions of datai (minus
   the level dimension).
   intyp

   Scalar integer value equal to the interpolation type: 1 = LINEAR, 2 =
   LOG, 3 = LOG LOG
   p0

   Scalar numeric value equal to surface reference pressure in mb.
   ii

   Not used at this time. Set to 1.
   kxtrp

   Logical. False => no extrapolation when the pressure level is outside
   of the range of psfc.

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

   This is the exact routine used within the CESM Processor. The mixture
   of Pa for psfc and mb for plevo and p0 is specified by the source
   routine.

See Also

   Use the vinth2p_ecmwf for the extrapolation of temperature and
   geopotential below ground.

Examples

   CESM1.0 output files in CCM History Tape (CCMHT) format. These files
   may be read into NCL directly using addfile with a ".ccm" extension.
   Alternatively, these files may be converted to netCDF using ccm2nc The
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

   Example 1

   The models which produce files in CCM History Tape format write the
   variables in the following order ([time],lat,lev,lon). This example has
   no time dimension. vinth2p requires either the level dimension to be
   the slowest varying (leftmost) dimension or time as the slowest
   followed by level. Thus, the following example uses dimension
   reordering to put the dimensions into the required order. The surface
   pressure (PS) has two dimensions (lat,lon). This example explicitly
   reads all the required variables to memory and reorders the dimensions
   of the input at the time the function is invoked. Tnew is a 3D array
   returned by vinth2p with the same size as T except that the level
   dimension has been replaced by the size of pnew.
  fccm = addfile ("dummy.ccm" , "r")  ; a CCM file
  pnew = (/ 850.0,200.0 /)            ; desired output levels [hPa/mb]
  hyam = fccm->hyam                   ; read to memory [optional]
  hybm = fccm->hybm
  T    = fccm->T                      ; say "T" is (lat,lev,lon)
  P0mb = 1000.                        ; reference pressure [mb]

  Tnew = vinth2p (T(lev|:,lat|:,lon|:),hyam,hybm,pnew,fccm->PS,1,P0mb,1,True)

   Example 2

   Let's assume that the above file had been converted to netCDF format
   via ccm2nc with the following dimension order (lev,lat,lon). In this
   case, the dimension order is correct. Also, the reference pressure P0
   has been added to the file so it may be retrieved directly.
  fncf = addfile ("dummy.nc" , "r")  ; a CCM file converted to netCDF via ccm2nc

  P0mb = 0.01*fncf->P0               ; change Pa to mb (as required)
        .
        .
        .
  Tnew = vinth2p(T,hyam,hybm,pnew,fncf->PS,1,P0mb,1,True)

   Example 3

   A variable with a time dimension is read in directly from a CCMHT
   formatted file. Each variable's dimension order is (time,lat,lev,lon).
   Only those variables with four dimensions are to be interpolated to the
   specified pressure levels. The output is dimension order is to be
   (time,lev_new,lat,lon). Also demonstrated is the technique to name a
   dimension and transfer appropriate coordinate variables to that named
   dimension.
  fccm = addfile ("dummy.ccm" , "r")  ; a CCM file
  pnew = (/ 850., 500., 200. /)       ; desired output levels
  hyam = fccm->hyam                   ; read to memory (optional)
  hybm = fccm->hybm
  time = fccm->time
  P0mb = 1000.                        ; reference pressure [mb]

  vname= getfilevarnames(fccm)  ; get all variable names on input file
  lev_new   = pnew                    ; create a new coordinate variable
  lev_new!0 = "lev_new"               ; variable and dimension name the same

  do i=0,dimsizes(vnames)-1
    dims  = getfilevardims(fccm,vname(i))
    nrank = dimsizes(dims)      ; determine the number of dimensions
    if (nrank.eq.4) then             ; only interp 4D variables
      Vold = fccm->$vname(i)$        ; read each variable to memory
                                     ; (faster dimension reordering)

      Vnew = vinth2p(Vold(time|:,lev|:,lat|:,lon|:),hyam,hybm,pnew,fccm->PS,\
                      1,P0,1,True)
    end if
;     do something with Vnew
  end do

   Example 4

   In this example, no dimension reordering is required.
  fncf = addfile ("dummy.nc" , "r")
  hyam = fccm->hyam                   ; read to memory (optional)
  hybm = fccm->hybm

  [snip]

  Vold = fncf->$vname(i)$      ; read to memory [could be large]
  Vnew = vinth2p(Vold,hyam, hybm, pnew ,fncf->PS, 1    \
                 ,P0mb, 1, True)

   or
  Vnew = vinth2p(fncf->$vname(i)$,hyam, hybm, plev ,fncf->PS, 1    \
                 ,P0mb, 1, True)

   Example 5

   Let x(time,lev,lat,lon) be a variable from a model in which the level
   coordinate is in sigma levels but is in the correct top-to-bottom
   order:
; vinth2p requires the lev_p to be expressed in mb [hPa]
  lev_p           = (/  10, 20, 30, 50, 70,100,150,200,250 \
                     , 300,400,500,600,700,850,925,1000 /)
  lev_p!0         = "lev_p"                  ; variable/dim name
  lev_p&lev_p     =  lev_p                   ; create coordinate variable
  lev_p@long_name = "pressure"               ; attach some attributes
  lev_p@units     = "hPa"
  lev_p@positive  = "down"

  hybm            = f->sigma
  hyam            = hybm            ; create a bogus hyam 1D array
  hyam            = 0.0             ; set all values to zero

  P0mb            = f->P0*0.01
  ps              = f->ps           ; these are in Pa
  x               = f->X

  xp   = vinth2p(x, hyam, hybm, lev_p, ps, intyp, P0mb, 1, False )


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

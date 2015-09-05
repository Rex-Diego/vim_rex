THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/vinth2p_ecmwf_nodes.shtml
THE_TITLE:vinth2p_ecmwf_nodes
   NCL Home > Documentation > Functions > CESM

vinth2p_ecmwf_nodes

   Interpolates CESM hybrid coordinates to pressure coordinates but uses
   an ECMWF formulation to extrapolate values below ground.

Prototype

        function vinth2p_ecmwf_nodes (
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

   An array of 2, 3 or 4 dimensions. Needs to contain a level dimension in
   hybrid coordinates. The order of the dimensions is specific. The two
   right-most dimensions must be level,nodes [e.g. TS(time,lev,nodes) or
   TS(case,time,lev,nodes]. The order of the level dimension must be
   top-to-bottom.

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

   Example 1 Use the ECMWF formulation to extrapolate below ground. The
   syntax T(:,nlev-1,:,:) extracts the temperatures from the lowest hybrid
   level of the model. tbot is a 3D array dimensioned(time,lat,lon).

   The copy_VarAtts which is located in "contributed.ncl" can be used to
   copy attributes.

  f    = addfile("MRWB4N6_R2B04L19_0001.nc", "r" )

  psfc = f->PS                  ; (time,cell)
  hyam = f->hyam                ; hybrid coef
  hybm = f->hybm
  hyam = hyam/sum(hyam)         ; normalize so they look like CAM

  T    = f->T                   ; (time,lev,cell)
  printVarSummary(T)            ; [mlev | 19] x [cell | 20480]
  printMinMax(T, True)

  phis = f->PHIS
  tbot = f->T(:,18,:)           ; temperature at lowest model level
                                ; (use ground temperature if available)

  plevo = (/1000,950,900,850,700,500,250,100,50/)
  plevo@units = "hPa"
  plevo!0     = "plevo"

  P0mb  = 1000.
  intyp = 1                     ; 1=linear, 2=log, 3=log-log
  kxtrp = True                  ; True=extrapolate

  varflg= 1                     ; temperature is variable
  Tp    = vinth2p_ecmwf_nodes(T,hyam,hybm,plevo,psfc,intyp,P0mb, \
                              1,kxtrp,varflg,tbot,phis)
  copy_VarAtts(T, Tp)          ; copy attributes
  printVarSummary(Tp)
  printMinMax(Tp, True)

  varflg= -1                    ; geo pot hgt is variable [tbot is used]
  Z     = f->Z3
  Zp    = vinth2p_ecmwf_nodes(Z,hyam,hybm,plevo,psfc,intyp,P0mb, \
                              1,kxtrp,varflg,tbot,phis)
  copy_VarAtts(Z, Zp)          ; copy attributes
  printVarSummary(Zp)
  printMinMax(Zp, True)

  varflg= 0                     ; not T or Z
  U     = f->U
  Up    = vinth2p_ecmwf_nodes(U,hyam,hybm,plevo,psfc,intyp,P0mb, \
                              1,kxtrp,varflg,tbot,phis)
  copy_VarAtts(U, Up)          ; copy attributes
  printVarSummary(Up)
  printMinMax(Up, True)
end


   The output is:

Variable: T
Type: float
Total Size: 32686080 bytes
            8171520 values
Number of Dimensions: 3
Dimensions and sizes:   [time | 21] x [mlev | 19] x [cell | 20480]
Coordinates:
            time: [20080901..20080911]
            mlev: [1..19]
Number Of Attributes: 5
  long_name :   temperature
  units :       K
  code :        130
  grid_type :   cell
  coordinates : clon clat
(0)
(0)     temperature: min=269.677   max=303.567


Variable: Tp
Type: float
Total Size: 15482880 bytes
            3870720 values
Number of Dimensions: 3
Dimensions and sizes:   [time | 21] x [plevo | 9] x [cell | 20480]
Coordinates:
            time: [20080901..20080911]
            plevo: [1000..50]
Number Of Attributes: 6
  coordinates : clon clat
  grid_type :   cell
  code :        130
  units :       K
  long_name :   temperature
  _FillValue :  -9999
(0)
(0)     temperature: min=272.196   max=305.252


Variable: Zp
Type: float
Total Size: 15482880 bytes
            3870720 values
Number of Dimensions: 3
Dimensions and sizes:   [time | 21] x [plevo | 9] x [cell | 20480]
Coordinates:
            time: [20080901..20080911]
            plevo: [1000..50]
Number Of Attributes: 6
  coordinates : clon clat
  grid_type :   cell
  code :        156
  units :       gpm
  long_name :   geopotential height
  _FillValue :  -9999
(0)
(0)     geopotential height: min=-1930.14   max=22530.8


Variable: Up
Type: float
Total Size: 15482880 bytes
            3870720 values
Number of Dimensions: 3
Dimensions and sizes:   [time | 21] x [plevo | 9] x [cell | 20480]
Coordinates:
            time: [20080901..20080911]
            plevo: [1000..50]
Number Of Attributes: 6
  coordinates : clon clat
  grid_type :   cell
  code :        131
  units :       m/s
  long_name :   zonal wind
  _FillValue :  -9999
(0)
(0)     zonal wind: min=-15.3931   max=45.1191


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

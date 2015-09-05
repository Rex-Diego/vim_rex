THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/vinth2p_nodes.shtml
THE_TITLE:vinth2p_nodes
   NCL Home > Documentation > Functions > CESM

vinth2p_nodes

   Interpolates CESM hybrid coordinates to pressure coordinates on an
   unstructured grid.

Prototype

        function vinth2p_nodes (
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

   An array of 2, 3, or 4 dimensions. Needs to contain a level dimension
   in hybrid coordinates. The order of the dimensions is specific. The two
   rightmost dimensions must be level x nodes [e.g. T(time,lev,nodes)].
   The order of the level dimension must be top-to-bottom.

   hbcofa

   A one-dimensional array containing the hybrid A coefficients. Must have
   the same dimension as the level dimension of datai. The order must be
   top-to-bottom. Note: These are expected to be normalized to one (1.0).
   If not, divide by P0.
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

   Interpolates hybrid coordinates to pressure coordinates. The type of
   interpolation is currently a variant of transformed pressure
   coordinates with the interpolation type specified by intyp. All hybrid
   coordinate values are transformed to pressure values. If datai is on
   midlevels (interfaces), then hyam/hybm (hyai/hybi) coefficients should
   be input.

   This is the exact routine used within the original CESM Processor. The
   mixture of Pa for psfc and mb for plevo and p0 is specified by the
   source routine.

See Also

   Use the vinth2p_ecmwf_nodes for the extrapolation of temperature and
   geopotential below ground.

Examples

   Example 1

   The following required that the hyam be normalized to one. Here, the
   "cell" is the same as a "node". The copy_VarAtts which is located in
   "contributed.ncl" can be used to copy attributes.
  f    = addfile("MRWB4N6_R2B04L19_0001.nc", "r" )

  psfc = f->PS                  ; (time,cell)
  hyam = f->hyam                ; hybrid coef: mlev(19)
  hybm = f->hybm

  hyam = hyam/sum(hyam)         ; normalize so they look like CAM

  T    = f->T                   ; (time,lev,cell)
  printVarSummary(T)            ; [mlev | 19] x [cell | 20480]
  printMinMax(T, True)

; interpolate from model hybrid levels to pressure levels

  plevo = (/850,700,500,250,100,50/)
  plevo@units = "hPa"
  plevo!0     = "plevo"

  P0mb = 1000.                  ; reference pressure [mb]

  Tp   = vinth2p_nodes (T,hyam,hybm,plevo,psfc,1,P0mb,1,True)
  copy_VarAtts(T, Tp)      ; copy attributes
  printVarSummary(Tp)
  printMinMax(Tp, True)


   The resulting output looked like:


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
Total Size: 10321920 bytes
            2580480 values
Number of Dimensions: 3
Dimensions and sizes:   [time | 21] x [plevo | 6] x [cell | 20480]
Coordinates:
            time: [20080901..20080911]
            plevo: [850..50]

Number Of Attributes: 6
  coordinates : clon clat
  grid_type :   cell
  code :        130
  units :       K
  long_name :   temperature
  _FillValue :  -9999
(0)
(0)     temperature: min=265.112   max=300.88


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

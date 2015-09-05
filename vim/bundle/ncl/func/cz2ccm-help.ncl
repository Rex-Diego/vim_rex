THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cz2ccm.shtml
THE_TITLE:cz2ccm
   NCL Home > Documentation > Functions > CESM

cz2ccm

   Computes geopotential height in hybrid coordinates.

Prototype

        function cz2ccm (
                ps       : numeric,
                phis     : numeric,
                tv       : numeric,
                p0   [1] : numeric,
                hyam [*] : numeric,
                hybm [*] : numeric,
                hyai [*] : numeric,
                hybi [*] : numeric
        )

        return_val [dimsizes(tv)] :  numeric

Arguments

   ps

   A multi-dimensional array equal to the surface pressure in Pa. The
   rightmost two dimensions must be lat and lon.
   phis

   A two- or three-dimensional array or scalar value equal to the surface
   geopotential in m^2/s^2. The two rightmost dimensions must be the same
   as the the two rightmost dimensions of tv
   tv

   A multi-dimensional array or scalar value equal to the virtual
   temperature. The data must be ordered top-to-bottom. The rightmost
   three dimensions must level, lat, and lon.
   p0

   A scalar value equal to the hybrid base pressure in Pa. If not
   available, use 100000.
   hyam

   A one-dimensional array of hybrid coordinate coefficients for base
   pressures (layer midpoints) ordered bottom-to-top.
   hybm

   A one-dimensional array of hybrid coordinate coefficients for surface
   pressures (layer midpoints) ordered bottom-to-top.
   hyai

   A one-dimensional array of hybrid A coefficients (layer interfaces)
   ordered bottom-to-top.
   hybi

   A one-dimensional array of hybrid B coefficients (layer interfaces)
   ordered bottom-to-top.

Return value

   A multi-dimensional array of the same size as tv. The data will be
   ordered from top-to-bottom. Double if ps and tv are double, float
   otherwise.

Description

   Computes geopotential height in hybrid coordinates. Missing values are
   not allowed. This is the exact routine used in the former Cray CESM
   Processor.

Examples

   Example 1

   This example reads two files. The first file contains information the
   second file does not contain. The second file contains daily means of
   numerous variables for one month (30 time steps). The temperature (T)
   and specific humidities (Q) are read directly from the file and are
   used to calculate the virtual temperature. Note that the order of the
   hybrid coordinates has been temporarily reversed [(::-1)] to match the
   input requirements.
begin

  diri    = "/fs/scd/home1/shea/ncldata_input/"
  filphis = "01-50.nc"                       ; file with PHIS field
  f       = addfile (diri+filphis+".nc" , "r")
                                          ; strip off various fields
  phis    = f->PHIS                       ; read PHIS to memory
  lat     = f->lat
  lon     = f->lon
  lev     = f->lev
  ilev    = f->ilev
  hyam    = f->hyam
  hybm    = f->hybm
  hyai    = f->hyai
  hybi    = f->hybi

  fili    = (/ "ha0001.nc" /)
  f       = addfile (diri+fili , "r") ; daily files

  ps    = f->PS                       ; get sfc pres
  tv    = f->T*(1.+0.61*f->Q)         ; calculate virtual temperature
  p0    = f->P0                       ; get constant

                                      ; calculate z2 at all 30 time steps
  z2 = cz2ccm(ps,phis,tv,p0,hyam(::-1),hybm(::-1),hyai(::-1),hybi(::-1))

end

   Example 2

   Convert the output from example 1 to pressure levels.
begin

  [snip part one above]

  fili    = (/ "ha0001.nc" /)
  f       = addfile (diri+fili , "r") ; daily files

  ps      = f->PS                     ; get sfc pres
  tv      = f->T*(1.+0.61*f->Q)       ; calculate virtual temperature
  p0      = f->P0                     ; get constant

                                      ; calculate Z2 at all 30 time steps
  Z2 = cz2ccm(ps,phis,tv,p0,hyam(::-1),hybm(::-1),hyai(::-1),hybi(::-1))

  pnew = (/ 850., 500., 200.  /)      ; desired output levels [mb]
  knew = dimsizes(pnew)
  P0mb = 1000.                        ; reference pressure [mb]

  Znew = vinth2p(Z2,hyam,hybm,pnew,ps,1,P0mb,2,True)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

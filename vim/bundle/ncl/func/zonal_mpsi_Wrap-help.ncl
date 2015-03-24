THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/zonal_mpsi_Wrap.shtml
THE_TITLE:zonal_mpsi_Wrap
   NCL Home > Documentation > Functions > Meteorology

zonal_mpsi_Wrap

   Computes a zonal mean meridional stream function and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function zonal_mpsi_Wrap (
                v       : numeric,
                lat [*] : numeric,
                p   [*] : numeric,
                ps      : numeric
        )

        return_val [(time),lev,lat] :  numeric

Arguments

   v

   A multi-dimensional array of meridional wind values in which the
   rightmost three dimensions must be level, latitude, longitude e.g.
   [v(lev,lat,lon), v(time,lev,lat,lon)]. Units must be m/s. The level
   dimension must be ordered top-to-bottom.
   lat

   A one-dimensional array of latitudes. The size must be the same as the
   corresponding dimension of v.
   p

   A one-dimensional array of pressure level values ordered top-to-bottom.
   The size must be the same as the corresponding dimension of v. The
   units must be in Pa. The first value must be greater than 500 Pa (5mb),
   and the last value must be less than 100500 Pa (1005mb). (e.e. 500 <
   p(0) < p(1) < ... < 100500.)
   ps

   A multi-dimensional numeric array of surface pressures. The size must
   be the same as the corresponding dimensions of v. Usually ps
   corresponds with v in all but the level dimension. Units must be Pa.

Return value

   A multi-dimensional numeric array in which the rightmost two dimensions
   are level and latitude. The level dimension is ordered top-to-bottom.
   Missing values (return_val@_FillValue) are assigned to where v occurs
   below ground. Units are kg/s.

Description

   Computes a zonal mean meridional stream function using a modified
   definition of the CESM Processor zonal mean meridional stream function.
   The modified definition used is given by:
                                            / PS
                                            |
                            2 pi a cos(lat) |
   ZONAL_MPSI(lev,lat)  =   --------------- |  V(lev,lat) dp
                                  g         |
                                            |
                                            / p

   where V is the zonal mean meridional wind (calculated internally using
   the input variable v), p pressure, PS surface pressure, a the radius of
   the earth, and g the acceleration of gravity.
Buja, L. E. (1994)
CCM Processor User's Guide(Unicos Version).
NCAR Technical Note NCAR/TN-384+IA,
pages B-17 to B-18.

   This function is identical to the built-in function zonal_mpsi except
   it retains metadata.

Examples

   Example 1

   Let v be an array with dimension lev, lat, and lon. lat and p are
   one-dimensional arrays with dimensions lat and lev respectively. ps is
   a two-dimensional array with dimensions lat and lon. The level
   dimensions of p and v are ordered top-to-bottom (i.e. p(0) < p(1) <
   p(2) ...). The units of p and ps must be Pascals. (If they are
   millibars, multiply by 100.)
    zmpsi = zonal_mpsi_Wrap(v,lat,p,ps)
;   returns zmpsi(klev,nlat)

   if v has coordinate variables and they are in the correct order, then
   the one-dimensional coordinate arrays associated with v can be accessed
   directly using the & operator:
    zmpsi = zonal_mpsi_Wrap(v,v&lat,v&lev,ps)

   if v has coordinate variables but they are in the incorrect order (e.g.
   bottom-to-top), then they can be accessed directly and reordered within
   the function call:
    zmpsi = zonal_mpsi_Wrap(v(::-1,:,:),v&lat,v&lev(::-1),ps)

   Example 2

   Now v has a time dimension. All other variables are the same as example
   1.
    zmpsi = zonal_mpsi_Wrap(v,lat,p,ps)
;   returns zmpsi(ntim,klev,nlat)

   Example 3

   Here the v and p are ordered bottom-to-top and require reordering.
   Additionally, p and ps are in mb and must be converted to Pa.
    vt2b  = v(:,::-1,:,:)    ; reverse the "lev" order to top-to-bottom
    pPa   = p(::-1)*100.     ; reverse and make Pa
    psPa  = ps*100.          ; make Pa
    zmpsi = zonal_mpsi_Wrap(vt2b,lat,pPa,psPa)   ; zmpsi(ntim,klev,nlat)

   Alternatively, the required conversions could be invoked directly in
   the function.
    zmpsi = zonal_mpsi_Wrap(v(:,::-1,:,:),lat,p(::-1)*100.,ps*100.)

   Example 4

   The level dimension of v is in hybrid coordinates and must be converted
   to pressure coordinates before calling zonal_mpsi_Wrap. The order of
   the level dimension is correct.
; vinth2p requires the lev_p to be expressed in mb [hPa]
  lev_p           = (/  10, 20, 30, 50, 70,100,150,200,250
                     , 300,400,500,600,700,850,925,1000 /)
  lev_p!0         = "lev_p"                  ; variable/dim name
  lev_p&lev_p     =  lev_p                   ; create coordinate variable
  lev_p@long_name = "pressure"               ; attach some attributes
  lev_p@units     = "hPa"
  lev_p@positive  = "down"

  hyam            = f->hyam         ; read from file
  hybm            = f->hybm
  P0mb            = f->P0*0.01
  ps              = f->ps           ; these are in Pa
  v               = f->V
; convert to pressure levels
  vp   = vinth2p(v,hyam,hybm,lev_p,ps,intyp,P0mb,1,False)
; calculate zonal meridional streamfunction
  zmpsi = zonal_mpsi_Wrap(vp,lat,lev_p*100.,ps)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

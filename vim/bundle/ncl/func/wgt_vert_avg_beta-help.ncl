THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wgt_vert_avg_beta.shtml
THE_TITLE:wgt_vert_avg_beta
   NCL Home > Documentation > Functions > CESM

wgt_vert_avg_beta

   Computes weighted vertical average or sum using pressure thickness and
   beta factors.

Prototype

        function wgt_vert_avg_beta (
                p          : numeric,
                datai      : numeric,
                psfc       : numeric,
                punits [1] : integer,
                opt        : integer
        )

        return_val  :  numeric

Arguments

   p

   An array containing the pressure levels. If it is a one-dimensional
   array then the same pressure levels will be used for all the levels of
   datai. If it is a multidimensional array then it must have the same
   dimension sizes and order as datai. The order of the level dimension
   (top-to-bottom or bottom-to-top) must be consistent with the order of
   datai.
   datai

   An array of 3 or 4 dimensions. The order of the dimensions is specific.
   The three rightmost dimensions must be level x lat x lon [e.g.
   T(level,lat,lon) or T(time,level,lat,lon)]. The order of the level
   dimension (top-to-bottom or bottom-to-top) must be consistent with the
   order of p.
   psfc

   A multi-dimensional array of surface pressures. It has the same
   dimensions as datai except it does not have a level dimension. [ie:
   psfc(lat,lon) or psfc(time,lat,lon)]
   punits

   A scalar value indicating the units of p and psfc: punits=0 indicates
   hPa or mb; punits=1 indicates Pa.
   opt

   Two options:

   A scalar indicating whether the pressure-thickness weighted vertical
   sum (opt=0) or pressure-thickness weighted average (opt=1) should be
   returned.

   A one dimensional array of length 3: opt(0)=0 or opt(0)=1 indicates
   what will be returned; opt(1) and opt(2) user specified pressures
   indicating that only a subset of the input pressures should be used.
   Same pressure units as p and psfc.

Return value

   If datai is (level,lat,lon) the returned array will be of size
   (lat,lon); If datai is (time,level,lat,lon) the returned array will be
   of size (time,lat,lon).

   The type of the output data will be double only if psfc or datai are of
   type double. Otherwise, the return type will be float.

Description

   This function uses pressure thickness (delp) and beta factors (beta) to
   compute a weighted vertical average (wva) or sum (wvs) at each grid
   point. Let x = datai(n,:,j,i)
      wvs = SUM [x*delp*beta]       [opt=0]

      wva = wvs/SUM [delp*beta]     [opt=1]

   The units returned when [opt=0] will be the units of datai times the
   units of [p]. The units returned when [opt=1] will be the same units as
   datai.
-------------------------------------------------------------------
Reference:
Climate Diagnostics from Global Analyses: Conservation of Mass ....
Kevin Trenberth
July, 1991,  pp 707-
-------------------------------------------------------------------

See Also

   vibeta

Examples

   Example 1:

   Let T(time,lev_p,lat,lon) and ps(time,lat,lon) [units: hPa] where:
   lev_p = (/  1,   2,   3,   5,   7,  10,  20,  30\
            , 50,  70, 100, 150, 200, 250, 300, 400\
            ,500, 600, 700, 775, 850, 925,1000     /)
                                              ; the following is not necessary
:-)
   lev_p!0         = "lev_p"                  ; variable/dim name
   lev_p&lev_p     =  lev_p                   ; create coordinate variable
   lev_p@long_name = "pressure"               ; attach some attributes
   lev_p@units     = "hPa"                    ; punits=0
   lev_p@positive  = "down"

   Then to compute the vertical average T:
      T_wva = wgt_vert_avg_beta(lev_p, T, PS, 0, 0)     ; T_wva(time,lat,lon)

   Note that if lev_p had been a coordinate variable associated with the
   variabe T, then the following could be used:
      T_wva = wgt_vert_avg_beta(T&lev_p, T, PS, 0, 0)     ; T_wva(time,lat,lon)

   Example 2:

   Same as Example 1 but calculate the weighted vertical average between
   (a) 10 and 100 and (b) 650 and 900 only.
      opt = (/ 0, 10, 100 /)
      T_wva_10_100  = wgt_vert_avg_beta(lev_p, T, PS, 0, opt)
snd
      opt = (/ 0, 650, 900 /)
      T_wva_650_900 = wgt_vert_avg_beta(lev_p, T, PS, 0, opt)

   Example 3:

   Let T(time,lev,lat,lon) and PS(time,lat,lon)
   f    = addfile("ccm.nc", "r")
   hyam = f->hyam
   hybm = f->hybm
   P0   = 100000.                        ; reference pressure [Pa]
   PS   = f->PS                          ; Pa  [punits=1]
   T    = f->T

   pm   = pres_hybrid_ccm(PS,P0,hyam,hybm)    ; ps(time,lev,lat,lon) [Pa]

   T_wva = wgt_vert_avg_beta(pm, T, PS, 1, 0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dpres_hybrid_ccm.shtml
THE_TITLE:dpres_hybrid_ccm
   NCL Home > Documentation > Functions > unknown

dpres_hybrid_ccm

   Calculates the pressure differences of a hybrid coordinate system.

Prototype

        function dpres_hybrid_ccm (
                ps      : numeric,
                p0  [1] : numeric,
                hya [*] : numeric,
                hyb [*] : numeric
        )

        return_val  :  numeric

Arguments

   ps

   An array of at least 2 dimensions equal to surface pressure data in Pa
   or hPa (mb). The rightmost dimensions must be latitude and longitude.
   p0

   A scalar value equal to the surface reference pressure. Must have the
   same units as ps.
   hya

   A one-dimensional array equal to the hybrid A coefficients. Usually,
   the "interface" coefficients are input.
   hyb

   A one-dimensional array equal to the hybrid B coefficients. Usually,
   the "interface" coefficients are input.

Return value

   If ps is two-dimensional [e.g. (lat,lon)] or three-dimensional [e.g.
   (time,lat,lon)] then the return array will have an additional level
   dimension: (lev,lat,lon) or (time,lev,lat,lon). The size of the lev
   dimension is one less then the size of hya. The returned type will be
   double if ps is double, float otherwise.

Description

   Calculates the pressure differences of a hybrid coordinate system. This
   equates to the absolute value of the pressure difference between
   adjacent hybrid levels at each grid point. Replaces a deprecated
   function called dpres_hybrid.

See Also

   dpres_plevel

Examples

   Example 1

   hyai and hybi are one-dimensional arrays of length klvl, ps is a
   three-dimensional array of size (ntim,nlat,nlon) in units of pascals.
   The returned array is four-dimensional with dimension sizes
   (ntim,klvl-1,nlat,mlon).

  hyai = f->hyai ; read from a file the interface hybrid coefficients
  hybi = f->hybi ; read from a file
  ps   = f->PS   ; surface pressure [Pa]
  p0   = 100000. ; since ps is in Pa

  dph = dpres_hybrid_ccm(ps,p0,hyai,hybi)

   Example 2

   The same as example 1, but calculated in a loop. At each iteration the
   returned variable, dph, will be size (klvl-1,nlat,mlon)
  do nt=0,ntim-1
     dph = dpres_hybrid_ccm(ps(nt,:,:),p0,hyai,hybi)
  end do

   Example 3

   Perform vertical integration of T to determine the internal energy.
   Note that dimension reordering is used to make "lev" the rightmost
   dimension.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

  f = addfile("....", "r")
  hyai = f->hyai
  hybi = f->hybi
  p0   = f->P0
  ps   = f->PS

  dp   = dpres_hybrid_ccm (ps,p0,hyai,hybi)  ; Pa [kg/(m s2)]

  T    = f->T                                ; K  (time,lev,lat,lon)
  cp   = 1004.                               ; J/(K kg)     [ m2/(K s2) ]
  g    = 9.81                                ; m/s

  Tdp  = T*dp                                ; [K kg/(m s2)]   (temporary variab
le)
  copy_VarCoords(T, Tdp)
                   ; vertical sum [ie integrate]
                   ; must make "lev" rightmost dimension
;;IE   = dim_sum_Wrap( Tdp(time|:,lat|:,lon|:,lev|:) ; pre 5.1.1
  IE   = dim_sum_n_Wrap( Tdp, 1)
                   ; Internal Energy (time,lat,lon)
  IE   = cp*Tint/g                         ; kg/s2
  IE@long_name = "Vertically Integrated Internal Energy"
  IE@units     = "kg/s2"

;;IE_tavg = dim_avg_Wrap( IE(lat|:,lon|:,time|:))   ; pre 5.1.1
  IE_tavg = dim_avg_n_Wrap( IE, 0)
  IE@long_name = "Time Average: Vertically Integrated Internal Energy"

  printVarSummary(IE)
  printMinMax(IE, True)
  printVarSummary(IE_tavg)
  printMinMax(IE_tavg, True)

  delete(Tdp)    ; no longer needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

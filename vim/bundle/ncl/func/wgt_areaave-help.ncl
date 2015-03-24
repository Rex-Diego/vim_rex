THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wgt_areaave.shtml
THE_TITLE:wgt_areaave
   NCL Home > Documentation > Functions > General applied math

wgt_areaave

   Calculates the area average of a quantity using weights.

Prototype

        function wgt_areaave (
                q        : numeric,
                wgty [*] : numeric,
                wgtx [*] : numeric,
                opt      : integer
        )

        return_val  :  float or double

Arguments

   q

   An array of 2 or more dimensions containing the data to be averaged.
   The rightmost dimensions should correspond to "latitude" (lat) and
   "longitude" (lon) when dealing with quantities on a sphere
   ([...,],lat,lon), and "y" and "x" otherwise ([...,],y,x).
   wgty

   A scalar (typically 1.0) or singly dimensioned array of size "lat" (y)
   containing the weights.
   wgtx

   A scalar (typically 1.0) or singly dimensioned array of size "lon" (x)
   containing the weights.
   opt

   If opt = 0, the area average is calculated using available non-missing
   data. If opt = 1, then if any point in q is missing, the area average
   is not computed. In this case, it will be set to the missing value,
   which is indicated by q@_FillValue, or the default missing value if
   q@_FillValue is not set.

Return value

   Returns a scalar if q is a two dimensional array. Otherwise, the output
   dimensionality is the same as the leftmost n - 2 dimensions of the
   input.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function computes a weighted area average. It ignores missing
   values (q@_FillValue).

   If q has no missing values, wgt_areaave is equivalent to:
   q_ave = SUM[q*wgty*wgtx]/SUM[wgty*wgtx]

   If you wish to copy attributes and coordinate variables, use the
   corresponding wgt_areaave_Wrap function instead.

See Also

   wgt_areaave2 wgt_arearmse wgt_arearmse2 wgt_areasum2 wgt_runave
   wgt_volave wgt_volave_ccm wgt_volrmse wgt_volrmse_ccm

Examples

   Example 1

   Let u(lat, lon) be a global array with dimension sizes nlat = 64, mlon
   = 128; ,lat and lon contain longitudes and gaussian latitudes; and,
   gwgt contains the gaussian weights. Compute the area average using
   several weighting approaches: (a) explicitly use the area of each grid
   cell; (b) uses only gaussian weights; (c) use the cosine of the
   latitudes.
  lat   = f->lat
  lon   = f->lon
  gwgt  = f->gwgt

  jlat  = dimsizes( lat )

  rad    = 4.0*atan(1.0)/180.0
  re     = 6371220.0
  rr     = re*rad

  dlon   = abs(lon(2)-lon(1))*rr
  dx     = dlon*cos(lat*rad)
;                                     lat can have variable spacing
  dy     = new ( jlat, typeof(dx))
                                                            ; close enough
  dy(0)  = abs(lat(2)-lat(1))*rr
  dy(1:jlat-2)  = abs(lat(2:jlat-1)-lat(0:jlat-3))*rr*0.5
  dy(jlat-1)    = abs(lat(jlat-1)-lat(jlat-2))*rr

  area   = dx*dy                                ; cell area function of latitude
 only

  clat   = cos(lat*rad)

  uAve_area = wgt_areaave(u, area, 1.0, 1)
  uAve_gwgt = wgt_areaave(u, gwgt, 1.0, 1)
  uAve_clat = wgt_areaave(u, clat, 1.0, 1)
  print("uAve_area="+uAve_area+"   uAve_gwgt="+uAve_gwgt+"   uAve_clat="+uAve_cl
at)

   The results are:
    uAve_area=15.1826   uAve_gwgt=15.1828   uAve_clat=15.1818

   Example 2

   Let q(time, lev, lat, lon) be a global array with dimension sizes ktime
   = 120, nlev = 28, nlat = 64, mlon = 128 and wgty(nlat) be a
   1-dimensional array containing gaussian or cosine weights. Assume that
   no special weighting is applied in the longitude (x) direction. Then:
   glAve = wgt_areaave(q, wgty, 1.0, 1)   ; glAve(ktime, nlev)

   will calculate the area (global) average for each time and level. glAve
   will be a 2-dimensional array with dimensions (ktime, nlev) [(120,
   28)]. If a missing value is encountered at any of the two rightmost
   dimensions, then the result will be set to q@_FillValue (opt = 1).

   Example 3

   nhAve = wgt_areaave(q(:, :, 33:nlat-1, :), wgty(33:nlat), 1.0, 0)

   will calculate the area (northern hemisphere) average for each time and
   level. Standard subscripting is used to subset the input global array.
   nhAve will be a 2-dimensional array with dimensions (ktime, nlev)
   [(120, 28)]. If a missing value is encountered at any of the two
   rightmost dimensions, it is ignored (equivalent to a weight of 0.0) and
   the average is calculated using available non-missing data (opt = 0).

   Example 4

   shAve = wgt_areaave(q(:, 5:7, {-90:0}, :), wgty({-90:0}), 1.0, 0)

   will calculate the area (southern hemisphere) average for each time and
   only at levels = 5, 6, 7. Coordinate subscripting and standard
   subscripting are used to subset the input global array. shAve will have
   dimensions (ktime, 3).

   Example 5

   Compute area root-mean-square difference between two quantities. Let q
   and r (time, lev, lat, lon) be global arrays with dimension sizes ktime
   = 120, nlev = 28, nlat = 64, mlon = 128, and wgty(nlat) be a
   1-dimensional array containing gaussian or cosine weights. Assume that
   no special weighting is applied in the longitude (x) direction. Then:

   rmse = sqrt(wgt_areaave((q - r)², wgty², 1.0, 1) )  ; rmse(ktime, nlev)

   will calculate the area (global) root-mean-square-difference for each
   time and level. rmse will be a 2-dimensional array with dimensions
   (ktime, nlev) [(120, 28)]. If a missing value is encountered at any of
   the two rightmost dimensions, then the result will be set to
   q@_FillValue (opt = 1).

   Example 6

   Step-by-step illustration based on a user question. This illustrates
   that NCL array syntax must be aware of _FillValue.

  latt    = (/-90,-45,0,45,90/) ; dummy latitudes
  rad     = 4.*atan(1.)/180.    ;
  cost    = cos(latt*rad)       ; cosine weights

  ny      = 5
  mx      = 2
  x       = new((/ny,mx/),float)  ; dummy fields
  x(:,0)  = (/-99,1,1,1,-99/)   ; with FillValue
  x(:,1)  = (/-99,2,3,-99,-99/)
  x@_FillValue = -99

; function

  xave_a = wgt_areaave(x,cost,1.0,0)
  kmsg_a = num(ismissing(x))
  print("xave_a="+xave_a+"         kmsg_a="+kmsg_a)

; loop

  sumx  = 0.0
  sumw  = 0.0
  kmsg_b= 0
  do n=0,ny-1
    do m=0,mx-1
       if (.not.ismissing(x(n,m))) then
           sumx = sumx + x(n,m)*cost(n)
           sumw = sumw + cost(n)
       else
           kmsg_b = kmsg_b + 1
       end if
    end do
  end do

  xave_b = sumx/sumw
  print("xave_b="+xave_b+"         kmsg_b="+kmsg_b)

; Use calc as stated on http://www.ncl.ucar.edu/Document/Functions/Built-in/wgt_
areaave.shtml
; x_ave = sum(x*wgty*wgtx)/sum(wgty*wgtx)

  wgty  = conform(x,cost, 0)    ; (ny,mx)
  wgtx  = conform(x, 1  ,-1)    ; (ny,mx)

; NCL array computation

  x_ave = sum(x*wgty*wgtx)/sum(wgty*wgtx)
  print("[A] sum(x*wgty*wgtx)/sum(wgty*wgtx)="+x_ave+"     not correct")

; (wgty*wgtx) not aware of when x@_FillValue

  WGTX  = where(ismissing(x), 0.0, 1.0 )
  WGTY  = where(ismissing(x), 0.0, wgty)
  x_ave = sum(x*wgty*wgtx)/sum(WGTY*WGTX)
  print("[B] sum(x*wgty*wgtx)/sum(WGTY*WGTX)="+x_ave)

   Output
(0)     xave_a=1.65685         kmsg_a=5
(0)     xave_b=1.65685         kmsg_b=5
(0)     [A] sum(x*wgty*wgtx)/sum(wgty*wgtx)=1.41421     not correct
(0)     [B] sum(x*wgty*wgtx)/sum(WGTY*WGTX)=1.65685


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

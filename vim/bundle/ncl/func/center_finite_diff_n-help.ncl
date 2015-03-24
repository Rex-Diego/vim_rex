THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/center_finite_diff_n.shtml
THE_TITLE:center_finite_diff_n
   NCL Home > Documentation > Functions > General applied math

center_finite_diff_n

   Performs a centered finite difference operation on the given dimension.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function center_finite_diff_n (
                q        : numeric,
                r        : numeric,
                rCyclic  : logical,
                opt      : integer,
                dim  [1] : integer
        )

        return_val [dimsizes(q)] :  numeric

Arguments

   q

   A multi-dimensional array.
   r

   A scalar, one-dimensional, or multi-dimensional array containing the
   coordinates along which q is to be differenced. Does need not be
   equally spaced from a computational point of view.
     * scalar: r assumed to be the (constant) distance between adjacent
       points.
     * one-dimensional (and the same size as the dim-th dimension of q):
       applied to all dimensions of q.
     * multi-dimensional: then it must be the same size as q.

   rCyclic

   True: q treated as cyclic in r and the end values and all the returned
   values will be calculated via centered differences. False: q NOT
   treated as cyclic in r and the end values will use a one-sided
   difference scheme for the end points. q should not include a cyclic
   point.
   result(n) = (q(n+1)-q(n))/(r(n+1)-r(n))  for the initial value
   result(m) = (q(m)-q(m-1))/(r(m)-r(m-1))  for the last value

   opt

   Reserved for future use. Currently not used. Set to an integer.
   dim

   A scalar integer indicating which dimension of q to calculate the
   center finite difference on. Dimension numbering starts at 0.

Description

   Performs a centered finite difference operation on the dim-th
   dimension. If missing values are present, the calculation will occur at
   all points possible, but coordinates which could not be used will set
   to missing.
result(n) = (q(n+1)-q(n-1))/(r(n+1)-r(n-1))

See Also

   center_finite_diff

Examples

   Example 1

   q = (/30,33,39,36,41,37/)
   r = 2.                                 ; constant

   dqdr = center_finite_diff_n (q,r,False,0,0)

   Result:
   dqdr(0) = (33-30)/2 = 1.5
   dqdr(1) = (39-30)/4 = 2.25
   dqdr(2) = (36-33)/4 = 0.75
   dqdr(3) = (41-39)/4 = 0.5
   dqdr(4) = (37-36)/4 = 0.25
   dqdr(5) = (37-41)/2 = -2.0

   Example 2:

   theta = (/ 298,299,300,302,...,345,355,383/)   ; potential temp.
   p     = (/1000,950,900,850,...,200,150,100/)   ; pressure (hPa)

   dtdp  = center_finite_diff_n (theta,p,False,0,0)

   Example 3

   p is not equally spaced. Demonstrates defining the appropriate pressure
   levels when the r coordinate is not equally spaced. The end points are
   computed via a one-sided difference.
   theta = (/ 297, 298,300,302,...,345,350,355,383/)   ; potential temp.
   p     = (/1013,1000,900,850,...,200,175,150,100/)   ; pressure (hPa)

   dtdp  = center_finite_diff_n (theta,p,False,0,0)

   np    = dimsizes(p)
   pPlot = new ( np, "float" )
                                                       ; arithmetic mean
   pPlot(0)      = (p(0)+p(1))*0.5                     ; set bottom
   pPlot(np-1)   = (p(np-1)+p(np-2))*0.5               ; set top
   pPlot(1:np-2) = (p(0:np-3) + p(2:np-1))*0.5         ; mid points

; or
                                                              ; log (mass) wgted
   pPlot(0)      = exp((log(p(0))+log(p(1)))*0.5)             ; set bottom
   pPlot(np-1)   = exp((log(p(np-1))+log(p(np-2)))*0.5)       ; set top
   pPlot(1:np-2) = exp((log(p(0:np-3)) + log(p(2:np-1)))*0.5) ; mid points

   Example 4

   Let T be four-dimensional with dimensions time,level,lat,lon. P is
   one-dimensional. Perform the finite differencing only in the vertical
   (level) dimension.
   dTdP = center_finite_diff_n(T,P,False,0,1)
;  returns dTdP (time,lev,lat,lon).

   Example 5

   Now P is also four-dimensional:
   dTdP = center_finite_diff_n (T, P, False, 0, 1)
; returns dTdP(time,lev,lat,lon)

   Example 6 Assume that the longitude coordinate variable associated with
   T in the examples above is cyclic and is equally spaced in degrees but
   not in physical space.
   dlon = (lon(2)-lon(1))*0.0174533 ; convert to radians
                                    ; pre-allocate space
   dTdX = new ( (/ntim,klev,nlat,mlon/), typeof(T), T@_FillValue)

   do nl=0,nlat-1                      ; loop over each latitude
      dX = 6378388.*cos(0.0174533*lat(nl))*dlon  ; constant at this latitude
      dTdX(:,:,nl:nl,:) = center_finite_diff_n (T(:,:,nl:nl,:), dX , True,0,3)
  end do
; result: dTdX(time,lev,lat,lon)


   The reason for the nl:nl is to preserve the 4D structure of the array.

   A subtle issue with NCL is that it removes "degenerate dimensions." If
   we had used the following
      dTdX(:,:,nl,:) = center_finite_diff_n (T(:,:,nl,:), dX , True,0,2)

   The arrays are 'temporarily' reduced to 3D and the longitude dimension
   number is 2, not 3.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

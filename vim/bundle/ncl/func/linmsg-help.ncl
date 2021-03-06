THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/linmsg.shtml
THE_TITLE:linmsg
   NCL Home > Documentation > Functions > Interpolation

linmsg

   Linearly interpolates to fill in missing values.

Prototype

        function linmsg (
                x    : numeric,
                opt  : integer
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   An array of any dimensionality. Missing values should be indicated by
   x@_FillValue. If x@_FillValue is not set, then the NCL default
   appropriate to the type of x will be assumed. The fastest varying
   dimension (the rightmost dimension) is the dimension upon which the
   linear interpolation will be performed.
   opt

   A scalar or an array with two elements. The scalar or the first element
   of the array specifies how missing beginning and end points will be
   returned. If this value is greater than or equal to 0, then the
   beginning and end points will be returned as missing (most common
   option). If this value is less than 0, then they will be set to the
   nearest non-missing value.

   If opt has two elements, then the second value specifies the maximum
   number of consecutive missing values to be interpolated. If opt is a
   scalar then the routine will try to interpolate as many values as it
   can.

Description

   linmsg uses piecewise linear interpolation to fill in any missing
   values. End points which are missing on input may be returned as
   missing or set to the nearest non-missing value.

   Use linmsg_n if the dimension to do the interpolation across is not the
   rightmost dimension. This function can be significantly faster than
   linmsg.

See Also

   linmsg_n, linint1, linint2

Examples

   Example 1

   This example returns the interpolated values to the original
   one-dimensional array. (The default missing value for the input type
   will be used if no missing value is attached to the input array). The
   end points will be left as missing. Because the opt argument is a
   scalar, the routine will interpolate across all missing values:
begin

; Note: in Version 6.0.0, default missing will be 9.96921e+36, not -999.
 x = (/ 1190.,1455.,1550.,-999.,1745.,1770., \
        1900.,-999.,-999.,-999.,2335.,2490., \
        2720.,2710.,2530.,2900.,2760.,-999. /)

 x = linmsg(x,0)   ; endPoint= 0 missing end point(s) unaltered

end

   After interpolation, x contains:
     (/ 1190.,1455.  ,1550. ,1647.5 ,1745.,1770., \
        1900.,2008.75,2117.5,2226.25,2335.,2490., \
        2720.,2710.  ,2530. ,2900.  ,2760.,-999. /)

   Example 2

   This example returns the interpolated values to a new 1D array. The
   missing value has been specified by the user. The end points with
   missing values will be set to the nearest non-missing value. Because
   the opt argument is a scalar, the routine will interpolate across all
   missing values:
begin

 ymsg = 1.e10
 y = (/ 1115.,ymsg ,1515.,1794.,ymsg ,1710., \
        1830.,1920.,1970.,2300.,2280.,2520., \
        2630.,ymsg ,ymsg ,2800.,ymsg ,ymsg  /)
 y@_FillValue = ymsg

 ynew = linmsg(y,-1)  ; endPoint= -1 missing end point(s)
                      ;              set to nearest non-missing value
end

   After interpolation ynew contains:
     (/ 1115.,1315.,1515.,1795.,1752.,1710., \
        1830.,1920.,1970.,2300.,2280.,2520., \
        2630.,2686.67 ,2743.33 ,2800.,2800.,2800. /)

   Example 3

   Assume x is a 4-dimensional array with named dimensions "time", "lev",
   "lat", "lon", and sizes ntim x klev nlat x mlon. Assume that at random
   times all data are missing and x@_FillValue has been set to the missing
   value. Linearly interpolate in time to fill in the values. Use a
   temporary array for the interpolated values, then copy the interpolated
   values back to the original array.

   Make opt a two element array. The first element is set to 0 so that
   missing values at the beginning and end will be returned as missing.
   The second element is set to 5 meaning that the routine will not
   interpolate segments of the series where more than 5 consecutive values
   are encountered:
 opt = (/0, 5/)

 y = linmsg(x(lev|:,lat|:,lon|:,time|:), opt) ; y(klev,nlat,mlon,ntim)
                                              ; no metadata
 y!0 = "lev"
 y!1 = "lat"
 y!2 = "lon"
 y!3 = "time"
 x = (/ y(time|:,lev|:,lat|:,lon|:) /)    ; recreate the original array
                                          ; the(/ .. /) operators mean
                                          ; copy values only ... any "x"
                                          ; metadata is not destroyed.
 delete (y)

; In V5.2.0 or later, you can use linmsg_n to avoid reordering
; and reduce the above code to one line:
;  x = linmsg_n(x, opt, 0)

   Example 4

   This example is same as example 3, but uses traditional "do loops" so
   no rearranging of the array required. This is the approach used in C
   and Fortran codes. Be forewarned: this is extremely inefficient. NCL is
   an interpreted language and executes "do loops" very slowly. In a
   timing test with klev=1, nlat=64, mlon=128 and ntim=700, the following
   "do loop" approach took more than 25 minutes. However, using the
   (recommended) approach of example 3, the linear interpolation took just
   seconds.

   Moral: avoid do loops. See the section "Writing efficient NCL source"
   in the NCL reference manual.

 do kl=0,klev-1
  do nl=0,nlat-1
   do do ml=0,mlon-1
      x(:,kl,nl,ml) = linmsg(x(:,kl,nl,ml), 0)
   end do
  end do
 end do


   �2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

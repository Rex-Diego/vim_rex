THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/int2p.shtml
THE_TITLE:int2p
   NCL Home > Documentation > Functions > Interpolation

int2p

   Interpolates pressure levels to a different set of pressure levels.

Prototype

        function int2p (
                pin        : numeric,
                xin        : numeric,
                pout       : numeric,
                linlog [1] : integer
        )

        return_val  :  numeric

Arguments

   pin

   An array of any dimensionality containing input pressure levels. If
   multi-dimensional, the level dimension must be in the rightmost
   position and the values must be monotonically increasing or decreasing.
   xin

   An array of any dimensionality containing the data to be interpolated.
   If pin is multi-dimensional, then these two arrays have the same
   dimension sizes.
   pout

   An array of any dimensionality containing output pressure levels with
   values monotonically increasing or decreasing. If multi-dimensional,
   the level dimension must be in the rightmost dimension and all other
   dimensions must be the same as xin. If one-dimensional, then all of xin
   will be interpolated to the same levels. Must have the same units as
   pin.
   linlog

   A scalar integer indicating the type of interpolation:

   abs(linlog) == 1 --> linear interpolation
   abs(linlog) != 1 --> log interpolation

   If linlog is negative, then extrapolation to levels outside the range
   of pin will occur. Use extrapolation with caution.

Return value

   The returned array will have the same shape as xin but the rightmost
   dimension will have the sizes of the rightmost dimension of pout. The
   return type will be double if xinis double, float otherwise.

Description

   This function interpolates the values of the rightmost dimension of xin
   from one set of pressure levels to another set of pressure levels. The
   interpolation can be either linear or log. Extrapolation is optional.
   Missing values are allowed, but they are ignored.

   Use int2p_n if the level dimension is not the rightmost dimension and
   reordering is not desired. This function can be significantly faster
   than int2p.

   Use int2p_Wrap if retention of metadata is desired.

See Also

   int2p_n, int2p_Wrap, int2p_n_Wrap

Examples

   Example 1

  linlog = 2   ; ln(p) interpolation

  pi =(/ 1000.,925.,850.,700.,600.,500.,400.,300.,250., \
          200.,150.,100.,70.,50.,30.,20.,10. /)

  xi =(/ 28., 23., 18., 10.,  2., -4., -15.,-30.,-40., \
        -52.,-67.,-78.,-72.,-61.,-52.,-48.,-46. /)

  po =(/ 1000.,950.,900.,850.,800.,750.,700.,600.,500., \
          425.,400.,300.,250.,200.,100.,85.,70.,50.,40.,\
           30.,25.,20.,15.,10. /)


  xo = int2p (pi,xi,po,linlog)
; xo will contain (/ 28.,24.71,21.37,18. ,...., -48.,-47.17,-46./).

   Example 2

begin
  linlog = -1   ; linear interpolation and extrapolation

  pi = (/ 10., 20., 30., 50., 70.,100.,150.,200., \
         250.,300.,400.,500.,600.,700.,850.,925.,1000. /)

  xi =(/-46.,-48.,-52.,-61.,-72.,-78.,-67.,-52., \
        -40.,-30.,-15., -4.,  2., 10., 18., 23., 28. /)

  po =(/ 5., 7., \                    ; extrapolation
        10.,15.,20.,25.,30.,40.,50.,70.,85.,100.,200.,250.,300., \
        400.,425.,500.,600.,700.,750.,800. ,850.,900.,925.,1000., \
        1005.,1012. /)                ; extrapolation


  xo = int2p (pi,xi,po,linlog)
  xo = -45.,-45.4,-46.,-47. ,..., 21.33,23.,28.,28.33,28.8.
end

   Example 3

   Let p_out be four-dimensional with dimensions time, lat, lon,
   pout_level. Additionally, p_in and t_in are four-dimensional with
   dimensions time, lat, lon, pin_level. Linearly interpolate with
   extrapolation.
    linlog = -1
    t_out = int2p(p_in,t_in,p_out,linlog)
;   t_out is dimensioned time, lat, lon, pout_level

   Example 4

   Similar to example 3, but p_out is one-dimensional:
  t_out = int2p(p_in,t_in,p_out,linlog)
; t_out is interpolated to the uniform set of pressure levels represented by p_i
n

   Example 5

   Similar to example 3, but assume the input dimensions are time x level
   x lat x lon, and hence must be reordered.

   Note: in V5.2.0, you will be able to use int2p_n to avoid having to
   reorder your data.

; t_out will be dimensioned time, lat, lon, pout_level
  t_out = int2p(p_in(time|:,lat|:,lon|:,pin_lev|:), \
                                t_in(time|:,lat|:,lon|:,pin_lev|:), \
                                p_out(time|:,lat|:,lon|:,pout_lev|:), linlog)

; t_out_n will be dimensioned time, pout_level, lat, lon
  t_out_n = int2p_n(p_in, t_in, p_out, linlog, 1)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

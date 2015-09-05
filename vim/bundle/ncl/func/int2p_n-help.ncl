THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/int2p_n.shtml
THE_TITLE:int2p_n
   NCL Home > Documentation > Functions > Interpolation

int2p_n

   Interpolates pressure levels to a different set of pressure levels.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function int2p_n (
                pin        : numeric,
                xin        : numeric,
                pout       : numeric,
                linlog [1] : integer,
                pdim   [1] : integer
        )

        return_val  :  numeric

Arguments

   pin

   An array of any dimensionality containing input pressure levels. If
   multi-dimensional, the level dimension must be in the pdim-th position
   and the values must be monotonically increasing or decreasing.
   xin

   An array of any dimensionality containing the data to be interpolated.
   If pin is multi-dimensional, then these two arrays have the same
   dimension sizes. The level dimension must be in the pdim-th position.
   pout

   An array of any dimensionality containing output pressure levels with
   values monotonically increasing or decreasing. If multi-dimensional,
   the level dimension must be in the pdim-th dimension and all other
   dimensions must be the same as xin. If one-dimensional, then all of xin
   will be interpolated to the same levels. Must have the same units as
   pin.
   linlog

   A scalar integer indicating the type of interpolation:

   abs(linlog) == 1 --> linear interpolation
   abs(linlog) != 1 --> log interpolation

   If linlog is negative, then extrapolation to levels outside the range
   of pin will occur. Use extrapolation with caution.
   pdim

   A scalar integer indicating which dimension of xin is the level
   dimension. Dimension numbering starts at 0.

Return value

   The returned array will have the same shape as xin but the pdim-th
   dimension will have the size of the level dimension of pout. The return
   type will be double if xin is double.

Description

   This function interpolates the values of the pdim-th dimension of xin
   from one set of pressure levels to another set of pressure levels. The
   interpolation can be either linear or log. Extrapolation is optional.
   Missing values are allowed, but they are ignored.

   You can use int2p if the level dimension is the rightmost dimension.

See Also

   int2p, int2p_n_Wrap

Examples

   Example 1

begin
  linlog = 2   ; ln(p) interpolation

  pi =(/ 1000.,925.,850.,700.,600.,500.,400.,300.,250., \
          200.,150.,100.,70.,50.,30.,20.,10. /)

  xi =(/ 28., 23., 18., 10.,  2., -4., -15.,-30.,-40., \
        -52.,-67.,-78.,-72.,-61.,-52.,-48.,-46. /)

  po =(/ 1000.,950.,900.,850.,800.,750.,700.,600.,500., \
          425.,400.,300.,250.,200.,100.,85.,70.,50.,40.,\
           30.,25.,20.,15.,10. /)


; Note: you could use "int2p" here as well.
  xo = int2p_n (pi,xi,po,linlog,0)
; xo will contain (/ 28.,24.71,21.37,18. ,...., -48.,-47.17,-46./).
end

   Example 2

   Let p_out be four-dimensional with dimensions time, lat, lon,
   pout_level. Additionally, p_in and t_in are four-dimensional with
   dimensions time, lat, lon, pin_level. Linearly interpolate with
   extrapolation.
    linlog = -1
    t_out = int2p_n(p_in,t_in,p_out,linlog,3)
;   t_out is dimensioned time, lat, lon, pout_level

   Example 3

   Similar to example 2, but p_out is one-dimensional:
  t_out = int2p_n(p_in,t_in,p_out,linlog,3)
; t_out is interpolated to the uniform set of pressure levels represented by p_i
n

   Example 4

   Similar to example 3, but assume the input arrays are dimensioned time
   x level x lat x lon:

  t_out = int2p_n(p_in,t_in,p_out,linlog,1)
; t_out is dimensioned pout_level, time, lat, lon


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dtrend_msg_n.shtml
THE_TITLE:dtrend_msg_n
   NCL Home > Documentation > Functions > General applied math

dtrend_msg_n

   Estimates and removes the least squares linear trend of the dim-th
   dimension from all grid points (missing values allowed).

Prototype

        function dtrend_msg_n (
                x           [*] : numeric,
                y               : numeric,
                remove_mean [1] : logical,
                return_info [1] : logical,
                dim         [1] : integer
        )

        return_val [dimsizes(y)] :  numeric

Arguments

   x

   One-dimensional array containing the coordinate of the dim-th dimension
   of y. [eg: time].
   y

   A multi-dimensional array or scalar value equal to the data to be
   detrended. The dimension from which the trend is calculated needs to be
   the dim-th dimension. This is usually time.
   remove_mean

   A logical scalar indicating whether or not the mean is removed from
   return_val. True = remove mean, False = do not remove mean.
   return_info

   A logical scalar controlling whether attributes corresponding to the
   y-interscept and slope are attached to return_val. True = attributes
   returned. False = no attributes returned.
   dim

   A scalar integer indicating which dimension of y to do the calculation
   on. Dimension numbering starts at 0.

Return value

   An array of the same size as y. Double if y is double, float otherwise.

   Two attributes (slope and y_intercept) may be attached to return_val if
   return_info = True. These attributes will be one-dimensional arrays if
   y is one-dimensional. If y is multi-dimensional, the attributes will be
   the same size as y minus the dim-th dimension but in the form of a
   one-dimensional array. e.g. if y is 45 x 34 and dim is 1, then the
   attributes will be a one-dimensional array of size 45*34. This occurs
   because attributes can not be multi-dimensional. Double if return_val
   is double, float otherwise.

   You access the attributes through the @ operator:
  print(return_val@slope)
  print(return_val@y_intercept)

Description

   Estimates and removes the least squares linear trend of the dim-th
   dimension from all grid points. The mean is optionally removed. Missing
   values are allowed. Optionally returns the slope (eg, linear trend per
   unit time interval) and y-intercept for graphical purposes.

See Also

   dtrend_quadratic, dtrend_quadratic_msg_n, dtrend_msg, dtrend_n, dtrend

Examples

   Example 1

   Let x be one-dimensional with dimension time and y be three-dimensional
   with dimensions lat,lon, and time. The return_val will be
   three-dimensional with dimensions lat,lon, time. The mean is removed.
    yDtrend = dtrend_msg_n (x,y,True,False,2)

   Example 2

   Same as example 1 but with the optional attributes. Let y be
   temperatures in units of K and the time dimension have units of months.
    yDtrend = dtrend_msg_n (x,y,True,True,2)
;   yDtrend@slope is a one-dimensional array of size nlat x nlon elements.

   Since attributes can not be returned as two-dimensional arrays, the
   user should use onedtond to create a two-dimensional array for plotting
   purposes:

   yDtrend = dtrend_msg_n (x,y,False,True,2)

   slope2D = onedtond(yDtrend@slope, (/nlat,mlon/) )
   delete (yDtrend@slope)
   slope2D = slope2D*120        ; would give [K/decade]

   yInt2D  = onedtond(yDtrend@y_intercept, (/nlat,mlon/) )
   delete (yDtrend@y_intercept)

   Example 3

   Let y be three-dimensional array with dimensions time, lat, lon.
  yDtrend = dtrend_msg_n(y&time,y,True,False,0)
; yDtrend will be three-dimensional with dimension lat, lon, time.

   Example 4

   This example shows how to calculate the significance of trends by
   evaluating the incomplete beta function by using betainc. Let z be a
   three-dimensional array with dimensions named lat, lon, time.
  dimz = dimsizes(z)   ; retrieve dimension sizes of z
  zDtrend = dtrend_msg_n(ispan(0,dimz(2)-1,1),z,True,True,2)

  tval = new((/dimz(0),dimz(1)/),"float")  ; preallocate tval as a float array a
nd
  df = new((/dimz(0),dimz(1)/),"integer")  ; df as an integer array for use in r
egcoef

  rc = regcoef(ispan(0,dimz(2)-1,1),z,tval,df)   ; regress z against a straight
line to
                                                  ; return the tval and degrees
of freedom

  df = equiv_sample_size(z,0.05,0)  ; If your data may be significantly autocorr
elated
                                     ; it is best to take that into account, and
 one can
                                     ; do that by using equiv_sample_size. Note
that
                                     ; in this example df (output from regcoef)
is
                                     ; overwritten with the output from equiv_sa
mple_size.
                                     ; If your data is not significantly autocor
related one
                                     ; can skip using equiv_sample_size.

  df = df-2          ; regcoef/equiv_sample_size return N, need N-2
  beta_b = new((/dimz(0),dimz(1)/),"float")    ; preallocate space for beta_b
  beta_b = 0.5       ; set entire beta_b array to 0.5, the suggested value of be
ta_b
                     ; according to betainc documentation
  z_signif = (1.-betainc(df/(df+tval^2), df/2.0, beta_b))*100. ; significance of
 trends
                                                               ; expressed from
0 to 100%


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

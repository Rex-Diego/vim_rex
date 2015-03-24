THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dtrend_n.shtml
THE_TITLE:dtrend_n
   NCL Home > Documentation > Functions > General applied math

dtrend_n

   Estimates and removes the least squares linear trend of the given
   dimension from all grid points.

Prototype

        function dtrend_n (
                y               : numeric,
                return_info [1] : logical,
                dim         [1] : integer
        )

        return_val [dimsizes(y)] :  numeric

Arguments

   y

   A multi-dimensional array or scalar value equal to the data to be
   detrended. The dimension from which the trend is calculated is
   indicated by the dim argument.
   return_info

   A logical scalar controlling whether attributes corresponding to the
   y-intercept and slope are attached to return_val. True = attributes
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
   one-dimensional array. e.g. if y is 45 x 34, then the attributes will
   be a one-dimensional array of size 45*34. This occurs because
   attributes can not be multi-dimensional. Double if return_val is
   double, float otherwise.
   You access the attributes through the @ operator:
print(return_val@slope)
print(return_val@y_intercept)

Description

   Estimates and removes the least squares linear trend of the given
   dimension from all grid points. Missing values are not allowed, use
   dtrend_msg_n if missing values exist. The mean is also removed.
   Optionally returns the slope (eg, linear trend per unit time interval)
   and y-intercept for graphical purposes.
   Assumes y is equally spaced. If this is not the case, then use
   dtrend_msg_n even if the data do not contain missing values.

See Also

   dtrend_quadratic, dtrend_quadratic_msg_n, dtrend_msg_n, dtrend_msg,
   dtrend

Examples

   Example 1

   y is three-dimensional with dimensions lat, lon, and time. The returned
   array will have the same size. Remember that the mean is also removed.
    yDtrend = dtrend_n(y,False,2)

   Example 2

   Same as example 1 but with the optional attributes. Let y be
   temperatures in units of K and the time dimension have units of months.
  yDtrend = dtrend_n(y,True,2)
; yDtrend@slope = a one-dimensional array of nlat * nlon elements.
; the units are K/month

   Since attributes can not be returned as two-dimensional arrays, the
   user should use onedtond to create a two-dimensional array for plotting
   purposes:

   slope2D = onedtond(yDtrend@slope,(/nlat,nlon/))
   delete (YDtrend@slope)
   slope2D = slope2D*120        ; would give [K/decade]

   yInt2D  = onedtond(yDtrend@y_intercept,(/nlat,nlon/))

   Example 3

   Let y be three-dimensional array with dimensions time, lat, lon. Do the
   calculation across the time dimension.
  yDtrend = dtrend_n(y,False,0)
; yDtrend will be three-dimensional with dimensions time, lat, lon

   Example 4

   This example shows how to calculate the significance of trends by
   evaluating the incomplete beta function by using betainc. Let z be a
   three-dimensional array with dimensions named lat, lon, time.
  zDtrend = dtrend_n(z,True,2)
  dimz = dimsizes(z)   ; retrieve dimension sizes of z

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

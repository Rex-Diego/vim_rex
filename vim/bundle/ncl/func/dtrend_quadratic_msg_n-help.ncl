THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dtrend_quadratic_msg_n.shtml
THE_TITLE:dtrend_quadratic_msg_n
   NCL Home > Documentation > Functions > General applied math

dtrend_quadratic_msg_n

   Estimates and removes the least squares quadratic trend of the dim-th
   dimension from all grid points (missing values allowed).

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function dtrend_quadratic_msg_n (
                y               : numeric,
                remove_mean [1] : logical,
                return_info [1] : logical,
                dim         [1] : integer
        )

        return_val [dimsizes(y)] :  numeric

Arguments

   y

   A one or multi-dimensional array containing the data to be detrended.
   The dimension from which the trend is calculated needs to be the dim-th
   dimension. This is usually time. The sampling interval is assumed to be
   constant.
   remove_mean

   A logical scalar indicating whether or not the mean is removed from
   return_val. True = remove mean, False = do not remove mean.

   Note: in V6.1.0 there was a bug in which remove_mean was behaving the
   opposite of its intended behavior. This will be fixed in V6.1.1.
   return_info

   A logical scalar controlling whether attributes containing the three
   best fit quadratic coefficients are attached to return_val. True =
   attributes returned. False = no attributes returned.
   dim

   A scalar integer indicating which dimension of y to do the calculation
   on. Dimension numbering starts at 0.

Return value

   An array of the same size as y. Double if y is double, float otherwise.

   An attribute (quadratic) may be attached to return_val if return_info =
   True. This attribute will be a one-dimensional array of length 3 if y
   is one-dimensional. If y is multi-dimensional, the attributes will be
   the same size as y minus the dim-th dimension but in the form of a
   one-dimensional array. E.G. if y is (K,N,M) and dim is 0 which
   corresponds to K, then the attributes will be a one-dimensional array
   of size N*M*3. This occurs because attributes can not be
   multi-dimensional. Double if return_val is double, float otherwise.

   You access the attributes through the @ operator:
  print(return_val@quadratic)

Description

   Estimates and removes the least squares quadratic trend of the dim-th
   dimension from all grid points. The mean is optionally removed. Missing
   values are allowed. Optionally returns the coefficients (eg, constant,
   linear coefficient, quadratic coefficient).

   Note: in V6.1.0 there was a bug in which remove_mean was behaving the
   opposite of its intended behavior. This will be fixed in V6.1.1.

See Also

   dtrend_quadratic, dtrend_msg_n, dtrend_msg, dtrend_n, dtrend

Examples

   Example 1

   Let y be three-dimensional with dimensions (time,lat,lon). The
   return_val will be three-dimensional. The mean is removed.
    yDtrend = dtrend_quadratic_msg_n (y,True,False,0) ; yDtrend(ntim,nlat,mlon)

   Example 2

   Same as example 1 but with the optional attributes. Let y be
   temperatures in units of K and the time dimension have units of months.
    yDtrend = dtrend_quadratic_msg_n (y,True,True,0)
;   yDtrend@quadratic is a one-dimensional array of size nlat*nlon*3 elements.

   Since attributes can not be returned as multidimensional arrays, the
   user should use onedtond to create a multidimensional array for
   plotting purposes:

   yDtrend = dtrend_quadratic_msg_n (y,False,True,0)

   qcoef = onedtond(yDtrend@quadratic, (/nlat,mlon,3/) )
   delete (yDtrend@quadratic)

   Example 3

;================
; illustrate via a single time series
;================
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

     ntim = 100
     ymsg = 1e20
                                                ; sample time series
     a    = 289.95
     b    = -0.4022
     c    = 0.003743
     t    = fspan(1,3650,ntim)
     noise= random_normal(0,2500,ntim)
     Y    = a + b*t + c*t^2 + noise             ; single time series
     print("original: avg(Y)="+dim_avg_n(Y,0))  ; print average of y

     wks   = gsn_open_wks ("x11","dtrend_quadratic_msg_n")
     res                  = True
     res@tiMainString     = "original data: No missing"
     plot  = gsn_csm_xy (wks,t,Y,res)

     y = Y                ; save original Y for later use

     yatrend = dtrend_quadratic_msg_n(y,True,True,0)
     print("yatrend@quadratic="+yatrend@quadratic)

     res@gsnYRefLine      = 0.0
     res@tiMainString     = "quadratic trend removed: no msg data"
     plot  = gsn_csm_xy (wks,t,yatrend,res)
     yaavg = dim_avg_n(yatrend, 0)
     print("avg(yatrend)="+yaavg)

; add msg to 'pcmsg' % of points

     pcmsg = 20.0    ; %arbitrary
     print("MISSING TEST: "+pcmsg+"%")

     y = Y                            ; reset to original values
     y@_FillValue  = ymsg

     imsg = toint( random_uniform(0, ntim-1, toint(ntim*(pcmsg*0.01))) )
     y(imsg) = ymsg

     res@tiMainString     = "original data: "+pcmsg+"% missing"
     plot  = gsn_csm_xy (wks,t,y,res)
                                       ; remove quadratic trend
     ybtrend = dtrend_quadratic_msg_n(y,True,True,0)
     print("ybtrend@quadratic="+ybtrend@quadratic)

     res@tiMainString     = "quadratic trend removed: "+pcmsg+"% msg data"
     plot  = gsn_csm_xy (wks,t,ybtrend,res)
     ybavg = dim_avg_n(ybtrend, 0)
     print("avg(ybtrend)=" + ybavg)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

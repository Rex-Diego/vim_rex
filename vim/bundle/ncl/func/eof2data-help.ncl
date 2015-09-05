THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/eof2data.shtml
THE_TITLE:eof2data
   NCL Home > Documentation > Functions > Empirical orthogonal functions

eof2data

   Reconstructs a data set from EOFs and EOF time series.

Prototype

        function eof2data (
                ev           : numeric,
                ev_ts [*][*] : numeric
        )

        return_val  :  numeric

Arguments

   ev

   A multi-dimensional array containing the EOFs calculated using eofunc.
   ev_ts

   A two-dimensional array containing the EOF time series calculated using
   eofunc_ts.

Return value

   An array of the same size and type as the main data array input into
   eofunc

Description

   Uses the EOF spatial patterns and amplitude time series to create a
   data field. The original data array may be reconstructed if all
   possible eigen functions were used. If only a subset are used, the
   returned array will explain a percent of the variance of the original
   array. Note that the time series of amplitude coefficients returned by
   eofunc_ts has had the mean subtracted. To reconstruct the original
   series the means of each component must be included. The component
   means are returned as an attribute, ts_mean, of of ev_ts. You access
   this attribute via the @ operator:
print(ev_ts@ts_mean)

See Also

   eofunc,eofunc_ts

Examples

   Example 1

   Assume x is two-dimensional with dimensions lat, lon, and time.
   neval = 7                       ; number of eofs
   ev    = eofunc(x,neval,False)       ; ev(neval,nlat,nlon)
   evts  = eofunc_ts(x,ev,False)             ; evts(neval,ntime)

   do n=0,neval-1
      evts(n,:) = evts(n,:) + evts@ts_mean(n)  ; add time series mean
   end do

   xEof  = eof2data(ev,evts)       ; reconstruct original array
                                         ;
   x2    = eof2data(ev(0:1,:),evts(0:1,:)) ; construct array using
                                           ; first 2 EOFs

   Example 2

   Assume z is four-dimensional with dimension level, lat, lon, time.
   Comput the EOFs at one level.
   kl     = 3                             ; specify level
   neval  = 8                             ; calculate 8 EOFs out of nlat*mlon
   ev     = eofunc(z(kl,:,:,:),neval ,False)  ; ev(neval,nlat,mlon)
   evts   = eofunc_ts (z(kl,:,:,:),ev,False)  ; evts(neval,ntime)

   do n=0,neval-1
      evts(n,:) = evts(n,:) + evts@ts_mean(n)  ; add time series mean
   end do
   z8     = eof2data(ev,evts)             ; reconstruct array using the 8 EOFs
                                          ; z8(nlat,mlon,ntim)

   Example 3

   Note: when dealing with latitude/longitude grids, the user may have
   weighted the observations by the cosine of the latitude prior to using
   eofunc. To reconstruct the data, an extra step is needed to remove the
   weighting.

   Assume p is three-dimensional with dimension lat, lon, and time. Both
   time and lat are one-dimensional. Lat contains the latitudes.:
   clat = sqrt(cos(lat*0.0174532))      ; array syntax  clat(nlat)

   do nl=0,nlat-1                       ; wgt by cosine of the latitude
      p(nl,:,:)  = p(nl,:,:)*clat(nl)   ; array syntax
   end do

   neval  = 3                     ; calculate 3 EOFs out of nlat*mlon
   ev     = eofunc(p,neval,False)       ; ev(neval,nlat,mlon)
   evts   = eofunc_ts(p,evecv,False)    ; evts(neval,ntim)

   do n=0,neval-1
      evts(n,:) = evts(n,:) + evts@ts_mean(n)  ; add time series mean
   end do

   p3     = eof2data(ev,evts)       ; reconstruct wgted array using 3 EOFs

   do nl=0,nlat-1                   ; remove weighting
      if (clat(nl).ne.0.) then
          p3(nl,:,:)  = p3(nl,:,:)/clat(nl)   ; array syntax
      end if
   end do


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

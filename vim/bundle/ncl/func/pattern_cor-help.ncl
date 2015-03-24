THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/pattern_cor.shtml
THE_TITLE:pattern_cor
   NCL Home > Documentation > Functions > General applied math

pattern_cor

   Compute centered or uncentered pattern correlation.

   [new.gif] Available in version 6.0.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function pattern_cor (
                x       : numeric,
                y       : numeric,
                w       : numeric,
                opt [1] : integer
        )

Arguments

   x

   An array of two-to-four dimensions. The two rightmost dimensions are
   expected to be the spatial dimensions, eg: (...,lat,lon)
   y

   An array the same size and shape as x.
   w

   A scalar (w[1]) or one (w[*]) or two (w[*][*]) dimensional array
   containing the weights. If no weighting is desired set w=1.0 a scalar
   value. If w[*] then it must be the same sizes as the second rightmost
   dimension. eg: 'lat'. If w[*][*] then the the sizes of the two
   rightmost dimensions of x and w must conform.
   opt

   opt=0 means compute the centered pattern correlation; opt=1 means
   compute the uncentered pattern correlation.

Return value

   The results could be a scalar is x and y are two dimensional; if x and
   y are (ntim,nlat,mlon), a one dimensional array of length ntim will be
   returned; if x and y are (ntim,klev,nlat,mlon), a two-dimensional array
   of size (/ntim,klev/) will be returned.

   If either x or y are all missing (_FillValue), then the returned
   quantity will be set to _FillValue.

Description

   Pattern correlations can be computed directly (uncentered) or by
   computing anomalies from a central mean (centered). For diagnostic
   studies (eg, Taylor Diagrams) the centered pattern correlation is most
   commonly used. However, as discussed in the "IPCC Third Assessment
   Report - Climate Change 2001" The centered pattern correlation should
   not be used for climate change attribution.
     Pattern correlation statistics come in two types - centred and uncentred
     (see Appendix 12.3). The centred (uncentred) statistic measures the similar
ity
     of two patterns after (without) removal of the global mean.
     :
     :
     Centred correlations alone are not sufficient for the attribution of climat
e change."


   Note: If all of either x or y are missing (ie, all equal_FillValue)
   then the _FillValue associated with x or y will be returned.

See Also

   escorc

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.

     load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Consider x(lat,lon) and y(lat,lon) and (say) gaussian weights, gw(lat).
   Assorted pattern correlations are computed via
           ra = pattern_cor(x, y, 1.0, 0)    ; no weighting, centered
           rb = pattern_cor(x, y, 1.0, 1)    ; no weighting, uncentered
           rc = pattern_cor(x, y,gw, 0)      ; gaussian weighting, centered
           rd = pattern_cor(x, y,gw, 1)      ; gaussian weighting, uncentered

           clat = cos(0.01745329*lat)        ; cos(lat) weight
           re = pattern_cor(x, y,clat, 0)    ; cos(lat) weighting, centered
           rf = pattern_cor(x, y,clat, 1)    ; cos(lat) weighting, uncentered

   Example 2

   Consider x(time,lat,lon) and y(time,lat,lon) and weights, w(lat).
   Assorted pattern correlations are computed via
           rc = pattern_cor(x, y,w, 0)      ; weighting, centered; rc(time)
           rd = pattern_cor(x, y,w, 1)      ; weighting, uncentered; rd(time)

   Example 3

   Consider x(time,lev,lat,lon) and y(time,lev,lat,lon) and weights,
   w(lat). Assorted pattern correlations are computed via
           rc = pattern_cor(x, y,w, 0)      ; weighting, centered; rc(time,lev)
           rd = pattern_cor(x, y,w, 1)      ; weighting, uncentered; rd(time,lev
)

   Example 4

   Consider x(time,lev,lat,lon) and y(time,lev,lat,lon) and weights,
   w(lat,lon). Assorted pattern correlations are computed via
           rc = pattern_cor(x, y,w, 0)      ; weighting, centered; rc(time,lev)
           rd = pattern_cor(x, y,w, 1)      ; weighting, uncentered; rd(time,lev
)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

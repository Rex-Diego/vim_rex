THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/User_contributed/kf_filter.shtml
THE_TITLE:kf_filter
   NCL Home > Documentation > Functions > General applied math, CESM,
   Meteorology

kf_filter

   Extract equatorial waves by filtering in the Wheeler-Kiladis
   wavenumber-frequency domain.

   [new.gif] Available in version 5.2.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/kf_filter.ncl"

        function kf_filter (
                x      [*][*] : numeric,
                obsPerDay [1] : integer,
                tMin      [1] : numeric,
                tMax      [1] : numeric,
                kMin      [1] : numeric,
                kMax      [1] : numeric,
                hMin      [1] : numeric,
                hMax      [1] : numeric,
                waveName  [1] : string
        )

Arguments

   x

   Data to be filtered. Time should be the left dimension and longitude
   should be the right dimension. For example: x(time,lon).
   obsPerDay

   Number of time steps per 24 hour period.
   tMin
   tMax

   Range of cut-off periods (must be positive).
   kMin
   kMax

   Range of wavenumbers, can be positive (eastward) or negative
   (westward).
   hMin
   hMax

   Range of equivalent depths to use.
   waveName

   Name of dispersion curve to use. The following names are recognized:
   "ER", "Kelvin", "MRG", "IG0", "IG1", "IG2" (IG0 and MRG are same).
   Specifically:
    1. ER: Equatorial Rossby Wave
    2. Kelvin: Kelvin Wave
    3. MRG: Mixed Rossby-Gravity
    4. IGO: Inertia-Gravity [n=0]
    5. IG1: Inertia-Gravity [n=1]
    6. IG2: Inertia-Gravity [n=2]

Return value

   return_val [dimsizes(x)] : float or double

Description

   At each point, the data are space-time bandpass filtered following
   Wheeler and Kiladis (1999). The data are first detrended and tapered in
   time, and then they are filtered using 2-dimensional FFT (fft2df,
   fft2db). The filter bounds can simply be rectangular (as in Wheeler and
   Kiladis's MJO filter), or they can bounded by the dispersion curves of
   the shallow water equatorial waves. At this time, other filter shapes
   (e.g., the TD filter from Kiladis et al. 2006) are not supported.

   The input data should be periodic (global) in longitude. In addition,
   filtered anomalies near the temporal ends of the dataset should
   generally be ignored. The longer the periods filtered for, the more
   data should be ignored at the ends.

   References:
   Wheeler, M., and G. N. Kiladis, 1999: Convectively coupled equatorial
   waves: Analysis of clouds and temperature in the wavenumber frequency
   domain. J. Atmos. Sci., 56, 374-399.

   Kiladis, G. N., C. D. Thorncroft, and N. M. J. Hall, 2006:
   Three-dimensional structure and dynamics of African easterly waves.
   Part I: Observations. J. Atmos. Sci., 63, 2212-2230.

   Acknowledgement: This function was donated by Carl Schreck, III [SUNY
   at Albany].

See Also

   Space-Time Examples,
   MJO Examples

Examples

   See Space-Time Example 4


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

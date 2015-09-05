THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/taper.shtml
THE_TITLE:taper
   NCL Home > Documentation > Functions > General applied math

taper

   Applies split-cosine-bell tapering to one or more series across the
   rightmost dimension.

Prototype

        function taper (
                x       : numeric,
                p   [1] : numeric,
                option  : numeric
        )

        return_val [*] :  numeric

Arguments

   x

   An array of one or more dimensions. The tapering will be performed on
   the rightmost dimension.

   p

   A scalar (0.0 <= p <= 1.0) which specifies the proportion of the series
   to be tapered. Typically, p = 0.1 (corresponding to 10% of the series).

   option

   Reserved for future use (not currently used).

Return value

   Returns an array dimensioned the same as x.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function is used prior to performing a fast fourier transform
   (FFT) to a series that is not cyclic. It reduces the leakage from
   strong spectral peaks. See chapter five of the following reference:

     Fourier Analysis of Time Series
     Peter Bloomfield
     Wiley-Interscience, 1976

   Use taper_n if the dimension to do the calculation on is not the
   rightmost dimension and reordering is not desired. This function can be
   significantly faster than taper.

See Also

   taper_n, ezfftf

Examples

   Example 1

   Let x be a 1D array of length nx (e.g. nx = 800):

  xTaper = taper(x, 0.1, 0)
  xCoef  = ezfftf(xTaper)

   Example 2

   Define x(time, lat, lon) where ntim = 500, nlat = 64, mlon = 128:

  xTaper = taper(x(lat|:, lon|:, time|:), 0.1, 0)
  xCoef  = ezfftf(xTaper)

; In V5.2.0 or later, you can use taper_n to avoid reordering,
; but xCoef will now be dimensioned time x lat x lon:
;  xCoef  = taper_n(xTaper,0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

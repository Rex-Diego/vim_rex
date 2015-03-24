THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/taper_n.shtml
THE_TITLE:taper_n
   NCL Home > Documentation > Functions > General applied math

taper_n

   Applies split-cosine-bell tapering to one or more series across the
   given dimension.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function taper_n (
                x       : numeric,
                p   [1] : numeric,
                option  : numeric,
                dim [1] : integer
        )

        return_val [*] :  numeric

Arguments

   x

   An array of one or more dimensions. The tapering will be performed on
   the dim-th dimension.

   p

   A scalar (0.0 <= p <= 1.0) which specifies the proportion of the series
   to be tapered. Typically, p = 0.1 (corresponding to 10% of the series).

   option

   Reserved for future use (not currently used).
   dim

   A scalar integer indicating which dimension of x to do the calculation
   on. Dimension numbering starts at 0.

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

   You can use taper if the dimension to do the calculation on is the
   rightmost dimension.

See Also

   taper, ezfftf

Examples

   Example 1

   Let x be a 1D array of length nx (e.g. nx = 800):

  xTaper = taper_n(x, 0.1, 0, 0)
  xCoef  = ezfftf(xTaper)

   Example 2

   Define x(time, lat, lon) where ntim = 500, nlat = 64, mlon = 128:

  xTaper = taper_n(x, 0.1, 0, 0)
  xCoef  = ezfftf(xTaper)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

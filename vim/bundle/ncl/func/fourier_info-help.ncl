THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fourier_info.shtml
THE_TITLE:fourier_info
   NCL Home > Documentation > Functions > General applied math

fourier_info

   Performs fourier analysis on one or more periodic series.

Prototype

        function fourier_info (
                x            : numeric,
                nhx      [1] : integer,
                sclPhase [1] : numeric
        )

        return_val  :  float or double

Arguments

   x

   An array of one or more dimensions. If more than one dimension, the
   harmonic analysis will be performed on the rightmost dimension.
   Further, the rightmost dimension must be periodic. The periodic (i.e.
   cyclic) point should not be included. Missing values are not allowed.
   nhx

   The number of harmonics to be returned. If the series is of length N,
   then 0 < nhx <= N/2. If nhx=0, then the maximum number of harmonics
   (N/2) will be returned.
   sclPhase

   Constant which will be used to scale the phases. If no scaling is
   desired, set sclPhase=1.0.

Description

   A fourier analysis is performed on each series. The fourier
   coefficients are used to derive the amplitude, phase and percent
   variance explained by each harmonic. The user may request that only a
   subset of the harmonic information be returned.

   The amplitude for each harmonic is computed via
            amp(n) = sqrt(a(n)*a(n) + b(n)*b(n))

   where "a" and "b" represent the real and imaginary coefficients of each
   harmonic.

   The phase represents the location of the first maximum. The user may
   wish to scale the phase. For example, let's say that the rightmost
   dimension is longitude and has size of mlon=72. This makes the distance
   between adjacent grid points equal to five degrees. If sclPhase=1.0,
   then no phase scaling will occur and the returned phases will be 0 < =
   phase < mlon. If sclPhase=5. then the returned phases will be 0 <=
   phase < 360.

   The returned variable's type will be double if x is double, and float
   otherwise. The dimensions are as follows, where N represents the
   rightmost dimension of x, and [...] represents the rest of the
   dimensions of x, if any:
   x has 1 dimension,   nhx > 0          : finfo[3][nhx]
   x has 1 dimension,   nhx = 0          : finfo[3][N/2]
   x has 2+ dimensions, nhx > 0          : finfo[3][...][nhx]
   x has 2+ dimensions, nhx = 0          : finfo[3][...][N/2]

   The leftmost dimension size is three (3), where the subscripts 0, 1,
   and 2 reference the amplitude, phase and percent variance explained.
   See examples below for further information.

   NOTE: The underlying code that computes the Fourier information has an
   internal parameter (eps) which is set to 1e-12. If the total variance
   of the input series is less that eps then the amplitude, phase and
   percent variance will be set to zero. The reason for this is that users
   have input arrays that contain a constant value (hence, variance is
   zero). Since the percent variance is calculated by dividing by the
   total variance, the eps insures that division by zero will not occur.

Examples

   There are some Fourier analysis examples available here.

   Example 1

   Assume x is a one-dimensional array of length N=72. Then:

  finfo = fourier_info (x, 4,   1.)  => finfo(3,4) [unscaled]
  finfo = fourier_info (x, 0,   5.)  => finfo(3,36) [returned phases scaled by 5
]
  finfo = fourier_info (x, N/2, 5.)  => finfo(3,36)

     finfo(0,:) will refer to the amplitude of each harmonic
     finfo(1,:) will refer to the phase of each harmonic
     finfo(2,:) will refer to the percent variance explained by each
     harmonic

   Example 2

   Assume x is a one-dimensional monthly climatology (N=12), then the
   following will return fourier information for the first two harmonics
   only:
  finfo = fourier_info (x, 2, 1.)    =>  finfo(3,2) [phases will be unscaled]

   Example 3

   Assume x is dimensioned ntim x nlat x mlon. Then, where mlon=128
   (dlon=360./mlon=2.8125):
  finfo = fourier_info (x, 10, dlon)   =>  finfo(3,ntim,nlat,10)
  finfo = fourier_info (x,  0, dlon)   =>  finfo(3,ntim,nlat,64)
  finfo = fourier_info (x, N/2,dlon)   =>  finfo(3,ntim,nlat,64)

   Example 4

   Assume x is a monthly climatology of size ntim[=12] x klev x nlat x
   mlon with named dimensions "time", "lev", "lat" and "lon", and that the
   information from the first three harmonics of the mean annual cycle is
   desired. Then:
  finfo = fourier_info (x(lev|:,lat|:,lon|:,time|:), 3, 1.)   =>  finfo(3,klev,n
lat,mlon,3)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

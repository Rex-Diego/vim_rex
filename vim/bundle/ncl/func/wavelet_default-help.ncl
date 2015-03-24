THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wavelet_default.shtml
THE_TITLE:wavelet_default
   NCL Home > Documentation > Functions > General applied math

wavelet_default

   Calculates the wavelet transform of a time series and significance
   levels.

Prototype

        function wavelet_default (
                y      [*] : numeric,
                mother [1] : integer
        )

        return_val [2][*][dimsizes(y)] :  float or double

Arguments

   y

   A one-dimensional array (call the length N).
   mother

   An integer giving the mother wavelet to use:

     0 = 'Morlet'
     1 = 'Paul'
     2 = 'DOG' (derivative of Gaussian)

   If mother < 0 or > 2, then the default is 'Morlet'. (Most commonly,
   mother = 0.)

Return value

   This function returns a three-dimensional array (call it wave)
   dimensioned 2 x jtot x N
   (see the description below for information on jtot). wave will contain
   the real (0,:,:) and imaginary parts (1,:,:) of the wavelet transform,
   versus time and scale. It will be of type double if y is double, and
   float otherwise.

Description

   This function is identical to wavelet, except that it sets some default
   values for some of the input parameters available to wavelet:

   wavelet input parameter default value
   dt 1
   param 6.0 if mother <= 0 or mother > 2
   4.0 if mother = 1
   2.0 if mother = 2
   s0 2 * dt
   dj 0.25
   jtot 1 + ((log(N*dt/s0))/dj)/log(2.)
   npad dimsizes(y)
   noise 1
   isigtest 0
   siglvl 0.05
   nadof currently ignored

   Please see the wavelet documentation for a full description of how this
   function works.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

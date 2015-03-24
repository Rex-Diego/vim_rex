THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fft2db.shtml
THE_TITLE:fft2db
   NCL Home > Documentation > Functions > General applied math

fft2db

   Performs a two-dimensional discrete backward Fourier transform (Fourier
   synthesis).

Prototype

        function fft2db (
                coef [2][*][*] : numeric
        )

Arguments

   coef

   A three dimensional array containing the real and imaginary parts.
   Generally, this would be the array created by fft2df.
            input: coef(2,:,:)
where
        real part: coef(0,:,:)
   imaginary part: coef(1,:,:)

Description

   This function computes the discrete backward Fourier transform of a
   real periodic array. This transform is also known as Fourier synthesis,
   transforming from spectral to physical space.

   A call to fft2df followed by a call to fft2db (or vice-versa)
   reproduces the original array within roundoff error.

   Missing values are not allowed. For efficiency reasons, no checking for
   missing values [i.e., _FillValue] is performed. Hence, if missing
   values are present, the results will be erroneous.

   An old but but very readable reference is:
        Peter Bloomfield
        Fourier analysis of time series : An introduction
        New York : John Wiley and Sons  , 1976

   NCL uses FFTPACK5 developed by Paul Swarztrauber and Richard Valent.
   The specific fortran subroutines used are:
       fft2df:
       http://www.cisl.ucar.edu/css/software/fftpack5/rfft2f.html

       fft2db:
       http://www.cisl.ucar.edu/css/software/fftpack5/rfft2b.html

   Please note that fortran is column major while NCL (like C/C++) is
   row-major.

See Also

   fft2df, ezfftf, ezfftb, taper, dtrend, specx_anal, specxy_anal


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

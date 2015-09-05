THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filwgts_lancos.shtml
THE_TITLE:filwgts_lancos
   NCL Home > Documentation > Functions > General applied math

filwgts_lancos

   Calculates one-dimensional filter weights (deprecated).

Prototype

        function filwgts_lancos (
                nwt    [1] : integer,
                ihp    [1] : integer,
                fca    [1] : numeric,
                fcb    [1] : numeric,
                nsigma [1] : numeric
        )

        return_val [nwt] :  float or double

Description

   Note: this function was renamed to filwgts_lanczos in version 4.3.1 to
   reflect the correct spelling of Cornelius Lanczos' name. While this
   function will still work with this name, we recommend using the
   correctly spelled version.

   The cause for the misspelling was the original fortran subroutine was
   named
subroutine lancos (nwt,fca,fcb,nsigma,ihp,wt,resp,freq,ier)

   The reason for six characters was that standard conforming fortran
   [prior to f90] required that variable and subroutine names be no longer
   than 6 characters. It was a common fortran extension to allow more than
   six but the standard specified a maximum of 6 characters. The
   subroutine name was inadvertently used when naming the NCL function.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

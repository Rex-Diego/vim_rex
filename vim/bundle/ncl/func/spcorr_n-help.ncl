THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/spcorr_n.shtml
THE_TITLE:spcorr_n
   NCL Home > Documentation > Functions > General applied math

spcorr_n

   Computes Spearman rank order correlation coefficient across the given
   dimension.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function spcorr_n (
                x       : numeric,
                y       : numeric,
                dim [1] : integer
        )

        return_val  :  float or double

Arguments

   x

   An array of any numeric type or size. The dim-th dimension is the
   dimension to be used.
   y

   An array of any numeric type and same size as x. The dim-th dimension
   is the dimension to be used.
   dim

   A scalar integer indicating which dimension of x, y to do the
   calculation on. Dimension numbering starts at 0.

Return value

   The return value will have the same dimensions as all but the dim-th
   dimension of x and y. The return will be a double if x or y are double,
   and float otherwise.

Description

   Computes Spearman rank-order correlation across the given dimension.
   This function should not be used if there are many ranked 'ties'. The
   formula used does not apply to this situation.

   Missing values will be removed from the input x and/or y prior to doing
   the calcuation.

See Also

   spcorr, escorc, esacv, esacr, esccr, esccv, escovc

Examples

   Example 1

  x   = (/ (/ 86, 97, 99, 100, 101, 103, 106, 110, 112, 113/), \
           (/ 90, 93, 96, 102, 103, 105, 106, 109, 111, 113/) /)

  y   = (/ (/  0, 20, 28,  27,  50,  29,   7,  17,   6,  12/), \
           (/  0, 10, 15,  26,  40,  35,  16,   8,   3,   1/) /)

  spc = spcorr_n( x, y, 1)  ; -0.1757576, -0.1151515



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

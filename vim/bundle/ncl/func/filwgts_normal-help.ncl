THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filwgts_normal.shtml
THE_TITLE:filwgts_normal
   NCL Home > Documentation > Functions > General applied math

filwgts_normal

   Calculates one-dimensional filter weights based upon the normal
   (gaussian) distribution.

Prototype

        function filwgts_normal (
                nwt    [1] : integer,
                sigma  [1] : numeric,
                option [1] : integer
        )

        return_val [nwt] :  float or double

Arguments

   nwt

   A scalar indicating the total number of weights (can be odd or even).
   sigma

   A scalar indicating the standard deviation to be used. Generally, this
   is set to 1.0.
   option

   A scalar that is currently not used.

Return value

   An array of length nwt is returned. The type will be double if sigma is
   double, and float otherwise.

Description

   Given a user specified number of weights, this function returns a
   symmetric set of weights.

   Setting sigma < 1.0 will result in even more weight being given to the
   central values than sigma = 1.0.

   The derived weights can be input to the function wgt_runave to apply
   the filter to a series if data values. Usually, the kopt=0 is chosen
   for wgt_runave when applying the weights to, say, a time series.

See Also

   filwgts_lanczos

Examples

   Example 1

   This example generates the gaussian (normal) weights for several
   different values of nwt and with sigma = 1.0:
  NWGT = (/ 3, 7, 10 /)

  do n=0,dimsizes(NWGT)-1
     nwt = NWGT(n)
     w   = filwgts_normal (nwt, 1.0, 0)

     print ("-----nwt="+nwt+"------------")
     print ("genGauWgts: nwt="+w)
     delete (w)
  end do

   The above script yields:
(0)     -----nwt=3------------
(0)     genGauWgts: nwt=0.274069
(1)     genGauWgts: nwt=0.451863
(2)     genGauWgts: nwt=0.274069
(0)     -----nwt=7------------
(0)     genGauWgts: nwt=0.106289
(1)     genGauWgts: nwt=0.140321
(2)     genGauWgts: nwt=0.16577
(3)     genGauWgts: nwt=0.17524
(4)     genGauWgts: nwt=0.16577
(5)     genGauWgts: nwt=0.140321
(6)     genGauWgts: nwt=0.106289
(0)     -----nwt=10-----------
(0)     genGauWgts: nwt=0.0732114
(1)     genGauWgts: nwt=0.0892001
(2)     genGauWgts: nwt=0.103444
(3)     genGauWgts: nwt=0.114182
(4)     genGauWgts: nwt=0.119962
(5)     genGauWgts: nwt=0.119962
(6)     genGauWgts: nwt=0.114182
(7)     genGauWgts: nwt=0.103444
(8)     genGauWgts: nwt=0.0892001
(9)     genGauWgts: nwt=0.0732114

   Example 2

   This example generates the gaussian (normal) weights with sigma=0.5 and
   nwt=3 and 7:
  NWGT = (/ 3, 7 /)

  do n=0,dimsizes(NWGT)-1
     nwt = NWGT(n)
     w   = filwgts_normal (nwt, 0.5, 0)

     print ("-----nwt="+nwt+"------------")
     print ("genGauWgts: nwt="+w)
     delete (w)
  end do

   The above yields:
(0)     ----------------------
(0)     genGauWgts: nwt=0.106507
(1)     genGauWgts: nwt=0.786986
(2)     genGauWgts: nwt=0.106507
(0)     ----------------------
(0)     genGauWgts: nwt=0.0366328
(1)     genGauWgts: nwt=0.111281
(2)     genGauWgts: nwt=0.216745
(3)     genGauWgts: nwt=0.270682
(4)     genGauWgts: nwt=0.216745
(5)     genGauWgts: nwt=0.111281
(6)     genGauWgts: nwt=0.0366328


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/betainc.shtml
THE_TITLE:betainc
   NCL Home > Documentation > Functions > General applied math

betainc

   Evaluates the incomplete beta function.

Prototype

        function betainc (
                x  : numeric,
                a  : numeric,
                b  : numeric
        )

        return_val [dimsizes(x)] :  typeof(x)

Arguments

   x

   upper limit of integration. x may be of any dimensionality. x must be
   in (0,1) inclusive and can only be float or double.

   a

   first beta distribution parameter; must be > 0.0. It must be the same
   dimensionality as x.
   b

   second beta distribution parameter; must be > 0.0. It must be the same
   dimensionality as x.

Return value

   The variable returned will be the same type and dimensionality as x.

   As of NCL version 4.3.1, if x contains missing values, the return value
   will contain missing values in the same locations.

Description

   betainc calculates the incomplete beta function. The incomplete beta
   function ratio is the probability that a random variable from a beta
   distribution having parameters a and b will be less than or equal to x.
   The code used is from SLATEC (http://www.netlib.org/slatec/fnlib/).
   This returns the same answers as the Numerical Recipes [Cambridge Univ.
   Press, 1986] function betai.

   This function is often used to determine probabilities.

   Note: in NCL version 4.3.1, this function was updated to handle missing
   values. If any missing values are inputted, the output array will
   contain missing values in the same locations.

Examples

   Example 1


  a = 0.5
  b = 5.0
  x = 0.2

  alpha = betainc(x,a,b)
  print("alpha(x,a,b)="+alpha)

  x = 0.5
  alpha = betainc(x,a,b)
  print("alpha(x,a,b)="+alpha)

   The result is:
  alpha(x,a,b)= 0.85507
  alpha(x,a,b)= 0.98988

   Example 2 - The betainc can be used as a p-Value calculator for the
   Student t-test. Let's say a calculation has been made where the
   degrees-of-freedom (df=20) and a Student-t value of 2.08 has been
   determined. A probability level may be determined via:

  df   = 20
  tval = 2.08
  prob = betainc( df/(df+tval^2), df/2.0, 0.5)
  print ("prob="+prob)

   The result is prob = 0.0506. This is a two-tailed probability. The
   one-tailed probability is 0.5*prob = 0.0253,

   For plotting, users often prefer to plot the quantity:
   prob = (1.-betainc(x,a,b))*100.  ; probability in %


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cfftf_frq_reorder.shtml
THE_TITLE:cfftf_frq_reorder
   NCL Home > Documentation > Functions > General applied math

cfftf_frq_reorder

   Reorders the data returned by cfftf.

Prototype

        function cfftf_frq_reorder (
                cf  : numeric
        )

        return_val  :   typeof(x)

Arguments

   cf

   The array as returned by cfftf.

Return value

   A double array is returned if cf is double, otherwise a float array is
   returned.

Description

   Reorder the array returned by cfftf so that the data span -0.5 to 0.5.

   Caveat: The reordered data can not be input to cfftb.

   Background from Paul Swarztrauber:

   Historically, the continuous complex transform is defined on the
   interval -pi to pi with wave numbers -infinity to infinity. In its'
   discrete form it is defined on the points x sub j = j2pi/N where

if N is  odd then j = -(N-1)/2,...,(N-1)/2

if N is even then j = N/2,...,N/2-1

   These integer values also correspond to wave numbers k.

   The confusion arises because the description of the transform is often
   defined with indices j=0,..,N-1 which is true but corresponds to an
   aliased transform and chosen simply because one does not have to
   separate the description into parts corresponding to even and odd
   integers. That is, it is chosen to simplify math presentation but
   confuses the heck out of individuals that actually have to use the
   transform.

See Also

   cfftf,cfftb ezfftf, ezfftb, taper, dtrend, specx_anal, specxy_anal

Examples

   Example 1

   Reorder the complex frequency spectrum of Example 1 presented for
   cfftf. The issue is that the returned frq attribute is not
   monotonically increasing.
    1. The simplest approach would be to replace the returned frequency
       attribute with values in the range 0 to 1 or create a new array
       containing the new values. Either is readily accomplished via
             cf@frq = (ispan(0,N-1,1)*1.0)/N
                    ; ============= or ========================
                  f = (ispan(0,N-1,1)*1.0)/N

       The cf@frq or f could be used for the plot abscissa.
    2. The convention is to use a frequency scale that spans -0.5 to 0.5.
       To accomplish this the returned values must be reordered.
             xf = cfftf_frq_reorder( cf )
             print(sprintf("%9.5f", xf@frq) +"    "+sprintf("%9.3f", xf(0,:))+"
   "+sprintf("%9.3f", xf(1,:)) )


            frq          real         imag
(0)      -0.50000      -43.000        0.000
(1)      -0.45833       35.417       33.699
(2)      -0.41667       -4.192      -31.658
(3)      -0.37500       26.000       30.355
(4)      -0.33333       32.500       18.187
(5)      -0.29167      -32.697       49.359
(6)      -0.25000        1.000       12.000
(7)      -0.20833      -64.781       36.235
(8)      -0.16667       39.500        4.330
(9)      -0.12500       26.000       40.355
(10)     -0.08333     -161.808       82.658
(11)     -0.04167       16.061       44.823

(12)      0.00000    24265.000        0.000

(13)      0.04167       16.061      -44.823
(14)      0.08333     -161.808      -82.658
(15)      0.12500       26.000      -40.355
(16)      0.16667       39.500       -4.330
(17)      0.20833      -64.781      -36.235
(18)      0.25000        1.000      -12.000
(19)      0.29167      -32.697      -49.359
(20)      0.33333       32.500      -18.187
(21)      0.37500       26.000      -30.355
(22)      0.41667       -4.192       31.658
(23)      0.45833       35.417      -33.699


       ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster
       | Sponsored by NSF

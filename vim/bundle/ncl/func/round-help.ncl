THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/round.shtml
THE_TITLE:round
   NCL Home > Documentation > Functions > General applied math

round

   Rounds a float or double variable to the nearest whole number.

Prototype

        function round (
                x    : float,    ; or double
                opt  : integer
        )

        return_val [dimsizes(x)] :  (see below for type)

Arguments

   x

   An array of one or more values of any dimensionality.

   opt

     opt=0: return values of the same type as x
     opt=1: return values of type float
     opt=2: return values of type double
     opt=3: return values of type integer

Description

   This function returns results similar to the fortran function "anint";
   that is, it rounds the input to the nearest whole number. It differs in
   that it allows the user to specify the type of the return values. Also,
   missing values are ignored.

See Also

   ceil, floor

Examples

   Example 1

   The one caveat to using this function is that user must be aware that
   if opt=3 is chosen, then the _FillValue
   may be affected. Note: NCL requires that the _FillValue have the same
   type as the parent variable.

   Example 2

  x  = 5.7
  q  = round(x,0)   ; ===> q=6.0  (type float)
  r  = round(x,1)   ; ===> r=6.0  (type float)
  d  = round(x,2)   ; ===> d=6.0  (type double)
  i  = round(x,3)   ; ===> i=6    (type integer)

   Example 2

  x  = (/-5. , -4.7, -4.5, -4.3, -0.8, -0.5, -0.2, -50.6 \
        , 5. ,  4.7,  4.5,  4.3,  0.8,  0.5,  0.2,  50.6 \
        ,-99. /)
  x@_FillValue = -99.

  q  = round(x,0)   ; ===>  (/-5.,-5.,-5.,-4.,-1.,-1., 0.,-51. \
                             , 5., 5., 5., 4., 1., 1., 0., 51. \
                             ,-99. /)

  f  = round(x,1)   ; ===>  (/-5.,-5.,-5.,-4.,-1.,-1., 0.,-51. \
                             , 5., 5., 5., 4., 1., 1., 0., 51. \
                             ,-99. /)

  d  = round(x,2)   ; ===>  (/-5.,-5.,-5.,-4.,-1.,-1., 0.,-51. \
                             , 5., 5., 5., 4., 1., 1., 0., 51. \
                             ,-99. /)

  i  = round(x,3)   ; ===>  (/-5 ,-5 ,-5 ,-4 ,-1 ,-1 , 0 ,-51 \
                             , 5 , 5 , 5 , 4 , 1 , 1 , 0 , 51 \
                             ,-99   /)

   Example 3

   Here is an example where the _FillValue will change.

  x  = (/-5. , -4.7, -4.5, -4.3, -0.8, -0.5, -0.2, -50.6 \
        , 5. ,  4.7,  4.5,  4.3,  0.8,  0.5,  0.2,  50.6 \
        ,-99.9 /)
  x@_FillValue = -99.9

  i  = round(x,3)   ; ===>  (/-5 ,-5 ,-5 ,-4 ,-1 ,-1 , 0 ,-51 \
                             , 5 , 5 , 5 , 4 , 1 , 1 , 0 , 51 \
                             ,-100  /)

   Example 4:

   Like example 3, but assume you want a _FillValue equal to -99. There
   are two approaches:

    1. If the user is certain that in the original x array the value -99
       is unique, then simply change the _FillValue to -99:
  x  = (/-5. , -4.7, -4.5, -4.3, -0.8, -0.5, -0.2, -50.6, \
          5. ,  4.7,  4.5,  4.3,  0.8,  0.5,  0.2,  50.6, \
         -99.9 /)
  x@_FillValue = -99.9   ; original _FillValue

  x@_FillValue = -99.    ; NCL will change all -99.9 to -99.

  i  = round(x,3)   ; ===>  (/-5 ,-5 ,-5 ,-4 ,-1 ,-1 , 0 ,-51, \
                               5 , 5 , 5 , 4 , 1 , 1 , 0 , 51, \
                              -99  /)

    2. If the user is not certain, then some value should be chosen that
       is unique.
  x  = (/-5. , -4.7, -4.5, -4.3, -0.8, -0.5, -0.2, -50.6, \
          5. ,  4.7,  4.5,  4.3,  0.8,  0.5,  0.2,  50.6, \
         -99.9 /)
  x@_FillValue = -99.9     ; original _FillValue

  x@_FillValue = 1234567.  ; NCL will change all -99.9 to 1234567.

  i  = round(x,3)   ; ===>  (/-5 ,-5 ,-5 ,-4 ,-1 ,-1 , 0 ,-51, \
                               5 , 5 , 5 , 4 , 1 , 1 , 0 , 51, \
                             1234567  /)

       Upon return, i@_FillValue = 1234567.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

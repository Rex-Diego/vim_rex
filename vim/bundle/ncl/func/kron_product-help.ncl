THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/kron_product.shtml
THE_TITLE:kron_product
   NCL Home > Documentation > Functions > General applied math

kron_product

   Computes the Kronecker product for two-dimensional matrices.

   [new.gif] Available in version 5.1.0 and later.

Prototype

        function kron_product (
                a [*][*] : numeric,
                b [*][*] : numeric
        )

        return_val  :  float or double

Arguments

   a

   A two-dimensional array dimensioned na1 x na2.
   b

   A two-dimensional array dimensioned nb1 x nb2.

Return value

   The return value will be dimensioned (na1*nb1) x (na2*nb2). The type
   will be double if any of the input is double, and float otherwise.

Description

   This function computes the Kronecker product.

Examples

   Example 1


      a  = (/ (/1,2/) \
            , (/3,4/) /)

      b  = (/ (/0,5/) \
            , (/6,7/) /)

      z = kron_product( a,b )
      print( z )

   The (edited) output is:
     Variable: z
     Number of Dimensions: 2
     Dimensions and sizes:      [4] x [4]

     (0,0)         0
     (0,1)         5
     (0,2)         0
     (0,3)        10

     (1,0)         6
     (1,1)         7
     (1,2)        12
     (1,3)        14

     (2,0)         0
     (2,1)        15
     (2,2)         0
     (2,3)        20

     (3,0)        18
     (3,1)        21
     (3,2)        24
     (3,3)        28


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

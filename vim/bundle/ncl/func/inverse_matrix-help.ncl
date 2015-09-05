THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/inverse_matrix.shtml
THE_TITLE:inverse_matrix
   NCL Home > Documentation > Functions > General applied math

inverse_matrix

   Computes the inverse of a general matrix using LU factorization.

Prototype

        function inverse_matrix (
                A [*][*] : numeric
        )

        return_val [dimsizes(A)] :  float or double

Arguments

   A

   A two-dimensional (N, M) array.

Return value

   An array of the same size, shape and type A.

Description

   Using the LAPACK routines DGETRF and DGETRI, this function computes the
   inverse of a general matrix A(N, M) using the LU factorization method.
   This method inverts U and then computes inv(A) by solving the system
   inv(A) * L = inv(U) for inv(A).

   The returned inverse provides one way of solving the set of equations A
   * x = b (i.e. x = inv(A) * b). Thus, if the inverse is known, the
   vector x can be solved for any b. However, if efficiency is a concern,
   this is not the preferred method (see solve_linsys).

See Also

   solve_linsys

Examples

   Example 1:

   Compute the inverse of a 3 x 3 matrix:
                 1  -1  2
           A =   3   0  1
                 1   0  2

   In NCL:
   a = (/(/1.0, -1.0, 2.0/), (/ 3.0, 0.0, 1.0/), (/1.0, 0.0, 2.0/)/)

   Then:
   aInv = inverse_matrix(a)

      ;
      ;           0   0.4  -0.2
      ;  aInv =  -1    0     1
      ;           0  -0.2   0.6

   print(aInv)

Variable: aInv
Type: float
Total Size: 36 bytes
            9 values
Number of Dimensions: 2
Dimensions and sizes:   [3] x [3]
Coordinates:
(0,0)      0
(0,1)    0.4
(0,2)   -0.2
(1,0)     -1
(1,1)      0
(1,2)      1
(2,0)      0
(2,1)   -0.2
(2,2)    0.6

   The identity matrix (I) is found via I = aInv # a. The "#" operator
   computes the dot product of two arrays.

Errors

   info
          = 0: successful exit

          < 0: if info = -i, the i-th argument had an illegal value

          > 0: if info = i, U(i,i) is exactly zero. The factorization has
          been completed, but the factor U is exactly singular, and
          division by zero will occur if it is used to solve a system of
          equations.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

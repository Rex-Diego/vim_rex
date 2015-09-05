THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/solve_linsys.shtml
THE_TITLE:solve_linsys
   NCL Home > Documentation > Functions > General applied math

solve_linsys

   Computes the solution to a real system of linear equations.

Prototype

        function solve_linsys (
                A [*][*] : numeric,
                B        : numeric
        )

        return_val [dimsizes(B)] :  float or double

Arguments

   A

   A two-dimensional (N, N) coefficient matrix.

   B

   A one- or two-dimensional array containing the right hand side matrix.
   If B is one-dimensional, it must be of length N. If it is
   two-dimensional, it must be B(NRHS, N) where NRHS is the number of
   right hand sides.

Return value

   Returns an array dimensioned the same as B.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function computes the solution to a real system of linear
   equations A * x = B where B may have multiple right-hand-sides. An LU
   decomposition with partial pivoting and row interchange is used to
   factor A as A = P * L * U where P is a permutation matrix, L is the
   unit lower tridiagonalar matrix, and U is the upper triangular matrix.
   The factored form is then used to solve the system of equations.

Examples

   Example 1:

   Solve the system A * x = B where B is one-dimensional:
                 3  2 -1  2           0
           A =   1  4  0  2       B = 0
                 2  1  2 -1           1
                 1  1 -1  3           0


   In NCL:
   A = (/ (/3.0, 2.0, -1.0, 2.0/), \
          (/1.0, 4.0,  0.0, 2.0/), \
          (/2.0, 1.0,  2.0,-1.0/), \
          (/1.0, 1.0, -1.0, 3.0/) /)


   B = (/0.0, 0.0, 1.0, 0.0/)  ; this is treated as a one-dimensional
                               ; column vector (special case)

   x = solve_linsys(A, B)      ; x will be one-dimensional [x(N)]

   Note: the following would also work:
   NRHS    = 1
   N       = 4
   B       = new ((/NRHS,N/), "float")   ; "double" also
   B(0, 0) = 0.0
   B(0, 1) = 0.0
   B(0, 2) = 1.0
   B(0, 3) = 0.0

   Example 2:

   The same as Example 1, but with multiple right hand sides:
   nrhs   = 3
   n      = 4
   b      = new ((/nrhs,n/), "float")   ; "double" also
   b(0,:) = (/0.0, 0.0, 1.0, 0.0/)
   b(1,:) = (/-2.0, 1.0, 3.0, 4.0/)
   b(2,:) = (/2.0, 2.0, 0.0, 0.0/)

   x = solve_linsys(A, B)  ; x will be 2D: x(3, 4)

Errors

   info
          = 0 : successful exit

          < 0: the i-th argument had an illegal value

          > 0: U(i, i) is exactly zero. The factorization has been
          completed, but the factor U is exactly singular, so the solution
          could not be computed.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

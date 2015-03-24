THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/quadroots.shtml
THE_TITLE:quadroots
   NCL Home > Documentation > Functions > General applied math

quadroots

   Determine roots of a quadratic equation [ a*x^2 + b*x + c].

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function quadroots (
                a [1] : numeric,
                b [1] : numeric,
                c [1] : numeric
        )

        return_val [3] :  double if any input is type double, otherwise float

Arguments

   a

   coefficient of x^2
   b

   coefficient of x
   c

   constant term

Return value

   A one-dimensional array of length 3. If the roots are real, the first
   two elements contain the real roots. The third element is set to zero
   and should be ignored. If the roots are complex, the first element
   contains the real part while the second and third elements contain the
   imaginary roots.

Description

   Solves the standard quadratic formula. The discriminant ( b^2-4*a*c )
   and the root type ("real" or "complex") are returned as attributes.

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1: real roots

  q1 = quadroots( 1,  3, -4)   ; x^2 + 3*x -4
  print(q1)                                       ; (1,-4)

  q2 = quadroots 2, -4d0, -3)  ; 2*x^2 -4*x -3
  print(q2)

   The output looks like:
Variable: q1
Type: float
Total Size: 8 bytes
            2 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
Number Of Attributes: 2
  root :          real
  discriminant :        25

(0)      1
(1)     -4
(2)      0                            <== ignore

   and
Variable: q2
Type: double
Total Size: 16 bytes
            2 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
Number Of Attributes: 2
  root :        real
  discriminant :          40

(0)     2.58113883008419
(1     -0.5811388300841898
(2)     0                             <== ignore


   Example 2: complex roots

  q3 = quadroots(-1, -2, -3)   ; -x^2 -2*x -3
  print(q3)

  q4 = quadroots( 1d0,-10, 34) ;  x^2 -10*x +  34
  print(q4)


   yields
Variable: q3
Type: float
Total Size: 12 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
Number Of Attributes: 2
  root :        complex
  discriminant :        -8
(0)     -1
(1)     -1.414214
(2)      1.414214

   So the roots are:
-1 - i 1.414214
and
-1 + i 1.414214

Variable: q4
Type: double
Total Size: 24 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
Number Of Attributes: 2
  root :        complex
  discriminant :         -36
(0)        5
(1)        3
(2)       -3

   So the roots are:
 5 + i 3
and
 5 - i 3


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

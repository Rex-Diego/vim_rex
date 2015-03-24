THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/random_uniform.shtml
THE_TITLE:random_uniform
   NCL Home > Documentation > Functions > Random number generators

random_uniform

   Generates random numbers using a uniform range distribution.

Prototype

        function random_uniform (
                low  [1] : numeric,
                high [1] : numeric,
                N    [*] : byte, short, integer or long
        )

        return_val [dimsizes(N)] :  float or double

Arguments

   low

   Scalar representing low bound (exclusive) on real values to be
   generated.
   high

   Scalar representing high bound (exclusive) on real values to be
   generated.
   N

   Dimensions of the multi-dimensional array to be generated.

   As of version 6.0.0, N can be of type long, allowing dimension sizes
   greater than or equal to 2 gigabytes (GB) on 64-bit systems.

Return value

   Returns an array of random numbers dimensioned the same as N.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function generates an array of random numbers from the range (0,
   1) using a uniform distribution. If the user does not explicitly set
   initial values for seeds via random_setallseed, those initial seeds
   will be set to default values. It is recommended that the user specify
   these seeds. The source of this random number generator is from the
   random section at Netlib. The authors were Brian Brown and James
   Lovato. The official reference is:

     Authors: P. L'Ecuyer and S. Cote
     Title: Implementing a Random Number Package with Splitting
     Facilities
     Journal: ACM Transactions on Mathematical Software 17:1, pp 98-111.

See Also

   random_chi, random_gamma, random_normal, random_setallseed

Examples

   Example 1

   Generate random deviates:
begin
  random_setallseed(36484749, 9494848)               ; Set seeds (suggested, NOT
 required)
  low   = -1.0
  high  =  1.0
  unf   = random_uniform(low, high, (/10, 64, 128/)) ; uniform(10, 64, 128)

end

   Example 2

   Let U(18, 64, 128), and assume the user wishes to perturb these values
   by a max of 1%:
  random_setallseed(363738674, 918273645)   ; Set seeds (suggested, NOT required
)

  low   = 0.99
  high  = 1.01
  dimU  = dimsizes(U)
  unf   = random_uniform(low, high, dimU)   ; uniform(18, 64, 128)
  U     = U * unf                           ; element by element multiply

   Example 3

   Generate 1000 series of length 30 with unique ordering.
  random_setallseed(363738674, 918273645)   ; Set seeds (NOT required)

  nvals = 30
  narr  = 1000

;---Generate 1000 x 30 random numbers
  r = random_uniform(0,1,(/narr,nvals/))  ; random numbers

;---Sorting the values and keeping the indexes gives us random indexes.
  indexes = dim_pqsort(r, 1)              ; use in 30 element segments

;--- concise print for illustration
  do i=0,narr-1
    str = ""
    do j=0,nvals-1
      str = str + " " + indexes(i,j)
    end do
    print("" + str)
  end do

   Sample 'indexes'
(0)      15 16 22 18 23 5 21 12 3 17 0 1 8 11 9 4 20 25 28 2 13 6 27 24 19 26 14
 7 29 10
(0)      1 7 25 9 21 29 8 14 20 11 16 4 5 22 19 23 12 0 27 18 28 24 15 13 26 3 6
 17 2 10
(0)      14 29 4 20 18 22 27 3 24 25 0 9 28 12 6 7 1 15 26 10 23 5 21 19 13 11 1
7 8 2 16
(0)      28 27 1 10 2 0 5 23 4 21 18 17 22 29 13 16 11 26 6 24 15 9 19 14 25 20
3 7 12 8
(0)      20 2 12 11 22 17 25 19 15 4 16 6 18 23 9 13 8 1 27 29 5 28 3 0 14 21 7
24 26 10
(0)      4 15 25 8 10 28 16 21 26 0 14 6 27 24 18 22 7 2 13 17 11 23 9 5 19 20 2
9 3 12 1
(0)      2 7 0 28 10 26 24 19 13 20 29 25 17 14 23 18 27 6 3 5 1 21 16 4 15 9 22
 11 12 8
(0)      17 15 11 24 27 12 14 1 22 6 9 21 5 0 29 28 23 13 3 16 25 8 26 2 20 4 19
 10 18 7
(0)      3 15 27 2 6 21 17 28 16 11 18 26 13 9 24 19 5 8 12 14 7 1 20 25 23 22 0
 29 10 4
[SNIP]


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

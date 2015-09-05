THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/rand.shtml
THE_TITLE:rand
   NCL Home > Documentation > Functions > Random number generators

rand

   Generates a pseudo random number.

Prototype

        function rand (
        )

        return_val [1] :  integer

Return value

   Returns a pseudo random integral value 0 <= return_val <= 32766.

Description

   This function is NCL's original random number generator. To generate
   many different random numbers, the user must loop over the rand
   function the appropriate number of times. This may be inefficient if a
   large sample is required.

See Also

   srand random_setallseed, random_chi, random_gamma, random_normal,
   random_uniform

Examples

   Example 1

   Generates 100 pseudo random integers:

   int_random = new(100, integer)

   do n = 0, 99
      int_random(n) = rand()
   end do

   Example 2

   Generate a three dimensional array of random numbers ranging from -5.0
   to +5.0 (type float). Explicitly set the seed via srand:

   klev =  10
   nlat =  64
   mlon = 128

   low  = -5.0
   high =  5.0
   con  = (high - low) / 32766.0      ; 32766.0 forces a 0.0 to 1.0 range

   x    = new((/klev, nlat, mlon/), float)

   srand(123456789)

   do k = 0, klev - 1
     do n = 0, nlat - 1
       do m = 0, mlon - 1
         x(k, n, m) = low + con * rand()
       end do
     end do
   end do


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

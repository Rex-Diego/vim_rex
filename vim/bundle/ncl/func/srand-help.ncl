THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/srand.shtml
THE_TITLE:srand
   NCL Home > Documentation > Functions > Random number generators

srand

   Establishes a seed for the rand function.

Prototype

        procedure srand (
                seed [1] : integer
        )

Arguments

   seed

   A positive integer value to use as the seed for rand.

Description

   This procedure sets a seed for the rand function.

See Also

   rand

Examples

   Example 1

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

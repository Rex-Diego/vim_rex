THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/random_chi.shtml
THE_TITLE:random_chi
   NCL Home > Documentation > Functions > Random number generators

random_chi

   Generates random numbers using a chi-squared distribution.

Prototype

        function random_chi (
                df [1] : numeric,
                N  [*] : byte, short, integer or long
        )

        return_val [dimsizes(N)] :  float or double

Arguments

   df

   A scalar representing the degrees of freedom of the chi-square
   distribution (0, +infinity).
   N

   Dimensions of the multi-dimensional array to be generated.

   As of version 6.0.0, N can be of type long, allowing dimension sizes
   greater than or equal to 2 gigabytes (GB) on 64-bit systems.

Return value

   Returns an array of random numbers dimensioned the same as N.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function generates an array of random numbers using a chi-squared
   distribution. If the user does not explicitly set initial values for
   seeds via random_setallseed, those initial seeds will be set to default
   values. It is recommended that the user specify these seeds.

   The source of this random number generator is from the random section
   at Netlib. The authors were Brian Brown and James Lovato. The official
   reference is:

     Authors: P. L'Ecuyer and S. Cote
     Title: Implementing a Random Number Package with Splitting
     Facilities
     Journal: ACM Transactions on Mathematical Software 17:1, pp 98-111.

See Also

   random_gamma, random_normal, random_uniform, random_setallseed

Examples

   Example 1

   Generate random deviates:
begin
  random_setallseed(36484749, 9494848)        ; Set seeds (suggested, NOT requir
ed)
  df    = 2.0
  chi   = random_chi(df, 1)                  ; chi is a scalar
end


   �2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

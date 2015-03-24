THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/random_setallseed.shtml
THE_TITLE:random_setallseed
   NCL Home > Documentation > Functions > Random number generators

random_setallseed

   Sets initial seeds for random number generators.

Prototype

        procedure random_setallseed (
                iseed1  : integer,
                iseed2  : integer
        )

Arguments

   iseed1

   Any integer between 1 and 2,147,483,562 (default is 1234567890).
   iseed2

   Any integer between 1 and 2,147,483,398 (default is 123456789).

Description

   This procedure is used to set the state of a random number generator.
   If the user does not explicitly set the seeds, they are set to the
   stated default values. It is recommended that the user specify these
   seeds. The source of this random number seed generator is from the
   random section at Netlib. The authors were Brian Brown and James
   Lovato. The official reference is:

     Authors: P. L'Ecuyer and S. Cote
     Title: Implementing a Random Number Package with Splitting
     Facilities
     Journal: ACM Transactions on Mathematical Software 17:1, pp 98-111.

See Also

   random_chi, random_gamma, random_normal, random_uniform

Examples

   Example 1

   Set seeds for generating random deviates:
begin
  random_setallseed(36484749, 9494848)      ; Set seeds (suggested, NOT required
)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ispan.shtml
THE_TITLE:ispan
   NCL Home > Documentation > Functions > Array creators

ispan

   Creates an array of equally-spaced integer, long, or int64 values.

Prototype

        function ispan (
                start  [1] : integral type,
                finish [1] : integral type,
                stride [1] : integral type
        )

        return_val [*] :  integer, long, or int64

Arguments

   start

   Value at which to start.
   finish

   Value at which to end. Can be less than start.
   stride

   A stride value indicating the spacing of the values between start and
   finish.

Description

   This function returns an array of values beginning at start and ending
   at finish. Each element will be separated by the value of stride. The
   stride must be positive, and start and finish can be any valid
   integers.

   If finish is less than start, then the values will be reversed.

   In version 6.0.0, this function will be upgraded to allow any of the
   input to be any signed integral type (byte, short, int, long, int64).
   Also, the return type will be int, long, or int64, depending on the
   input types.

See Also

   fspan

Examples

   Example 1

   x = ispan (1,10,1)      ; "x" = (/1,2, ..., 10/)
                           ; (10 values)
   y = ispan (-100,100,10) ; "y" = (/-100, -90, ..., 0, 10, ... 90, 100/)
                           ; (21 values)

   Example 2

   To generate a 1D float array, you can use NCL's implicit coercion by
   multiplying the ispan result by a float value.
   mlon = 128
   y = ispan (0,mlon-1,1)*1.  ; y = (/0.,1.,2., ..., 127./) (128 values)

   dlon = 360./mlon
   lon  = ispan(0,mlon-1,1)*dlon  ; lon = (/0, 2.8125, ... , 357.1875/)

   Example 3

   This example shows how you can use long and int64 input.

   This will only work in version 6.0.0 or later. Also, for arrays >= 2
   gigabytes (GB), this will only work on 64-bit systems with enough
   memory.

  i_2_31 = tolong(2^31)   ; = 2 GB
  i_2_32 = toint64(2^32)  ; > 2 GB

;---Create a 1D long (2 GB) array, using long input.
  iil = ispan(1,i_2_31,1)

;---Create a 1D int64 (> 2 GB) array, using int64 input.
  ii64 = ispan(0,i_2_32,1)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sizeof.shtml
THE_TITLE:sizeof
   NCL Home > Documentation > Functions > Variable query

sizeof

   Returns the total size, in bytes, of the input variable.

Prototype

        function sizeof (
                data
        )

        return_val [1] :  integer or long

Arguments

   data

   A variable of any type or dimensionality.

Description

   The sizeof function returns a value that is the size in bytes of the
   data pointed to by the parameter data.

   In versions 6.0.0 or later, this function will return a long if on a
   64-bit system and the value is greater than or equal to 2 gigabytes
   (GB).

   To return the length of a string, don't use this function. Use strlen
   instead.

   For variables like file pointers and graphical objects, this function
   is not very useful as it just returns the size of the pointer that
   points to the file or object.

See Also

   strlen, dimsizes, typeof, new, default_fillvalue, set_default_fillvalue

Examples

   The example below shows how sizeof works for different types and
   dimensionalities:

   Example 1

  carray = new((/2,3/),character)
  sarray = new(5,short)
  iarray = new(1,integer)
  larray = new((/1,2/),long)
  farray = new((/2,3,4,5/),float)
  darray = new((/2,3,4,5/),double)

  print(sizeof(carray))       ; should be 6
  print(sizeof(sarray))       ; should be 10
  print(sizeof(iarray))       ; should be 4
  print(sizeof(larray))       ; should be 8 (or 16 on 64-bit machine)
  print(sizeof(farray))       ; should be 480
  print(sizeof(darray))       ; should be 960

;
; Variable types for which "sizeof" doesn't provide much information.
;
  f    = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/Pstorm.cdf","r")
  plot = new(1,graphic)
  str  = "Comedy is not pretty"     ; quote by Steve Martin

  print(sizeof(f))      ; Should be 4 (or 8 on 64-bit machine)
  print(sizeof(plot))   ; Should be 4 (or 8 on 64-bit machine)
  print(sizeof(str))    ; Should be 4 (or 8 on 64-bit machine)

   Example 2

   Create an array that's larger than 2 GB. This will not work on a 32-bit
   system, or with versions 5.2.x or earlier:

  x =  new(tolong(2^29),float)
  s = sizeof(x)
  print(s)

   Output:

Variable: s
Type: long
Total Size: 8 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:[1]
Coordinates:
(0)   2147483648


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

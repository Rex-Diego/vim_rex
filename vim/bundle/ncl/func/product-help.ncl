THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/product.shtml
THE_TITLE:product
   NCL Home > Documentation > Functions > General applied math

product

   Computes the product of the input.

Prototype

        function product (
                x  : numeric
        )

        return_val [1] :  typeof(x)

Arguments

   x

   An array of any dimensionality.

Return value

   A scalar value of the same type as x

Description

   The product function Returns the product of the input values,
   regardless of dimensionality. It ignores missing values.

See Also

   dim_product, avg, sum, stddev

Examples

   Example 1

   Calculate the number of elements (ne) in an array. Let x(120,5,73,144),
   then use dimsizes to get the size of each dimension:
  ne   = product( dimsizes(x)) ; ===> 120*5*73*144 = 6307200

   Example 2

   In the example below, see how setting the missing value, x@_FillValue,
   changes the product calculation:
  x    = (/ (/1,-99/), (/3,4/), (/-99,6/) /)
  xproduct = product(x)
;
; Before missing value is set, xproduct = 705672.
;
  print(xproduct)

  x@_FillValue = -99
  xproduct = product(x)
;
; After missing value is set, xproduct = 72.
;
  print(xproduct)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

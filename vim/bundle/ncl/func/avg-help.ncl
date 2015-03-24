THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/avg.shtml
THE_TITLE:avg
   NCL Home > Documentation > Functions > General applied math

avg

   Computes the average of a variable regardless of dimensionality.

Prototype

        function avg (
                x  : numeric
        )

        return_val [1] :  float or double

Arguments

   x

   An array of one or more numeric values of any dimensionality.

Return value

   The return value will be a scalar of type double if x is double, and a
   scalar of type float otherwise.

Description

   Returns the average of a variable regardless of dimensionality. avg
   ignores missing values (x@_FillValue). To determine the number of data
   values used to calculate the average use:
   N = num(.not.ismissing(x))

See Also

   dim_avg , dim_stat4

Examples

   Example 1


;
; Create example array
;
  a = (/ (/1,2,3/), (/4,5,6/), (/7,-999,9/)/)
  a@_FillValue = -999

;
; Compute average and the number of non-missing values
;
  average = avg(a)
  n = num(.not.ismissing(a))
  print(average)    ; a scalar numeric value
  print(n)          ; number of non-missing values




   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

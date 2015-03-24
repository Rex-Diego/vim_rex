THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/any.shtml
THE_TITLE:any
   NCL Home > Documentation > Functions > Array query

any

   Returns True if any of the values of its input evaluate as True.

Prototype

        function any (
                logical_array  : logical
        )

        return_val [1] :  logical

Arguments

   logical_array

   A logical array of any dimensionality.

Description

   The any function returns a single logical scalar value if any of the
   non-missing value elements of the logical_array parameter are True or
   can be evaluated as True.

   This function is useful for changing multidimensional results from
   logical expressions into a single scalar value, which is required by
   the if statement. All numeric values can be coerced to a logical value.
   Values that are 0 are interpreted as False and values that are non-zero
   are interpreted as True.

   Use the all function if you want True to be returned only if all of the
   input evaluates as True.

See Also

   all, ind, num where

Examples

   Example 1
  x = new(5,float,-999)
  x = (/1.,2.,-999,4.,5./)

  print(any(x.ge.4))             ; should be True
  print(any(x.lt.0))             ; should be False
  print(any(x.gt.2.and.x.lt.4))  ; should be False

   Example 2
  if(any(ismissing(x))) then
    print("x contains one or more missing values, cannot continue.")
    return
  end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

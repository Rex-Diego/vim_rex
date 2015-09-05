THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/all.shtml
THE_TITLE:all
   NCL Home > Documentation > Functions > Array query

all

   Returns True if all the elements of the input evaluate as True.

Prototype

        function all (
                logical_array  : logical
        )

        return_val [1] :  logical

Arguments

   logical_array

   A logical array of any dimensionality.

Description

   The all function returns a single logical scalar value only if all of
   the non-missing value elements of the logical input parameter are True
   or can be evaluated as True.

   This function is useful for changing multidimensional logical results
   from logical expressions into a single scalar value, which is required
   by the if statement. All numeric values can be coerced to a logical
   value. Values that are 0 are interpreted as False and values that are
   non-zero are interpreted as True.

See Also

   any, ind, num, where

Examples

   Example 1
  x = new(5,float,-999)
  x = (/1.,2.,-999,4.,5./)

  print(all(x.ge.5)   ; should be False
  print(all(x.gt.0.and.x.lt.6))   ; should be True

   Example 2
  if(all(ismissing(x))) then
    print("x contains all missing values, cannot continue.")
    return
  end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

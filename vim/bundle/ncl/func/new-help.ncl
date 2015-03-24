THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/new.shtml
THE_TITLE:new
   NCL Home > Documentation > Functions > Variable manipulators

new

   Creates an NCL variable.

Prototype

        function new (
                dimension_sizes [*] : integer or long,
                vartype             : string,
                parameter
        )

        return_val [dimension_sizes] :  vartype

Arguments

   dimension_sizes

   The dimension sizes of the NCL variable to create.

   As of version 6.0.0, this can be of type long, allowing a dimension
   size greater than or equal to 2 gigabytes (GB) on 64-bit systems.
   vartype

   The type of the NCL variable to create. This can either be a string,
   like "float", or just the word float (without quotes).
   parameter

   (optional)
   The value for parameter can either be a missing value (which becomes
   the _FillValue attribute), or the string "No_FillValue" to indicate
   that no _FillValue attribute is to be created. (The "No_FillValue"
   option was added in version a034.) This is an optional argument, so if
   it is not set, then a default missing value for the variable's type
   will be used.

Description

   new is not an NCL function, but rather an NCL statement. It is being
   included in the function documentation because it behaves very much
   like an NCL function.

   The new statement is used to create a new NCL variable, by giving it
   dimension sizes, the type, and optionally a value for the missing
   value, or no missing value at all. If parameter is not set, then a
   default missing value appropriate for the variable's type will be
   assigned. The variable created will be filled with this missing value.

   If "No_FillValue" is used for the parameter argument, then no
   _FillValue attribute is assigned to the variable, and the values will
   be undefined. This option should only be used if you will be
   initializing the whole array at some point. If a variable was
   previously defined before, and you try to recreate it using new with
   the "No_FillValue" parameter, then the _FillValue attribute and its
   value will be unchanged and the elements of the array now have all
   undefined values.

   Using new is not the only way to create an NCL variable. You can also
   do this with a simple assignment statements and/or literals:
  x = 5.0                                       ; float scalar
  i = (/ (/1,2,3/), (/4,5,6/), (/7,8,9/) /)     ; 3 x 3 integer array
  d = 100000.d                                  ; double scalar
  c = tochar("abcde")        ; character array

   As of NCL version 6.0.0, you can create arrays larger than 2 GB on
   64-bit systems. To this end, dimension_sizes has been upgraded to allow
   a type of "long".

See Also

   dimsizes, typeof, sizeof, delete, destroy, default_fillvalue,
   set_default_fillvalue, NCL "new" statement

Examples

   Example 1

   This example shows how to create some arrays of various types and print
   information about them:

  i = new((/2,3/),"integer")
  x = new(5,float)
  b = new(1,byte)
  printVarSummary(i)
  printVarSummary(x)
  printVarSummary(b)

   Both i and x will have default missing values set (-999/999.0 for
   v5.2.1 and earlier, and -2147483647/9.96921e+36 for v6.0.0 and later).
   The default missing value for b is -127 in v6.0.0 and later. Example 2

   This example shows how to create a double variable and assign a missing
   value of 0.0:
  y = new(5,double,0)
  printVarSummary(y)

   Example 3

   Assume x is some multi-dimensional variable of unknown type and a
   missing value. Assume further that you want to make a copy of this
   variable, but you don't want to assign any values to it just yet:

  xnew = new(dimsizes(x),typeof(x),x@_FillValue)

   Example 4

   This example shows how to create a float array with no _FillValue
   attribute set:

  x = new((/64,128/),float,"No_FillValue")

   The values in x will be undefined.

   Example 5

   This example shows how you can create an array that is larger than 2 GB
   on a 64-bit system. This example will not work on 32-bit systems or
   with NCL versions 5.2.x or earlier:

  lsize = tolong(2^31)       ; 2147483648
  x     = new(lsize,short)

  print(sizeof(x))            ; 8589934592 bytes


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

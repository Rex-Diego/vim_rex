THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/typeof.shtml
THE_TITLE:typeof
   NCL Home > Documentation > Functions > Variable query

typeof

   Returns the string name of the type of the input variable.

Prototype

        function typeof (
                val
        )

        return_val [1] :  string

Arguments

   val

   A variable of any type and dimensionality.

Description

   This function returns the string name of the input type. This is
   especially useful when you need to create a new variable whose type is
   the same as an existing variable's type.

See Also

   getfilevartypes, dimsizes, sizeof, default_fillvalue,
   set_default_fillvalue

Examples

   Example 1

   The following short code snippet shows how to use new, typeof and new
   to create a new variable "y" based on the size and type of another
   variable "x":
  y = new(dimsizes(x),typeof(x))

   Example 2

   This example shows how to use typeof to check the type of a variable
   passed to a function:
function calculate_something(x,delta)
begin
  valid_types = (/"integer","float","double"/)
  if(.not.any(typeof(x).eq.valid_types)) then
    print("calculate_something: Fatal error: x is not the correct type.")
    return(new(1,float))    ; return missing
  end if
. . .
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

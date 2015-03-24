THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/where.shtml
THE_TITLE:where
   NCL Home > Documentation > Functions > Array manipulators

where

   Performs array assignments based on a conditional array.

Prototype

        function where (
                condtnl_expr  ,
                true_value    ,
                false_value
        )

        return_val [dimsizes(condtnl_expr)]

Arguments

   condtnl_expr

   A logical expression or value of any dimensionality.
   true_value

   An array with the same rank and dimension sizes as condtnl_expr, or a
   scalar. For all elements of condtnl_expr that evaluate to True, the
   corresponding element of true_val is inserted into the return value
   array.
   false_value

   An array with the same rank and dimension sizes as condtnl_expr, or a
   scalar. For all elements of condtnl_expr that evaluate to False, the
   corresponding element of false_value is inserted into the return value
   array.

Return value

   The return value has the same dimensionality as condtnl_expr. Its type
   is the same as the type of true_value if false_value has the same type
   as true_value or can be coerced to the type of true_value. Otherwise it
   is the type of false_value if true_value can be coerced to the type of
   false_value. If neither type can be coerced to the other type, an error
   is returned.

Description

   At all locations where condtnl_array evaluates to True, the where
   function inserts the corresponding value of true_value into the return
   array. Likewise, at all locations where condtnl_array evaluates to
   False, this function inserts the corresponding value of false_value.

   See the return value section above for more information about the type
   of the return value.

     Note: if you need to have the indices where a particular expression
     in NCL is True returned to you, then see instead the ind and
     ind_resolve functions.

   If any elements of condtnl_expr are missing (i.e. equal to
   condtnl_array@_FillValue), then the corresponding elements of the
   return array become missing values equal to the missing value of
   whatever type is returned. The missing value is set to
   true_value@_FillValue or false_value@_FillValue, depending on which
   type the return value is coerced to.

   While syntactically different, the NCL where function can operate
   analogous to the Fortran 90 WHERE statement:
  WHERE(x < 0) x = x + 256                     ; f90 WHERE statement
  x = where(x.lt.0, x+256, x)                ; NCL

   More generally it operates like a one-level/one-statement form of the
   Fortran 90 WHERE construct.
  WHERE(z >= pi .and. z < pi2)  then           ; f90 construct
        q = pi*z                               ; True
  ELSE
        q = 0.5*z                              ; False
  END WHERE

  q = where(z.gt.pi .and. z.lt.pi2, pi*z, 0.5*z)   ; NCL

   Caveat: NCL evaluates the entire expression inside the where function,
   which will cause problems if it's an expression NCL would normally fail
   on. For example, if you try to execute:
  yinv = where(y.ne.0, 1./y, 0.)

   and y contains values equal to 0, you will get a fatal error:

  fatal:divide: Division by 0, Can't continue

   There are two approaches to use where.

     * yinv = 1. / where(y.ne.0,y,y@_FillValue)
     * Set y to a _FillValue value where it is equal to 0, and then can do
       the divide:
  y    = where(y.ne.0,y,y@_FillValue)
  yinv = 1. / y

       If you further want to set y back to where it originally contained
       zeros:
  y = where(ismissing(y),0,y)

See Also

   mask, ind, ind_resolve

Examples

   Example 1

   Assume you have a multi-dimensional numeric array x with a missing
   value (x@_FillValue). Use where to take the square root of x only at
   locations where x is positive, and set it to a missing value otherwise:
   xsqrt = where(x.gt.0,sqrt(x),x@_FillValue)

   On some systems, taking the square root of a negative number results in
   a "sqrt: DOMAIN error" message, but it's not a fatal message. You will
   still get the correct results.

   Example 2

   Assume you have a 2-dimensional mask array oro in which 1 represents
   land and 0 represents water. Use where to do two different calculations
   on another variable a, depending on whether you are over land or water:
 x = where(oro.eq.1 , a+273.15, 1.8*a+32)

   Note: for an integer array, any values equal to 0 also evaluate as
   False, so the above expression could also be accomplished with:
 x = where(oro, a+273.15, 1.8*a+32)

   Example 3

   Assume x is a 2-dimensional array with 2-dimensional coordinate arrays
   lat2d and lon2d. To set all values outside some user-specified region
   as specified by latMin, latMax, lonMin, and lonMax, to a missing value,
   use:
    x = f->X
    x@lat2d = f->latitude    ; 2D coordinate arrays
    x@lon2d = f->longitude

    latMin  = -20
    latMax  =  60
    lonMin  = 110
    lonMax  = 270

    x = where((x@lat2d.ge.latMin .and. x@lat2d.le.latMax  .and. \
               x@lon2d.ge.lonMin .and. x@lon2d.le.lonMax), x, x@_FillValue)

   Example 4

   Say you have two multi-dimensional arrays of the same size, v1 and v2.
   To do an element-by-element minimum or maximum between the two:
   vmin = where(v1.lt.v2,v1,v2)
   vmax = where(v1.gt.v2,v1,v2)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

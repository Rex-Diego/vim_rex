THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/delete.shtml
THE_TITLE:delete
   NCL Home > Documentation > Functions > Variable manipulators

delete

   Deletes variables, attributes, and coordinate variables.

Prototype

        procedure delete (
                data
        )

Arguments

   data

   A variable of any type or dimensionality. As of V6.0.0, this can be a
   list of variables. See the examples section below.

Description

   This procedure is used to delete variables, attributes, and coordinate
   variables from NCL. delete does not work for deleting file variables,
   file attributes, or file coordinate variables. This procedure is
   especially useful if you want to reuse a variable, but the new values
   and/or types are different than the original variable.

   When a variable is passed to delete, all of the memory associated with
   the variable's value and its reference in the symbol table are removed.
   If an attribute or coordinate variable is passed in, it is deleted from
   the variable it belongs to.

   Note that if the variable being deleted is an object (like a plot
   object or a workstation object) and the variable contains the only
   reference to that object, the object will be destroyed.

   If the workstation object is a PS, PDF, or NCGM file, then, delete has
   the added benefit of causing the file to be closed properly, if for
   some reason you need to exit the script early, but want to close the
   workstation properly.

   See destroy for the ability to destroy objects without deleting the
   variable they point to.

   Deleting multiple variables: in version 6.0.0-beta, you can delete
   multiple variables of mixed types and sizes by using the special syntax
   "[/" and "/]" around the variables you want to delete. See example 4
   below.

See Also

   new, destroy

Examples

   Example 1

  x = (/1,2,3,4,5/)

  delete(x)                 ; The delete is necessary because x
  x = (/1.,2.,3.,4.,5./)    ; was originally an integer array.

   Example 2

  x = (/1,2,3,4,5/)

  delete(x)          ; The delete is necessary because x
  x = (/1,2,3,4/)    ; was originally an array of 5 elements.

   Example 3

   Assume x is a large 4D array with named dimensions "lat", "lon", "lev",
   and "time", and you want to reorder it to "time", "lev", "lat", and
   "lon". If you don't need to keep the original x variable around, then
   delete it:
  xnew = x(time | :, lev | :, lat | :, lon :)
  delete(x)

   Example 4

   In alpha-test mode: to delete multiple variables, you can use the
   special "list" type to create a list of variables, and pass this to
   delete:
  lat  = fspan(-90,90,64)
  lon  = fspan(-180,180,128)
  data = random_uniform(-10,10,(/10,20,30/))
  varnames = (/"T","P","U","V"/)    ; 1D string array
  . . .
  delete([/data,varnames,lat,lon/])

  print(lon(0))    ; This would produce an error that "lon" is undefined


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

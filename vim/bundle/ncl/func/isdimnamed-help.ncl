THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isdimnamed.shtml
THE_TITLE:isdimnamed
   NCL Home > Documentation > Functions > Metadata routines

isdimnamed

   Returns True if variable dimensions have names in given variable.

Prototype

        function isdimnamed (
                var       ,
                dim_nums  : integer
        )

        return_val  :  logical

Arguments

   var

   A variable of any type and dimensionality.
   dim_nums

   A scalar or 1D array of integers representing dimension numbers.

Description

   For each element in the dim_nums list, isdimnamed returns True if it is
   the number of a dimension that is named in variable var, and False
   otherwise.

   The input values may be in any order and the output values correspond
   one for one with the input order. As a special case, if dim_nums is set
   to -1, then for each dimension of var (and in the order of its
   dimensions), a True or False is returned indicating if the dimension is
   named.

   If var is not a variable, then a single missing value is returned.

See Also

   isatt, iscoord, isdim

Examples

   Example 1

   Assume x is a four-dimensional array dimensioned ntime x nlev x nlat x
   nlon, with dimensions names "time", "lev", "lat", "lon". The following
   code snippet will return isname = (/True,True,True,True/):

  ndims  = dimsizes(dimsizes(x))                  ; = 4
  isname = isdimnamed(x,ispan(0,ndims-1,1))

   The above code snippet could have also be done using the special "-1"
   value for the second argument of isdimnamed:

  isname = isdimnamed(x,-1)

   Example 2

   The following code snippet will return isname = (/False,True/):

  w      = (/(/(/1.,2.,3/),(/4.,5.,6./)/),(/(/6.,5.,4/),(/3.,2.,1./)/)/)
  w!0    = "z"
  isname = isdimnamed(w,(/1,0/))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

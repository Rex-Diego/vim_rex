THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/closest_val.shtml
THE_TITLE:closest_val
   NCL Home > Documentation > Functions > Array query

closest_val

   Finds the index value in a monotonically increasing one dimensional
   array closest to a desired value.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function closest_val (
                xval [1] : numeric,
                x    [*] : numeric
        )

        return_val  :  integer

Arguments

   xval

   A scalar specifying the value.
   x

   A one-dimensional, monotonically increasing one dimensional array.

Return value

   A scalar integer.

Description

   Finds the index of the value in a one dimensional monotonically
   increasing array closest to a desired value. Note this function only
   works with monotonically increasing arrays (e.g. a pos/neg latitude
   array will not work) because qsort is used to order the array from
   small to large.

   This function is rather limited in application. Example 2 below
   illustrates a function that will find the index of the closest value
   within an arbitrarily ordered one dimensional array.

See Also

   ind, minind, maxind, ind_resolve

Examples

   Example 1
     value2check = 18.382
     array2check = (/17.0 17.5 18.0 18.5/)
     index       = closest_val(value2check,array2check)
     print(index)

     index(0) = 3

   Example 2 This will return one or more indices of the value closest to
   the user specified value from an arbitrarily ordered array. this is
   contrasted with that returned by closest_val which operates on a
   monotonically increasing array.
function closest_val_AnyOrder(xVal[1]:numeric, x:numeric)
local xAbsDif, xMinVal, iClose
begin
  xAbsDif = abs(xVal-x)
  xMinVal = min(xAbsDif)
  iClose  = (ind(xAbsDif.eq.xMinVal))
  return(iClose)   ; original doc says "first occurence"
end

begin
  x     = random_uniform(0,20, 10)
  xVal  = 9.14157
  k     = closest_val_AnyOrder( xVal, x)

  xMono = x                           ; copy of original
  qsort( xMono )   ; after sort into ascending order

  i     = closest_val ( xVal, xMono)

  print(x+"     "+xMono)
  print("xVal="+xVal+":     i="+i+"  k="+k)
end

   The output is:
          x           xMono
(0)     6.47421     3.07922
(1)     6.48784     5.7746
(2)     9.86775     6.47421
(3)     5.7746      6.48784
(4)     7.06013     6.50989
(5)     3.07922     6.80159
(6)    11.3242      7.06013
(7)    16.4144      9.86775
(8)     6.50989    11.3242
(9)     6.80159    16.4144

(0)     xVal=9.14157:     i=7   k=2

   If it is desired to return only one index then use
   return(iClose(0))

   or, one can create the following function
function closest_val_AnyOrder(xVal[1]:numeric, x:numeric)
local xAbsDif, xMinVal, iClose
begin
  xAbsDif = abs(xVal-x)
  iClose  = minind(xAbsDif)
  return(iClose)   ; original doc says "first occurence"
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

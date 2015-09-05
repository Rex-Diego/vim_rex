THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/local_min_1d.shtml
THE_TITLE:local_min_1d
   NCL Home > Documentation > Functions > Array query

local_min_1d

   Determines the relative minima for a 1-dimensional array.

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function local_min_1d (
                x     [*] : numeric,
                cyclic    : logical,
                delta [1] : numeric,
                iopt  [1] : integer
        )

Arguments

   x

   A one-dimensional (1D) numeric array.
   cyclic

   A logical value indicating if x is cyclic [=True] or not [=False].
   delta

   Tolerance level (negative). If values are within delta of surrounding
   values it will not be counted as a local minimum value.
   iopt

   An integer value indicating what is to be returned. iopt=0 means return
   the minimum values. iopt.ne.0 means return the indices [subscripts]
   where minimum values occured.

Return value

   If iopt=0 then a 1D array containing the relative minima is returned.
   Otherwise a 1D array containing the indices (subscripts) where the
   minima are returned.

Description

   Each element of x is checked against adjacent points to see if the
   difference exceeds delta.

See Also

   local_max_1d

Examples

   Example 1
           qmin = local_min_1d(q, False, -0.25, 0)
or
           imin = local_min_1d(q, False, -0.25, 1)
           if (.not.ismissing(imin)) then
               qmin = q(imin)
               zmin = z(imin)   ; z where q is at a minimum
           end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/local_max_1d.shtml
THE_TITLE:local_max_1d
   NCL Home > Documentation > Functions > Array query

local_max_1d

   Determines the relative maxima for a 1-dimensional array.

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function local_max_1d (
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

   Tolerance level (positive). If values are within delta of surrounding
   values it will not be counted as a local maximum value.
   iopt

   An integer value indicating what is to be returned. iopt=0 means return
   the maximum values. iopt.ne.0 means return the indices [subscripts]
   where maximum values occured.

Return value

   If iopt=0 then a 1D array containing the relative maxima is returned.
   Otherwise a 1D array containing the indices (subscripts) where the
   maxima are returned.

Description

   Each element of x is checked against adjacent points to see if the
   difference exceeds delta.

See Also

   local_min_1d

Examples

   Example 1
           qmax = local_max_1d(q, False,  0.25, 0)
or
           imax = local_max_1d(q, False,  0.25, 1)
           if (.not.ismissing(imax)) then
               qmax = q(imax)
               zmax = z(imax)   ; z where q is at a maximum
           end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

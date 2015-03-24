THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/symMinMaxPlt.shtml
THE_TITLE:symMinMaxPlt
   NCL Home > Documentation > Functions > Graphics routines

symMinMaxPlt

   Calculates the minimum/maximum values for a variable and uses
   nice_mnmxintvl to calculate the symmetric contour interval.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure symMinMaxPlt (
                x          : numeric,
                ncontours  : integer,
                outside    : logical,
                res        : logical
        )

Arguments

   x

   A numeric array of any dimensionality.
   ncontours

   An integer scalar value indicating the number of contours desired.
   outside

   A logical value indicating whether the contour values fall just outside
   or just inside the calculated min and max values. Set to True if
   outside, and False otherwise.
   res

   The resource variable containing all the plot modifications. For
   example:
  res = True
  res@tiMainString = "title"

Description

   This procedure automatically calculates the minimum and maximum values
   for a variable and then uses nice_mnmxintvl to calculate the symmetric
   contour interval and sets the resources for the user. This procedure
   should be used with white-in-the-middle color tables.

   The contour intervals contained within the resource variable res will
   be modified.

See Also

   nice_mnmxintvl

Examples

   For an application example, see:
     * color_15.ncl (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

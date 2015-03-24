THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dtrend_leftdim.shtml
THE_TITLE:dtrend_leftdim
   NCL Home > Documentation > Functions > General applied math

dtrend_leftdim

   Estimates and removes the least squares linear trend of the leftmost
   dimension from all grid points and retains meta data.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dtrend_leftdim (
                y               : numeric,
                return_info [1] : logical
        )

        return_val [dimsizes(y)] :  numeric

Arguments

   y

   An array with one or more dimensions, nominally, (time),
   (time,lat,lon), etc.
   return_info

   A logical scalar controlling whether attributes corresponding to the
   y-intercept and slope are attached to return_val. True = attributes
   returned. False = no attributes returned.

Return value

   An array of the same size as y. Double if y is double, float otherwise.
   Two attributes (slope and y_intercept) may be attached to return_val if
   return_info = True. These attributes will be one-dimensional arrays if
   y is one-dimensional. If y is multi-dimensional, the attributes will be
   the same size as y . Double if return_val is double, float otherwise.
   You access the attributes through the @ operator:
print(return_val@slope)
print(return_val@y_intercept)

Description

   This is a utility function that behaves like dtrend/dtrend_n, except it
   retains metadata.

   Before version 5.2.0, this function (a) reordered the input array, y;
   (b) used dtrend to detrend; and, (c) returned to the original dimension
   order. For version 5.2.0 and later, this function uses dtrend_n to
   avoid having to reorder the data.

See Also

   dtrend_n, dtrend, dtrend_msg_n, dtrend_msg

Examples

   Example 1

   Let y be three-dimensional array with nominal dimensions (time, lat,
   lon).
  yDtrend = dtrend_leftdim(y,False)

   The return array will have the same ordering and wiil retain meta data.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

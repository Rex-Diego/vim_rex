THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/rmInsufData.shtml
THE_TITLE:rmInsufData
   NCL Home > Documentation > Functions > General applied math

rmInsufData

   Sets all instances (i.e. time) of a grid point to missing if a
   user-prescribed percentage of points is missing.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function rmInsufData (
                x        : numeric,
                percent  : float
        )

        return_val [dimsizes(x)] :  typeof(x)

Arguments

   x

   An array of any dimensionality. Time is assumed to be the rightmost
   dimension.
   percent

   The threshold percentage to compare against (value between 0 and 1).

Return value

   The results are returned in an array of the same type and
   dimensionality as x.

Description

   For each index of dimensions 0...n-2, this function sets the n-1th
   (rightmost) dimension of input array x to missing (_FillValue) if a
   user prescribed percentage of data is missing.

   For example, taking example array y, dimensioned (lat,lon,time):
   z = rmInsufData(y,.5)

   If in y(0,0,:), 41% of the data is set to _FillValue, then y(0,0,:)
   will equal z(0,0,:). However, if in y(0,1,:), 52% of the data is set to
   _FillValue, then z(0,1,:) will be set to missing (=z@_FillValue).

   This function can be useful if one is looking at data with a large
   number of missing data, and one does not want to include those grid
   points that have too much missing data in upcoming calculations.

   Note that you can use it to overwrite the original array:
   y = rmInsufData(y,0.75)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

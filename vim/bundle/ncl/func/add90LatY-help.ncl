THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/add90LatY.shtml
THE_TITLE:add90LatY
   NCL Home > Documentation > Functions > Lat/Lon functions

add90LatY

   Adds two fake pole points (90S and 90N) to the leftmost dimension of
   the given data.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function add90LatY (
                Data [*][*] : numeric
        )

        return_val [*][*] :  typeof(Data)

Arguments

   Data

   A 2-dimensional array with latitude as the leftmost dimension.

Return value

   The results are returned in an array of the same type as Data, and with
   dimensions ny+2 x nx where ny x nx are the dimensions of Data.

Description

   This function adds two fake pole points (i.e. 90S and 90N) to data
   where there are no pole points to get nice round -90 (90S) and 90 (90N)
   points. It's assumed that the "y" (leftmost dimension) coordinate is
   latitude. Missing values are assigned to the data for these added
   points.

See Also

   add90LatX

Examples

   For an application example, see:
     * "h_time_4.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

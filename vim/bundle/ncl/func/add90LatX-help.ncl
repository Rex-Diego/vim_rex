THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/add90LatX.shtml
THE_TITLE:add90LatX
   NCL Home > Documentation > Functions > Lat/Lon functions

add90LatX

   Adds two fake pole points (90S and 90N) to the rightmost dimension of
   the given data.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function add90LatX (
                Data [*][*] : numeric
        )

        return_val [*][*] :  typeof(Data)

Arguments

   Data

   A 2-dimensional array with latitude as the rightmost dimension.

Return value

   The results are returned in an array of the same type as Data, and with
   dimensions ny x nx+2 where ny x nx are the dimensions of Data.

Description

   This function adds two fake pole points (i.e. 90S and 90N) to data
   where there are no pole points to get nice round -90 (90S) and 90 (90N)
   points. It's assumed that the "x" (rightmost dimension) coordinate is
   latitude. Missing values are assigned to the data for these added
   points.

See Also

   add90LatY

Examples

   For an application example, see:
     * "h_lat_3.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

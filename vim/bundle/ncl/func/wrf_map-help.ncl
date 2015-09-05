THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_map.shtml
THE_TITLE:wrf_map
   NCL Home > Documentation > Functions > WRF, Graphics routines

wrf_map

   Creates a map background for ARW WRF model data.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_map (
                wks      : graphic,
                nc_file  : file,
                res      : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   An NCL Workstation identifier. The identifier is one returned either
   from calling gsn_open_wks or calling create to create a Workstation
   object.
   nc_file

   Reference to an input netCDF file opened with addfile.
   res

   A variable containing an optional list of plot resources, attached as
   attributes.

Return value

   A scalar id of the map created is returned.

Description

   This function creates a map background for any ARW WRF projection.

   You can use the res variable to set some optional attributes for
   customizing the map:
     * ZoomIn - default is False
       If this resource is set to True, then this indicates you want to
       zoom in on the map. You need to further set these special
       attributes:
          + Ystart,Xstart - default is (0,0)
            Set this pair to the index values in the 2-dimensional
            latitude/longitude arrays that represents the minimum
            latitude/longitude value you want to zoom in on.
          + Yend,Xend - default is (nlat-1,nlon-1) Set this pair to the
            index values in the 2-dimensional latitude/longitude arrays
            that represents the maximum latitude/longitude value you want
            to zoom in on.
       The above four index values can be calculated using
       wrf_user_ll_to_ij.
       Here's an example of using these resources.

   wrf_map is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   WRF-related questions should be sent to wrfhelp@ucar.edu.

See Also

   wrf_map_overlays, wrf_contour, wrf_vector, wrf_user_ll_to_ij,
   wrf_map_resources

Examples

   Example 1

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  wks = gsn_open_wks("x11","test")

  map = wrf_map(wks,a,True)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

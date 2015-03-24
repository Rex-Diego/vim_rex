THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_user_latlon_to_ij.shtml
THE_TITLE:wrf_user_latlon_to_ij
   NCL Home > Documentation > Functions > WRF

wrf_user_latlon_to_ij

   Finds the nearest model grid indices (i,j) to the specific location
   (deprecated).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_user_latlon_to_ij (
                nc_file    : file,
                latitude   : numeric,
                longitude  : numeric
        )

        return_val [2] :  integer

Arguments

   nc_file

   Reference to an input netCDF file opened with addfile.
   latitude
   longitude

   Scalars for specific latitude,longitude points. If the input values are
   outside the model domain, then the appropriate return values will be
   set to missing (-999).

Return value

   An integer array with 2 elements that holds the closest y/x position to
   the input latitude/longitude. The first element will be associated with
   latitude, and the second with longitude.

Description

   ** Note: As of version 5.1.0, this function is obsolete. Use
   wrf_user_ll_to_ij instead.

   This function locates the closest y/x point to the input
   latitude/longitude. If the input values are outside the model domain,
   then the appropriate return values will be set to the default missing
   value for an integer (-999 for versions 5.2.x and earlier, -2147483647
   for versions 6.x and later).

   wrf_user_latlon_to_ij is part of a library of functions and procedures
   in WRFUserARW.ncl written to help users plot ARW WRF model data.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_latlon_to_ij

Examples

   Example 1

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  loc  = wrf_user_latlon_to_ij(a, 40.0, -100.0)
  print("Y/X location is: " +loc)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

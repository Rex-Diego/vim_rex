THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_user_list_times.shtml
THE_TITLE:wrf_user_list_times
   NCL Home > Documentation > Functions > WRF, File IO

wrf_user_list_times

   Extracts the list of available times in the ARW WRF model output.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_user_list_times (
                file_handle  : file or list [list added in V6.0.0]
        )

        return_val [*] :  string

Arguments

   file_handle

   Reference to an input netCDF file opened with addfile, or, as of
   V6.0.0, can be a list of NetCDF files opened with addfiles.

Return value

   A list of available times in the input file.

Description

   Extract the times in the input file(s).

   wrf_user_list_times is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_getvar, wrf_user_ij_to_ll, wrf_user_intrp2d, wrf_user_intrp3d,
   wrf_user_list_times, wrf_user_ll_to_ij, wrf_user_unstagger

   See the full list of WRF functions.

Examples

   Example 1

   Get the times from a single WRF ARW file:

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  times  = wrf_user_list_times(a)  ; get times in the file
  ntimes = dimsizes(times)         ; number of times in the file

  print("There are " +ntimes+ " times in this file")
  print( times )

   Example 2

   As of NCL V6.0.0, you can get the times from a list of WRF ARW NetCDF
   files:

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  files = systemfunc("ls -1 wrfout_d01_2000*") + ".nc"
  a = addfiles(files,"r")

  times  = wrf_user_list_times(a)  ; get times in the file
  ntimes = dimsizes(times)         ; number of times in the file(s)

  print("There are " +ntimes+ " times in this file")
  print( times )

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

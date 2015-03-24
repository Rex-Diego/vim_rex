THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_user_unstagger.shtml
THE_TITLE:wrf_user_unstagger
   NCL Home > Documentation > Functions > WRF, Interpolation

wrf_user_unstagger

   Unstaggers an input variable along a specified dimension.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_user_unstagger (
                varin      : numeric,
                unstagDim  : string
        )

        return_val  :  float or double

Arguments

   varin

   Variable that needs to be unstaggered. Must be at least a 2 dimensional
   variable with the rightmost dimensions ny x nx, or a 3 dimensional
   variable with rightmost dimensions nz x ny x nz to unstagger along the
   "Z" dimension.
   unstagDim

   Along which dimension must the variable be unstaggered. Options are
   "X", "Y" or "Z".

Description

   Note: There's a bug in NCL version 5.1.0 of the "WRFUserARW.ncl" file
   that causes this function to not work with output files from metgrid,
   if you are trying to access the diagnostics "ua" and "va". If you need
   a fix, the best thing to do is download a newer version of NCL, since
   V5.1.0 is a few years old. Otherwise, you can download a fixed version
   of WRFUserARW.ncl and load this file instead of
   "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl".

   A variable unstaggered along the unstagDim. The return dimension will
   be one less in the unstaggered dimension.

   wrf_user_unstagger is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   See the full list of WRF functions.

Examples

   Example 1

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")


  U = a->U
  ua = wrf_user_unstagger(U,U@stagger)


   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

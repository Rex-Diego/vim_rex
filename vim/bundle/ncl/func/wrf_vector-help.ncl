THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_vector.shtml
THE_TITLE:wrf_vector
   NCL Home > Documentation > Functions > WRF, Graphics routines

wrf_vector

   Creates a vector plot from ARW WRF model output.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_vector (
                nc_file       : file,
                wks           : graphic,
                data_u [*][*] : numeric,
                data_v [*][*] : numeric,
                res           : logical
        )

        return_val [1] :  graphic

Arguments

   nc_file

   Reference to an input netCDF file opened with addfile.
   wks

   An NCL Workstation identifier. The identifier is one returned either
   from calling gsn_open_wks or calling create to create a Workstation
   object.
   data_u

   A two-dimensional array of the U component of the wind.
   data_v

   A two-dimensional array of the V component of the wind.
   res

   A variable containing an optional list of plot resources, attached as
   attributes.

Return value

   A scalar id of the plot created is returned.

Description

   This function creates a vector plot (but does not draw it). To draw the
   plot, see the example below.

   If data has a _FillValue attribute, this value will be used as a
   missing value.

   If data_u has a "description" attribute, this value will be used in the
   plot title. (See description of "FieldTitle" attribute below.)

   This function recognizes some special resources that can be attached as
   attributes to res:

     * NumVectors - this defaults to 25. If this resource is set along
       with vpWidthF, then these two values will be used to determine
       values for vcMinDistanceF and vcRefLengthF
       (opts@vpWidthF/opts@NumVectors). Otherwise, these two resources
       will default to 0.02.
     * FieldTitle - This becomes the main title of the vector plot. If not
       set, then the "description" attribute of the data_u variable will
       be used, if available.
     * SubFieldTitle - if set, this will be appended to the FieldTitle
       title with a space between the two.
     * UnitLabel - if set, this will be appended to the existing
       FieldTitle title in parentheses. If not set, the "units" attribute
       of the data_u variable will be used, if available.
     * PlotLevelID - if set, this will be appended to the existing
       FieldTitle title with an " at " between the two. If not set, the
       "PlotLeveID" attribute of the data_u variable will be used, if
       available.

   The final main title could look something like "FieldTitle
   SubFieldTitle (UnitLabel) at PlotLevelID".

   Other vector resources are internally set by this routine:

     * vcGlyphStyle - "WindBarb"
     * vcWindBarbColor - "black"
     * vcRefAnnoOn - False (default is normally True)
     * vcMinFracLengthF - 2.0

   wrf_vector is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   WRF-related questions should be sent to wrfhelp@ucar.edu.

See Also

   wrf_contour, wrf_map_overlays, wrf_overlays, wrf_map

Examples

   Example 1

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  wks = gsn_open_wks("x11","test")

  u10 = wrf_user_getvar(a,"U10",0)   ; U component of the wind at 10m
  v10 = wrf_user_getvar(a,"V10",0)   ; V component of the wind at 10m

  res = True
  res@gsnDraw  = True    ; Forces the plot to be drawn
  res@gsnFrame = True    ; Frame advance
  vector = wrf_vector(a,wks,u10,v10,res)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

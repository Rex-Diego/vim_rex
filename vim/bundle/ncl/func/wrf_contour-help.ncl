THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_contour.shtml
THE_TITLE:wrf_contour
   NCL Home > Documentation > Functions > WRF, Graphics routines

wrf_contour

   Creates a contour plot from ARW WRF model output.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_contour (
                nc_file     : file,
                wks         : graphic,
                data [*][*] : numeric,
                res         : logical
        )

        return_val [1] :  graphic

Arguments

   nc_file

   Reference to an input netCDF file opened with addfile.
   wks

   An NCL Workstation identifier. The identifier is one returned either
   from calling gsn_open_wks or calling create to create a Workstation
   object.
   data

   A two-dimensional array to be contoured.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. See description section below for more information.

Return value

   A scalar id of the plot created is returned.

Description

   This function creates contour plot (but does not draw it). To draw the
   plot, see the example below.

   If data has a _FillValue attribute, this value will be used as a
   missing value.

   If data has a "description" attribute, this value will be used in the
   plot title.

   This function recognizes some special resources that can be attached as
   attributes to res:

     * ContourParameters - this resource can either be a scalar that
       represents the contour level spacing, or it can be an array of
       three elements that represent the minimum level, the maximum level,
       and the level spacing. This resource is not recognized by any of
       the gsn_xxxx plotting routines.
     * gsnContourZeroLineThicknessF - sets the thickness of the zero
       contour line. The default for this routine is 2.0 (when using any
       of the gsn_xxx routines, the default is 1.0)
     * gsnContourNegLineDashPattern - sets the line style of the zero
       contour line. The default for this routine is 1, which is a dashed
       line (see the dash pattern table for more options). When using any
       of the gsn_xxx routines, the default is 0 (a solid line).
     * FieldTitle - This becomes the main title of the vector plot. If not
       set, then the "description" attribute of the data_u variable will
       be used, if available.
       This also becomes part of the "information label" on the contour
       plot.
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

   To make the labelbar vertical instead of horizontal, set these two
   resources:
res@lbOrientation = "vertical"
res@pmLabelBarSide = "right"

   wrf_contour is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   WRF-related questions should be sent to wrfhelp@ucar.edu.

See Also

   wrf_vector, wrf_map_overlays, wrf_overlays, wrf_map

Examples

   Example 1

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  wks = gsn_open_wks("x11","test")

  ter = wrf_user_getvar(a,"HGT",0)   ; Get terrain height for time 0

  res = True
  res@cnFillOn  = True
  res@gsnDraw   = True    ; Forces the plot to be drawn
  res@gsnFrame  = True    ; Frame advance
  contour = wrf_contour(a,wks,ter,res)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

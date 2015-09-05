THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_contour.shtml
THE_TITLE:gsn_contour
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_contour

   Creates and draws a contour plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_contour (
                wks [1] : graphic,
                data    : numeric,
                res [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   data

   The data to contour; must be one or two-dimensional.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the contour plot created is returned. The id of the data
   object is also returned as an attribute called data. This is useful if
   you want to use setvalues to change some data options after this
   function has been called.

Description

   This function creates and draws a contour plot on the given
   workstation.

   If data is two-dimensional, then the leftmost dimension is represented
   on the Y axis, and the rightmost dimension on the X axis.

   If data is one-dimensional, then res@sfXArray and res@sfYArray must
   also be set to one-dimensional arrays of the same length, and a
   triangulation algorithm will be used to generate the contours.

   If data has a _FillValue attribute, this value will be used as a
   missing value. If data has a long_name attribute, this value will be
   used as the main title.

   You should use gsn_csm_contour if you want a more customized contour
   plot and/or if your data has coordinate arrays.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_contour_map
   Special gsn resources

Examples

   For some application examples, see:
     * "zonal_4.ncl" (view example)
     * "ocean_4.ncl" (view example)

   See also the suite of gsn_contour examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

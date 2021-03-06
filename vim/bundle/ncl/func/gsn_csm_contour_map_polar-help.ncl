THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_contour_map_polar.shtml
THE_TITLE:gsn_csm_contour_map_polar
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_contour_map_polar

   Creates and draws a contour plot over a polar stereographic map.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_contour_map_polar (
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

   The data for the contour plot. It must be two-dimensional, where the
   leftmost dimension will be represented on the Y (latitude) axis, and
   the rightmost dimension represented on the X (longitude) axis.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the map created is returned. The id of the contour plot
   is returned as an attribute called contour, and the id of the data is
   returned as an attribute called data. This is useful if you want to use
   setvalues to change some data or contour options after this function
   has been called.

Description

   This function creates and draws a contour plot over a polar
   stereographic map projection on the given workstation. The default is
   to show only the northern hemisphere, unless the special resource
   gsnPolar is set to "SH".

   This function puts special longitude labels around the polar map. These
   labels can be controlled only through a limited set of gsnPolar*
   resources. To turn off the labels completely, set the resource
   gsnTickMarksOn to False.

   In order for the contours to be overlaid correctly on the map, please
   see the document "Overlaying data on a map".

   The special resource gsnAddCyclic will be set to True so that a cyclic
   point will be added to the data. Set this resource to False if your
   data is not cyclic, or if you have already added the cyclic point in
   another fashion. If you see this error when you run your script:

warning:ScalarFieldSetValues: 2d coordinate array sfXArray has an incorrect dime
nsion size: defaulting sfXArray
warning:ScalarFieldSetValues: 2d coordinate array sfYArray has an incorrect dime
nsion size: defaulting sfYArray

   then try setting gsnAddCyclic to False.

   If data has a _FillValue attribute, this value will be used as a
   missing value.

   If the resource cnFillOn is set to True, then the following will happen
   automatically:
     * a labelbar will be automatically added (default horizontal)
     * contour line labels will be turned off
     * the contour information label will be turned off

   If you want to turn the labelbar off, set lbLabelBarOn to False.

   For the map, the following will happen automatically:
     * the continents will be colored gray
     * the continental outlines will be turned off
     * the longitude locations will be labeled

   If data has an attribute called "long_name", and gsnLeftString hasn't
   explicitly been set, then the value of this attribute is used for the
   left string title.

   If data has an attribute called "units", and gsnRightString hasn't
   explicitly been set, then the value of this attribute is used for the
   right string title.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_contour, gsn_csm_contour, gsn_csm_contour_map,
   gsn_csm_contour_map_ce
   Special gsn resources

Examples

   For some application examples, see:
     * "polar_1.ncl" (view example)
     * "color_4.ncl" (view example)


   �2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

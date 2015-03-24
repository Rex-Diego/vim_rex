THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_contour_map_overlay.shtml
THE_TITLE:gsn_csm_contour_map_overlay
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_contour_map_overlay

   Creates and draws two contour plots over a map.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_contour_map_overlay (
                wks  [1] : graphic,
                data1    : numeric,
                data2    : numeric,
                res1 [1] : logical,
                res2 [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   data1

   The first set of data to contour; must be one or two-dimensional.
   data2

   The second set of data to contour; must be one or two-dimensional.
   res1

   A variable containing an optional list of plot resources, attached as
   attributes, to be applied to the first set of contour data and/or the
   map plot. Set this value to True if you want the attached attributes to
   be applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.
   res2

   A variable containing an optional list of plot resources, attached as
   attributes, to be applied to the second set of contour data. Set to
   True if you want the attached attributes to be applied, and False if
   you either don't have any resources to set, or you don't want the
   resources applied. Not that this resource is for the second contour
   plot only, and should not have any map ("mp") resources attached to it.

Return value

   A scalar id of the map created is returned. The id of the first contour
   plot is returned as an attribute called contour and the id of the
   second contour plot as an attribute called contour2. This is useful if
   you want to use setvalues to change some data or contour options after
   this function has been called.

Description

   This function creates and draws two separate contour plots over a map
   on the given workstation. The default projection is a cylindrical
   equidistant, which you can override by setting the mpProjection
   resource.

   If either data1 or data2 are two-dimensional, then the leftmost
   dimension is represented on the Y (latitude) axis, and the rightmost
   dimension on the X (longitude) axis.

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

   If data1 or data2 have a _FillValue attribute, these values will be
   used as a missing value.

   If the resource cnFillOn is set to True, then the following will happen
   automatically:
     * a labelbar will be automatically added (default horizontal)
     * contour line labels will be turned off
     * the contour information label will be turned off

   If you want to turn the labelbar off, set lbLabelBarOn to False.

   For the map, the following will happen automatically:
     * the continents will be colored gray
     * the continental outlines will be turned off
     * the latitude/longitude locations will be labeled
     * the tickmarks will point outward (cylindrical equidistant map only)

   If the map projection is cylindrical equidist, and the special GSN
   resource gsnZonalMean is set to True, then a zonal mean XY plot will be
   drawn next to the main plot. gsnZonalMeanXMaxF and gsnZonalMeanXMinF
   allow the user to change the X-axis of the zonal average plot.
   gsnZonalMeanYRefLine sets the value that the reference line will be
   drawn at on the zonal average plot, the default value = 0.

   If data1 has an attribute called "long_name", and gsnLeftString hasn't
   explicitly been set, then the value of this attribute is used for the
   left string title.

   If data has an attribute called "units", and gsnRightString hasn't
   explicitly been set, then the value of this attribute is used for the
   right string title.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_contour, gsn_csm_contour, gsn_csm_contour_map,
   gsn_csm_contour_map_ce, gsn_csm_contour_map_polar
   Special gsn resources

Examples

   For some application examples, see:
     * "conOncon_2.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

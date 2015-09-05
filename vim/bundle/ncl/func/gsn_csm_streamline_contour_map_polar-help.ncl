THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_streamline_contour_map_polar.shtml
THE_TITLE:gsn_csm_streamline_contour_map_polar
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_streamline_contour_map_polar

   Creates and draws streamlines over a contour plot over a polar
   stereographic map.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_streamline_contour_map_polar (
                wks     [1] : graphic,
                u    [*][*] : numeric,
                v    [*][*] : numeric,
                data [*][*] : numeric,
                res     [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   u
   v

   The u and v data for the streamline plot. These must be two-dimensional
   arrays.
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

   A scalar id of the map plot created is returned. The id of the
   streamline plot is returned as an attribute called streamline and the
   id of the contour plot as an attribute called contour. The id of the
   data object is returned as an attribute called vfdata, and the id of
   the scalar data object is returned as an attribute called sfdata. This
   is useful if you want to use setvalues to change some data options
   after this function has been called.

Description

   This function creates and draws streamlines over a contour plot over a
   polar stereographic map on the given workstation. The default is to
   show only the northern hemisphere, unless the special resource gsnPolar
   is set to "SH".

   This function puts special longitude labels around the polar map. These
   labels can be controlled only through a limited set of gsnPolar*
   resources. To turn off the labels completely, set the resource
   gsnTickMarksOn to False.

   In order for the streamlines and cokntours to be overlaid correctly on
   the map, please see the document "Overlaying data on a map".

   The special resource gsnAddCyclic will be set to True so that a cyclic
   point will be added to the data. Set this resource to False if your
   data is not cyclic, or if you have already added the cyclic point in
   another fashion.

   If u, v, or data have a _FillValue attribute, these values will be used
   as missing values.

   For the contour plot, if the resource cnFillOn is set to True, then the
   following will happen automatically:
     * a labelbar will be automatically added (default horizontal)
     * contour lines and line labels will be turned off
     * the contour information label will be turned off

   If you want to turn the labelbar off, set lbLabelBarOn to False.

   For the map, the following will happen automatically:
     * the continents will be colored gray
     * the continental outlines will be turned off
     * the longitude locations will be labeled

   If u has an attribute called "long_name", and gsnLeftString hasn't
   explicitly been set, then the value of this attribute is used for the
   left string title.

   If u has an attribute called "units", and gsnRightString hasn't
   explicitly been set, then the value of this attribute is used for the
   right string title.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

   In NCL V6.1.0, this function was updated to automatically create a
   labeblar if stMonoLineColor is set to False.

See Also

   gsn_csm_streamline_contour_map, gsn_csm_streamline_contour_map_ce
   Special gsn resources

Examples

   For some application examples, see:
     * "stream_7.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

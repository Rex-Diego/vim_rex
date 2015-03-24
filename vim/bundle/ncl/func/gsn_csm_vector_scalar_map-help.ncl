THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_vector_scalar_map.shtml
THE_TITLE:gsn_csm_vector_scalar_map
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_vector_scalar_map

   Creates and draws a vector plot over a map, and uses a scalar field to
   draw a separate contour plot or color the vectors.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_vector_scalar_map (
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

   The u and v data for the vector plot; must be two-dimensional.
   data

   The data for which to create a separate contour plot or color the
   vectors by; must be two-dimensional.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the map plot created is returned. The id of the vector
   plot is returned as an attribute called vector. The id of the data
   object is returned as an attribute called vfdata, and the id of the
   scalar data object is returned as an attribute called sfdata. This is
   useful if you want to use setvalues to change some data options after
   this function has been called.

Description

   This function creates and draws a vector plot over a map on the given
   workstation. By default, the scalar field is used to color the vectors,
   unless the special resource gsnScalarContour is set to True, then a
   separate contour plot is created.

   In order for the vectors and contours to be overlaid correctly on the
   map, please see the document "Overlaying data on a map".

   The default projection is a cylindrical equidistant, which you can
   override by setting the mpProjection resource.

   The special resource gsnAddCyclic will be set to True so that a cyclic
   point will be added to the data. Set this resource to False if your
   data is not cyclic, or if you have already added the cyclic point in
   another fashion.

   If u, v, or data have a _FillValue attribute, these values will be used
   as missing values.

   If the resource vcMonoLineArrowColor is set to False, then a labelbar
   is created. If you want to turn this labelbar off, set lbLabelBarOn to
   False.

   For the map, the following will happen automatically:
     * the continents will be colored gray
     * the continental outlines will be turned off
     * the latitude/longitude locations will be labeled (cylindrical
       equidistant and polar stereographic maps only)
     * the tickmarks will point outward (cylindrical equidistant map only)

   If u has an attribute called "long_name", and gsnLeftString hasn't
   explicitly been set, then the value of this attribute is used for the
   left string title.

   If u has an attribute called "units", and gsnRightString hasn't
   explicitly been set, then the value of this attribute is used for the
   right string title.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

   If you need more control over the individual vector and contour plots,
   then it may be easier to create the vector plot with gsn_csm_vector,
   the contour/map plot with gsn_csm_contour_map, and then use the overlay
   procedure to overlay the two. See example "lcnative_overlay_5.ncl" on
   the Lambert Conformal Native Grid Projection examples page.

See Also

   gsn_vector_scalar, gsn_csm_vector_scalar, gsn_csm_vector_scalar_map_ce,
   gsn_csm_vector_scalar_map_polar, gsn_csm_vector, gsn_csm_vector_map,
   gsn_csm_contour, gsn_csm_contour_map
   Special gsn resources

Examples

   For some application examples, see:
     * "lcnative_5.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

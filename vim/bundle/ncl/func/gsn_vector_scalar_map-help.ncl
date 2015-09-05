THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_vector_scalar_map.shtml
THE_TITLE:gsn_vector_scalar_map
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_vector_scalar_map

   Creates and draws a vector plot over a map, and colors the vectors
   using the given scalar field.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_vector_scalar_map (
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

   The data for which to color the vectors by; must be two-dimensional.
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
   workstation, and colors the vectors given a scalar field. If u, v, or
   data have a _FillValue attribute, these values will be used as missing
   values.

   You should use gsn_csm_vector_scalar_map if you want a more customized
   vector plot, if you want the scalar field to be represented as a
   separate contour plot, and/or if any of your data has coordinate
   arrays. To maximize the area that the vector plot is drawn in, set the
   special resource gsnMaximize to True.

See Also

   gsn_vector_scalar
   Special gsn resources

Examples

   For some application examples, see:
     * "gsn_vec_scal_3.ncl" (view example)

   See also the suite of vector/scalar examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

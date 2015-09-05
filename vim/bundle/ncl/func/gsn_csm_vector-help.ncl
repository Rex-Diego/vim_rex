THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_vector.shtml
THE_TITLE:gsn_csm_vector
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_vector

   Creates and draws a vector plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_vector (
                wks  [1] : graphic,
                u [*][*] : numeric,
                v [*][*] : numeric,
                res  [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   u
   v

   The u and v data for the vector plot; must be two-dimensional.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the vector plot created is returned. The id of the data
   object is also returned as an attribute called data. This is useful if
   you want to use setvalues to change some data options after this
   function has been called.

Description

   This function creates and draws a vector plot on the given workstation.

   If either u or v have a _FillValue attribute, these values will be used
   as missing values.

   If the resource vcMonoLineArrowColor is set to False, then a labelbar
   is created. If you want to turn this labelbar off, set lbLabelBarOn to
   False.

   If u has an attribute called "long_name", and gsnLeftString hasn't
   explicitly been set, then the value of this attribute is used for the
   left string title.

   If u has an attribute called "units", and gsnRightString hasn't
   explicitly been set, then the value of this attribute is used for the
   right string title.

   If your X and Y coordinate arrays have different units, then your
   vectors may not be drawn correctly. You may want to try setting
   vcMapDirection to False in this case.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_csm_vector_map
   Special gsn resources

Examples

   For some application examples, see:
     * "panel_13.ncl" (view example)
     * "popscal_4.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

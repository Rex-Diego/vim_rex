THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_streamline.shtml
THE_TITLE:gsn_csm_streamline
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_streamline

   Creates and draws a streamline plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_streamline (
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

   The u and v data for the streamline plot; must be two-dimensional.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the streamline plot created is returned. The id of the
   data object is also returned as an attribute called data. This is
   useful if you want to use setvalues to change some data options after
   this function has been called.

Description

   This function creates and draws a streamline plot on the given
   workstation.

   If either u or v have a _FillValue attribute, these values will be used
   as missing values.

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

   gsn_csm_streamline_map
   Special gsn resources

Examples

   For some application examples, see:
     * "panel_13.ncl" (view example)
     * "stream_1.ncl" (view example)
     * "stream_2.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

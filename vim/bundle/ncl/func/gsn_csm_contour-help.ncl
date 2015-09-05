THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_contour.shtml
THE_TITLE:gsn_csm_contour
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_contour

   Creates and draws a contour plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_contour (
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

   If data is two-dimensional, then a contour plot is generated with the
   leftmost dimension represented on the Y axis, and the rightmost
   dimension represented on the X axis.

   If data is one-dimensional, then res@sfXArray and res@sfYArray must
   also be set to one-dimensional arrays of the same length, and a
   triangulation algorithm will be used to generate the contours.

   If data has a _FillValue attribute, this value will be used as a
   missing value.

   If the resource cnFillOn is set to True, then the following will happen
   automatically:
     * a labelbar will be automatically added (default horizontal)
     * contour line labels will be turned off
     * the contour information label will be turned off

   If you want to turn the labelbar off, set lbLabelBarOn to False.

   The special resource gsnAddCyclic will be set to False so that no
   cyclic point will be added to the data.

   If data has an attribute called "long_name", and gsnLeftString hasn't
   explicitly been set, then the value of this attribute is used for the
   left string title.

   If data has an attribute called "units", and gsnRightString hasn't
   explicitly been set, then the value of this attribute is used for the
   right string title.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_contour, gsn_csm_contour_map
   Special gsn resources

Examples

   For some application examples, see:
     * "conOncon_1.ncl" (view example)
     * "conwomap_2.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_time_lat.shtml
THE_TITLE:gsn_csm_time_lat
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_time_lat

   Creates and draws a time versus latitude plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_time_lat (
                wks     [1] : graphic,
                data [*][*] : numeric,
                res     [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   data

   The two-dimensional data to contour. The leftmost dimension should be
   time, and the rightmost dimension latitude.
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

   This function creates and draws a time versus latitude plot on the
   given workstation.

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

   gsn_contour, gsn_csm_contour, gsn_csm_lat_time, gsn_csm_hov,
   gsn_csm_pres_hgt
   Special gsn resources

Examples

   For some application examples, see the suite of time versus latitude
   plots.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

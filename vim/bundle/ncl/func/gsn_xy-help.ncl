THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_xy.shtml
THE_TITLE:gsn_xy
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_xy

   Creates and draws an XY plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_xy (
                wks [1] : graphic,
                x       : numeric,
                y       : numeric,
                res [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   x
   y

   The X and Y coordinates of the curve(s). If x and/or y are
   two-dimensional, then the leftmost dimension determines the number of
   curves.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the XY plot created is returned. The id of the data
   object is also returned as an attribute called data. This is useful if
   you want to use setvalues to change some data options after this
   function has been called.

Description

   This function creates and draws an XY plot on the given workstation.

   If either x or y has a _FillValue attribute, this value will be used as
   a missing value. If either of the data arrays have a "long_name" and/or
   "units" attribute, these will be used to label the X and Y axes.

   You should use gsn_csm_xy if you want a more customized xy plot.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_y, gsn_csm_xy
   Special gsn resources

Examples

   For some application examples, see:
     * "corel_1.ncl" (view example)
     * "traj_3.ncl" (view example)

   See also the suite of gsn_xy examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

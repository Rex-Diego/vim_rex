THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/boxplot.shtml
THE_TITLE:boxplot
   NCL Home > Documentation > Functions > Graphics routines

boxplot

   Creates a boxplot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function boxplot (
                wks      : graphic,
                x    [*] : numeric,
                y [*][*] : numeric,
                box0pts  : logical,
                plotres  : logical,
                lineres  : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   x

   A one-dimensional array containing the X-axis values of where the box
   plot(s) will be drawn.
   y

   A two-dimensional array, where the rightmost dimension contains the box
   plot reference pt. data. y(n,0)=bottom_value,
   y(n,1)=bottom_value_of_box,
   y(n,2)=mid-value_of_box,y(n,3)=top_value_of_box,y(n,4)=top_value.
   box0pts

   There are two options that may be attached as attributes here.
   boxWidth ---- Scalar or one-dimensional array (as of NCL V6.1.0). Sets
   the width of the box(es).
   (Ex. boxOpts@boxWidth = 1.0, or boxOpts@boxWidth = (/1.0,0.7,1.2/)
   boxColors ---- Scalar or one-dimensional array. Contains the color(s)
   that the boxes will be drawn in.
   (Ex. boxOpts@boxColors = (/"green","blue"/))
   plotres

   An optional xy-plot resource list. Will override defaults where
   applicable.
   lineres

   An optional resource list pertaining to the lines used to draw the
   boxes/lines.

Return value

   A scalar id of the XY plot created is returned. The id of the data
   object is also returned as an attribute called data. This is useful if
   you want to use setvalues to change some data options after this
   function has been called.

Description

   This function creates a blank LogLin plot object, on which box plots
   are created by extensive use of gsn_add_polyline.

   You need to call draw and frame after calling this function, as the
   plot is not drawn and the frame is not advanced. As of V5.1.0, you can
   set plotres@gsnMaximize to True in order to maximize the size of the
   boxplot in the frame.

   This function may be used with gsn_panel.

Examples

   For a set of application examples, please refer to the Boxplot
   Applications Page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

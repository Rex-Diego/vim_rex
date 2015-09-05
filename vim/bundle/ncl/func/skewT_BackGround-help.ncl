THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Skewt_func/skewT_BackGround.shtml
THE_TITLE:skewT_BackGround
   NCL Home > Documentation > Functions > Graphics routines

skewT_BackGround

   Creates a background chart for Skew T, Log P plotting.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/skewt_func.ncl"

        function skewT_BackGround (
                wks  : graphic,
                res  : graphic
        )

        return_val  :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A plot identifier of the Skew T background chart created is returned.

Description

   This function creates a Skew T background in conformance with the
   weather prediction chart (WPC) described in DOD-WPC 9-16-1. For an
   overview of the information on a Skew T chart, see:

     http://twister.sbs.ohio-state.edu/helpdocs/skew_T_help.html

   skewT_BackGround takes a workstation ID and a resource list as
   arguments. By default skewT_BackGround produces no graphical output; it
   sets the special resources gsnDraw and gsnFrame to False. The user must
   use the draw procedure to render the background and invoke the frame
   procedure to advance the plot.

   The primary use of this procedure is to create a background for use
   with skewT_PlotData.

   Note: in versions NCL 6.1.0 and later, the colors produced by this
   function may appear slightly different. This is because the code is
   using named colors to draw certain elements, like "PaleGreen" for the
   background, and "Tan" for the lines. In NCL 6.1.0, named colors no
   longer need to be added to a color map in order to be recognized, so
   you will start to see the correct colors in this release. If you don't
   like these colors, you can restore the old ones by setting the
   "UseMyColorMap" resource to True. You may also need to set the color
   map to "default":

   gsn_define_colormap(wks,"default")

   There are a number of resources the user can set to alter the default
   Skew T background. For more information about how to use these
   resources, see the examples section below.

   Resource name      Default value
   DrawIsotherm       True
   DrawIsobar         True
   DrawMixRatio       True
   DrawDryAdiabat     True
   DrawMoistAdiabat   True (aka: saturation or pseudo adiabat)
   DrawWind           True
   DrawStandardAtm    True
   DrawColLine        True
   DrawColAreaFill    False
   DrawFahrenheit     True (Fahrenheit "x" axis)
   DrawHeightScale    False
   DrawHeightScaleFt  True (default is feet [otherwise km])
   DrawStandardAtmThk 2.0
   UseMyColorMap      False
   PrintOpts          False
   Font               "helvetica"

See Also

   skewT_PlotData

Examples

   Several examples illustrating the use of skewT_BackGround and selected
   resources may be seen in the Skew T examples page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

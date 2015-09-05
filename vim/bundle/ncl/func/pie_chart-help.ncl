THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/pie_chart.shtml
THE_TITLE:pie_chart
   NCL Home > Documentation > Functions > Graphics routines

pie_chart

   Creates a basic pie chart.

   [new.gif] Available in version 5.2.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function pie_chart (
                wks     [1] : graphic,
                percent [*] : numeric,
                name    [*] : string ,
                color   [*] : string,
                res     [1] : logical
        )

        return_val [1] :  type "graphic"

Arguments

   wks

   Work station identifier.
   percent

   Percent explained by each section [0 - 100]. The sum should be 100%.
   name

   Name associated with each section.
   color

   Color associated with each section.
   res

   If res=True, optional resources recognized by pie_chart:
     * res@pcLabelType: "section" (default) or "block"
     * res@tiMainString: string for general title (default is no main
       title)
     * res@gsMarkerIndex: specifies the marker index (default=16; color
       filled circle)
     * res@gsMarkerSizeF: specifies the marker size (default=0.0115)
     * res@txFontHeight: specifies size of labels (default=0.0125)
     * res@gsnMaximize: if set to True then make .ps, .eps, .pdf files as
       large as possible. Do not use if the plot is to be part of a panel
       plot. (default is False)
     * res@gsnDraw: if False, no plot will be drawn (default is True)
     * res@gsnFrame: if False, the frame will not be advanced (default is
       True)

Return value

   Create a basic Pie Chart with some options.

Description

   The percent is partitioned over 360 degrees. The sections proceed in a
   counter clockwise direction. Some labeling options are provided.

   The Pie Chart can be viewed as an alternative to a Bar Chart or
   Histogram.

Examples

   For an application example, see:
     * See the Pie Chart examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

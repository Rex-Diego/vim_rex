THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/maximize_output.shtml
THE_TITLE:maximize_output
   NCL Home > Documentation > Graphics > Graphical Interfaces

maximize_output

   Maximizes the sizes of a series of plots drawn in a single frame.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure maximize_output (
                wks [1] : graphic,
                res [1] : logical
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   res

   A variable containing an optional list of resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied. The only two resources recognized
   by this procedure are gsnDraw and gsnFrame.

Description

   This procedure takes a workstation (that has several plots drawn on
   it), calculates the device coordinates needed to maximize the plots on
   a PS or PDF workstation, and then sets these device coordinates so that
   the plots are draw as big as possible without skewing their aspect
   ratios or falling off the page.

   The plots are drawn and the frame is advanced by default, unless
   gsnDraw and/or gsnFrame are set to False.

Examples

   For an example, see panel example 20.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

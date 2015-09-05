THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_map.shtml
THE_TITLE:gsn_csm_map
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_map

   Creates and draws a map.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_map (
                wks [1] : graphic,
                res [1] : logical
        )

        return_val [1] :  graphic

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

   A scalar id of the map plot created is returned. This is useful if you
   want to use setvalues to change some plot options after this function
   has been called.

Description

   This function creates and draws a map plot on the given workstation.
   The default projection is a cylindrical equidistant, which you can
   override by setting the mpProjection resource.

   For the map, the following graphical resources will be set internally,
   which are different from NCL defaults:
     * res@mpOutlineOn = False
       (turn off continental outlines)
     * res@mpFillOn = True
       (turn on map fill)
     * res@mpFillColors =
       (/"background","transparent","LightGray","transparent"/)
       (fill land in gray and ocean in transparent)
     * res@mpGridAndLimbOn = False
       (turn off lat/lon grid lines)

   If you turn off map fill (res@mpFillOn = False), then the continental
   outlines will automatically be turned back on.

   A series of other resources will be set internally to label the
   latitude/longitude locations (cylindrical equidistant and polar
   stereographic maps only) and to point the tickmarks outward
   (cylindrical equidistant map only).

   Here's comparison between using a "gsn_csm" mapping function, and a
   generic "gsn" function (click on either thumbnail for a larger view):

         gsn_csm          gsn generic
   [gsn_csm_map_sm.png] [gsn_map_sm.png]

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_map, gsn_csm_map_ce, gsn_csm_map_polar
   Special gsn resources

Examples

   For some application examples, see:
     * "conOncon_7.ncl" (view example)
     * "maponly_5.ncl" (view example)

   For some application examples, see the map suite of examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

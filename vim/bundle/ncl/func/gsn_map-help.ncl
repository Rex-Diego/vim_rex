THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_map.shtml
THE_TITLE:gsn_map
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_map

   Creates and draws a map.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_map (
                wks        [1] : graphic,
                projection [1] : string,
                res        [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   projection

   The map projection to use.
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
   For a valid list of map projections, see the projections associated
   with the mpProjection resource.

   You should use gsn_csm_map if you want a more customized contour plot
   and/or if your data has coordinate arrays.

   Here's comparison between using a "gsn_csm" mapping function, and a
   generic "gsn" function (click on either thumbnail for a larger view):

         gsn_csm          gsn generic
   [gsn_csm_map_sm.png] [gsn_map_sm.png]

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_csm_map, gsn_csm_map_ce, gsn_csm_map_polar
   Special gsn resources

Examples

   For some application examples, see:
     * "polyg_1.ncl" (view example)
     * "polyg_2.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

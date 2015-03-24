THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_map_ce.shtml
THE_TITLE:gsn_csm_map_ce
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_map_ce

   Creates and draws a cylindrical equidistant map.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_map_ce (
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

   This function creates and draws a cylindrical equidistant map plot on
   the given workstation. The map will be centered at longitude 0 unless
   you set the resource mpCenterLonF to the desired center longitude.

   For the map, the following will happen automatically:
     * the continents will be colored gray
     * the continental outlines will be turned off
     * the latitude/longitude locations will be labeled
     * the tickmarks will point outward

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_map, gsn_csm_map, gsn_csm_map_polar
   Special gsn resources

Examples

   For some application examples, see:
     * "histo_9.ncl" (view example)
     * "ocean_3.ncl" (view example)

   For some more application examples, see the map suite of examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

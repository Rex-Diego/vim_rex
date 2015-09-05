THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Wind_rose/WindRoseBasic.shtml
THE_TITLE:WindRoseBasic
   NCL Home > Documentation > Functions > Graphics routines

WindRoseBasic

   Plots a basic wind rose.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/wind_rose.ncl"

        function WindRoseBasic (
                wks        : graphic,
                wspd       : numeric,
                wdir       : numeric,
                numPetals  : integer,
                circFr     : float,
                res        : graphic
        )

        return_val  :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   wspd

   A one-dimensional array of wind speeds (any units).
   wdir

   A one-dimensional array of wind direction (degrees). The wind
   directions are meteorological; that is, 90 degrees means blowing from
   the east; 180 means winds blowing from the south.
   numPetals

   Number of wind rose directions.
   circFr

   Intervals at which frequency circles are drawn.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied. The most common resource is to
   set the figure title via tiMainString.

Return value

   A plot identifier of the wind rose is returned.

Description

   This function creates a basic wind rose (i.e. a frequency of wind
   direction plus average speed).

See Also

   WindRoseColor, WindRoseThickLine

Examples

   See Example 1 of the wind rose examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

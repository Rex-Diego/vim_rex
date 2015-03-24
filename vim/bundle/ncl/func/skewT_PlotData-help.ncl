THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Skewt_func/skewT_PlotData.shtml
THE_TITLE:skewT_PlotData
   NCL Home > Documentation > Functions > Graphics routines

skewT_PlotData

   Plot a sounding and (optionally) winds on Skew T, Log P charts created
   by skewT_BackGround.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/skewt_func.ncl"

        function skewT_PlotData (
                wks         : graphic,
                skewt_bkgd  : graphic,
                P           : numeric,
                TC          : numeric,
                TDC         : numeric,
                Z           : numeric,
                WSPD        : numeric,
                WDIR        : numeric,
                dataOpts    : logical
        )

        return_val  :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   skewt_bkgd

   The identifier returned from calling skewT_BackGround.
   P

   An array of pressure values (mb/hPa).
   TC

   An array of the same length as P containing temperature values. By
   default these are assumed to be in Fahrenheit. If you are using
   Celsius, then you need to specify this by setting the dataOpts
   attribute DrawFahrenheit to False. TC@_FillValue may be set to identify
   missing values.
   TDC

   An array of the same length as P containing dew point temperature
   values. By default these are assumed to be in Fahrenheit. If you are
   using Celsius, then you need to specify this by setting the dataOpts
   attribute DrawFahrenheit to False. TDC@_FillValue may be set to
   identify missing values.
   Z

   An array of the same length as P containing geopotential values (gpm).
   Z@_FillValue may be set to identify missing values.
   WSPD

   An array of the same length as P containing wind speed values (knots or
   m/s). WSPD@_FillValue may be set to identify missing values.
   WDIR

   An array of the same length as P containing meteorological wind
   direction values. WDIR@_FillValue may be set to identify missing
   values.
   dataOpts

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A plot identifier of the Skew T plot created is returned.

Description

   This function plots soundings on a Skew T, Log P background chart that
   was created by skewT_BackGround. For an overview of the information on
   a Skew T chart, see:

     http://twister.sbs.ohio-state.edu/helpdocs/skew_T_help.html

   skewT_PlotData recognizes missing values as indicated via the
   _FillValue resource. It is required that the skewT_BackGround procedure
   be called before skewT_PlotData is used, since the position of the
   plot, the title font, and so forth are inherited from the settings for
   skewT_BackGround.

   If wind speeds and directions are supplied in arguments WSPD and WDIR
   at places where pressures are missing, then, if geopotential values
   exist at those locations where pressures are missing the geopotential
   values are mapped (interpolated to) pressure values and the wind barbs
   are drawn at those pressures. These wind barbs are colored using the
   value of the resource "colWindZ".

   There are a number of resources the user can set to alter the Skew T
   plot. All resource values unique to skewT_PlotData are reset to their
   defaults each time the function is called. For more information about
   how to use these resources, see the examples section below.

   Resource name Default value Description
   PrintZ        True          print geopotential (Z) on skewT diagram
   PlotWindP     True          plot wind barbs at p lvls
   WspdWdir      True          wind speed and dir [else: u,v]
   PlotWindH     False         plot wind barbs at h lvls [pibal; special]
   HspdHdir      True          wind speed and dir [else: u,v]
   ThermoInfo    True          plot CAPE parcel profile if cape > 0
   Parcel        0             subscript corresponding to initial parcel

See Also

   skewT_BackGround

Examples

   For application examples, see the Skew T examples page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

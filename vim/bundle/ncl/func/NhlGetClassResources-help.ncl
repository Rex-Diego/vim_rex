THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlGetClassResources.shtml
THE_TITLE:NhlGetClassResources
   NCL Home > Documentation > Functions > NCL object routines

NhlGetClassResources

   Returns a list of resources associated with the given class name and an
   optional filter string.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function NhlGetClassResources (
                class_name    [1] : string,
                filter_string [1] : string
        )

        return_val [*] :  string

Arguments

   class_name

   An NCL class name, like "contourPlotClass", "mapPlotClass" or
   "vectorFieldClass".
   filter_string

   A filter string to further narrow down the list of resources returned.
   This string can be a regular expression, like "^cn", which indicates to
   return only strings that start with "cn". All matching is performed in
   a case-insensitive manner: the filter string "fillcolor" would return
   resource names containing this string in any combination of upper and
   lower case letters.

   If "" is used for this string, then all resources associated with that
   class will be returned.

Return value

   The list of matched resources is returned as an array of strings. If no
   matching resources are found, then a missing string value is returned.

Description

   Given a class name and a "filter" (regular expression), this function
   returns a list of matched resources associated with that class. Note
   that this function only works on classes that are "creatable" by the
   user, like ContourPlot, MapPlot, and pdfWorkstation. You cannot
   retrieve the resources for classes like PlotManager and View. See the
   next paragraph for more information.

   The filter_string can be used to narrow the resources that are returned
   to those that apply to the situation at hand and can also help discover
   the exact spelling of a resource you may not remember exactly. Note
   that the full list of resources for a class includes both superclass
   and composite class member resources unless they have been disabled by
   the class. For instance, the full resource list for the ContourPlot
   class includes the resources of its View (vp) and Transform (tf)
   superclasses, as well as those of its composite Transformation (tr),
   PlotManager (pm), LabelBar (lb), Legend (lg), Title (ti), and TickMark
   (tm) class members. Disabled resources are composite class member
   resources over which the user has no control because they are set
   automatically. An example would be the lbFillColors resource, which the
   ContourPlot class sets for its composite class LabelBar based on the
   colors used in a filled contour plot.

   A full description of the syntax and capabilities of regular
   expressions is beyond the scope of this document. See the Unix/POSIX
   man page for REGEX (7) or similar documentation for a complete
   explanation, noting that NCL's implementation uses the "modern" form of
   regular expressions. In reality only a very small subset of the full
   functionality will be needed for the purposes of this function. For
   those not familiar with the topic one basic point is that unlike the
   use in a directory listing of the asterisk ('*') as a wildcard standing
   for any number of arbitrary characters, the equivalent operator in a
   regular expression consists of the two character sequence: '.*'.

   The full list of class names can be found at
   http://www.ncl.ucar.edu/Document/HLUs/Classes/

See Also

   str_match

Examples

   Example 1:

   To get a list of all resources associated with an X11 workstation:

  wk_strs = NhlGetClassResources("xWorkstationClass","")

   The above returns:

  (0)     wkBackgroundColor
  (1)     wkColorMap
  (2)     wkColorMapLen
  (3)     wkDashTableLength
  (4)     wkDefGraphicStyleId
  (5)     wkFillTableLength
  (6)     wkForegroundColor
  (7)     wkGksWorkId
  (8)     wkHeight
  (9)     wkIconTitle
  (10)     wkMarkerTableLength
  (11)     wkPause
  (12)     wkTitle
  (13)     wkTopLevelViews
  (14)     wkVSWidthDevUnits
  (15)     wkViews
  (16)     wkWidth
  (17)     wkWindowId
  (18)     wkX
  (19)     wkXColorMode
  (20)     wkY

   Example 2:

   To get a list of all map resources that contain any form of the word
   "fillcolor":

  mp_strs = NhlGetClassResources("mapPlotClass","fillcolor")

   The above returns:

  (0)     lbFillColor
  (1)     lbFillColors
  (2)     lbMonoFillColor
  (3)     lbPerimFillColor
  (4)     lgPerimFillColor
  (5)     mpDefaultFillColor
  (6)     mpFillColor
  (7)     mpFillColors
  (8)     mpInlandWaterFillColor
  (9)     mpLandFillColor
  (10)     mpMonoFillColor
  (11)     mpOceanFillColor
  (12)     mpSpecifiedFillColors

   Example 3:

   To get a list of all labelbar resources associated with a contour plot:

  lb_strs = NhlGetClassResources("contourPlotClass","^lb")

   The above returns:

  (0)     lbAutoManage
  (1)     lbBottomMarginF
  (2)     lbBoxFractions
  (3)     lbBoxLineColor
  (4)     lbBoxLineDashPattern
  (7)     lbBoxLinesOn
 . . .
  (57)     lbTitleJust
  (58)     lbTitleOffsetF
  (59)     lbTitleOn
  (60)     lbTitlePosition
  (61)     lbTitleString
  (62)     lbTopMarginF

   Example 3:

   To get a list of all resources that belong to the actual
   contourPlotClass and have somthing to do with contour levels:

  level_strs = NhlGetClassResources("contourPlotClass","^cn.*level")

   The above returns:

   (0)     cnLegendLevelFlags
   (1)     cnLevelCount
   (2)     cnLevelFlag
   (3)     cnLevelFlags
   (4)     cnLevelSelectionMode
   (5)     cnLevelSpacingF
   (6)     cnLevels
   (7)     cnMaxLevelCount
   (8)     cnMaxLevelValF
   (9)     cnMinLevelValF
   (10)    cnMonoLevelFlag



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlPalGetDefined.shtml
THE_TITLE:NhlPalGetDefined
   NCL Home > Documentation > Functions > Color routines

NhlPalGetDefined

   Returns a list of available color maps.

Prototype

        function NhlPalGetDefined (
        )

        return_val [*] :  string

Description

   The NhlPalGetDefined function returns a string array of color maps that
   are available to NCL. To see a graphical representation of the color
   maps that NCL provides, visit the "Color Tables" page.

   By default, this function lists all the color maps that reside in the
   directory "$NCARG_ROOT/lib/ncarg/colormaps". If you've set the
   NCARG_COLORMAPS environment variable, however, then this function will
   list the colormaps in the directory specified by $NCARG_COLORMAPS.

See Also

   gsn_define_colormap, gsn_draw_colormap, NhlGetNamedColorIndex

Examples

   Example 1

   The following NCL script:

begin
  color_maps = NhlPalGetDefined
  print(color_maps)
end

   will return something like:
Variable: color_maps
Type: string
Total Size: 180 bytes
            45 values
Number of Dimensions: 1
Dimensions and sizes:   [45]
Coordinates:
(0)     default
(1)     cyclic
(2)     gscyclic
(3)     gsltod
(4)     gsdtol
(5)     uniform
(6)     temp1
(7)     psgcap
(8)     example
(9)     3gauss
(10)    3saw
(11)    BkBlAqGrYeOrReViWh200
(12)    BlAqGrYeOrRe
(13)    BlAqGrYeOrReVi200
(14)    BlGrYeOrReVi200
(15)    BlRe
 .
 .
 .
(37)    tbr_240-300
(38)    tbr_stdev_0-30
(39)    tbr_var_0-500
(40)    testcmap
(41)    thelix
(42)    wh-bl-gr-ye-re
(43)    wxpEnIR
(44)    gui_default

   Example 2

   To draw all of the available color maps, use the NCL script below. Note
   that this script will produce 50+ frames, so it could take awhile to
   generate!
load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
  wks = gsn_open_wks("x11","colormaps")

  names = NhlPalGetDefined()

  do i=0,dimsizes(names)-1
    gsn_define_colormap(wks,names(i))
    gsn_draw_colormap(wks)
  end do
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

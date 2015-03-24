THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/RGBtoCmap.shtml
THE_TITLE:RGBtoCmap
   NCL Home > Documentation > Functions > Color routines

RGBtoCmap

   Reads a text file of RGB triplets and converts them to a colormap.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function RGBtoCmap (
                filename  : string
        )

        return_val [*][3] :  float

Return value

   The results are returned in a float array dimensioned nrows x 3, where
   nrows is the number of rows in the input file.

Description

   This function reads a text file of RGB triplets (integers that range
   from 0 to 255) and converts them to a color map that is dimensioned
   nrows x 3 (R,G,B). The first triplet is the background color and the
   second triplet is the foreground color. The RGB values will be
   normalized (RGB/255). This color map can then be used with a function
   like gsn_define_colormap to define a color map for a workstation.

Examples

   Example 1

   Assume you have a file called "rgb.txt" of the following RGB values:
255 255 255
0 0 0
147 112 219
0   0   200
60  100 230
120 155 242
176 224 230

   The following NCL code will read this file and use it to define a new
   colormap:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
begin
  cmap = RGBtoCmap("rgb.txt")
  wks = gsn_open_wks("x11","test")
  gsn_define_colormap(wks,cmap)
  gsn_draw_colormap(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

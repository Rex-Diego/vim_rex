THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlNewColor.shtml
THE_TITLE:NhlNewColor
   NCL Home > Documentation > Functions > Color routines

NhlNewColor

   Allocates new workstation color indexes.

Prototype

        function NhlNewColor (
                workstations [*] : graphic,
                red          [*] : float,
                green        [*] : float,
                blue         [*] : float
        )

        return_val [dimsizes(workstations)][dimsizes(red)] :  integer

Arguments

   workstations

   An array of NCL Workstation identifiers. The identifiers are ones
   returned either from calling gsn_open_wks or calling create to create a
   Workstation object.

   red
   green
   blue

   Arrays of floating-point values between 0 and 1 inclusive. They must
   all be the same length.

Return value

   The color indexes allocated can be different for each workstation
   identifier, so the return array of color indexes is dimensioned nwks x
   nrgb , where nwks is the length of workstations, and nrgb is the length
   of the red, green, blue arrays.

Description

   For the color map of each workstation in workstations, this function
   allocates color indexes for every given red, green, blue triplet.

   This function is different than the NhlSetColor procedure in that you
   are not required to input color indexes for which to put the new
   colors.

   If you are trying to add a color to a color map that already has 256
   colors in it, you will get an error. Try using NhlSetColor in this
   case.

See Also

   NhlFreeColor, NhlSetColor, NhlIsAllocatedColor, NhlGetNamedColorIndex,
   namedcolor2rgb

Examples

   Example 1

   This example draws a filled contour plot over a map. It uses a
   "rainbow" colormap which has no gray in it. This causes the continents
   to be drawn in white. The NhlNewColor function is used to add gray to
   the end of the colormap.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
  datadir  = ncargpath("data")
  datafile = datadir + "/cdf/meccatemp.cdf"
;
; Load a file record from the netCDF file
; as a read only data set.
;
  n = addfile(datafile,"r")
  t = n->t(0,:,:)

  type                   = "x11"
  type@wkColorMap        = "rainbow"
  type@wkBackgroundColor = "white"
  type@wkForegroundColor = "black"

  wks = gsn_open_wks(type,"annotation")     ; Open a workstation.
;
; If you don't add this color, your continent colors
; will be white instead of gray.
;
  newindex = NhlNewColor(wks,0.8,0.8,0.8)

;
; Set some resources.
;
  res                     = True
  res@gsnSpreadColors     = True
  res@gsnSpreadColorEnd   = -2
  res@gsnMaximize         = True
  res@gsnAddCyclic        = False

  res@cnLevelSelectionMode= "ManualLevels"
  res@cnMinLevelValF      =  195.0
  res@cnMaxLevelValF      =  328.0
  res@cnLevelSpacingF     = 2.25
  res@cnFillOn            = True
  res@cnLinesOn           = False

  res@lbLabelAutoStride   = True

  res@mpGridAndLimbOn     = False
  res@mpFillDrawOrder     = "PostDraw"

  plot = gsn_csm_contour_map(wks,t,res)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlFreeColor.shtml
THE_TITLE:NhlFreeColor
   NCL Home > Documentation > Functions > Color routines

NhlFreeColor

   Removes one or more color entries from one or more workstations.

Prototype

        procedure NhlFreeColor (
                workstations [*] : graphic,
                color_index  [*] : integer
        )

Arguments

   workstations

   An array of NCL Workstation identifiers. The identifiers are ones
   returned either from calling gsn_open_wks or calling create to create a
   Workstation object.

   color_index

   An array of integer color indexes (between 0 and 255) to be freed.

Description

   The NhlFreeColor procedure frees each color index in color_index from
   the color map of each workstation in the workstations parameter.

See Also

   NhlSetColor, NhlNewColor, NhlIsAllocatedColor, NhlGetNamedColorIndex

Examples

   Example 1

   This example draws a filled contour plot over a map. It uses a
   "rainbow" colormap which has no gray in it. This causes the continents
   to be drawn in white. The NhlSetColor procedure is used to add gray to
   the end of the colormap. This example also shows how to remove this
   color using NhlFreeColor, and how it affects your plot.

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
; If you don't set this color index, your continent colors
; will be white instead of gray.  First, retrieve the length
; of the colormap, so we can add this color after the last one.
;
  getvalues wks
    "wkColorMapLen" : len
  end getvalues

  NhlSetColor(wks,len,0.8,0.8,0.8)

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

;
; Now remove this color and see how it affects the plot.
;
  NhlFreeColor(wks,190)
  plot = gsn_csm_contour_map(wks,t,res)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

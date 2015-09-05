THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlRemoveAnnotation.shtml
THE_TITLE:NhlRemoveAnnotation
   NCL Home > Documentation > Functions > NCL object routines, Graphics
   routines

NhlRemoveAnnotation

   Remove annotations from the plot they are registered in.

Prototype

        procedure NhlRemoveAnnotation (
                plot_id         [1] : graphic,
                anno_manager_id [*] : graphic
        )

Arguments

   plot_id

   A reference to a plot object from which the annotation is to be
   removed.

   Plot objects are created by using one of the many gsn functions, or by
   calling the NCL create language construct.
   anno_manager_id

   References to one or more AnnoManager instances to be removed from each
   of the plot_id elements.

Description

   This procedure is used to remove external annotations from a plot they
   have previously been added to using the NhlAddAnnotation function.

See Also

   NhlAddAnnotation

Examples

   Example 1

   This example shows how to use NhlAddAnnotation to add a labelbar to a
   plot, and then NhlRemoveAnnotation to remove it.

   Of course, you automatically get a labelbar if you set
   "pmLabelBarDisplayMode" to "Always" (or if you use one of the gsn_csm
   plotting functions and you set "cnFillOn" to True) , but this shows you
   how to do this in case you want to have ultimate control over the
   labelbar.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  datadir = ncargpath("data")
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

  res                     = True
  res@gsnSpreadColors     = True
  res@gsnMaximize         = True
  res@gsnDraw             = False
  res@gsnFrame            = False

  res@sfXArray            = t&lon
  res@sfYArray            = t&lat

  res@cnLevelSelectionMode= "ManualLevels"
  res@cnMinLevelValF      =  195.0
  res@cnMaxLevelValF      =  328.0
  res@cnLevelSpacingF     = 2.25
  res@cnFillOn            = True
  res@cnLinesOn           = False
  res@cnLineLabelsOn      = False
  res@cnInfoLabelOn       = False
  res@mpGridAndLimbOn     = False

  plot = gsn_contour_map(wks,t,res)

;
; Get some resource values and use these to
; create labelbar.
;
  getvalues plot@contour
    "cnLevels"               : levels
    "cnFillColors"           : colors
    "cnInfoLabelFontHeightF" : font_height
  end getvalues

;
; Create a labelbar using the old-fashioned object-oriented method.
;
  labelbar = create "labelbar" labelBarClass wks
    "vpWidthF"           : 0.8
    "vpHeightF"          : 0.2

    "lbAutoManage"       : False       ; Allow us to control font heights.

    "lbBoxCount"         : dimsizes(levels)+1
    "lbLabelStrings"     : levels
    "lbFillColors"       : colors
    "lbMonoFillPattern"  : True

    "lbOrientation"      : "Horizontal"
    "lbPerimOn"          : False

    "lbLabelFont"        : 21
    "lbLabelFontHeightF" : font_height
    "lbLabelAutoStride"  : True
  end create

  annoid = NhlAddAnnotation(plot,labelbar)

;
; If you draw the plot at this point, labelbar will be in the
; middle of the plot, because this is the default.
;
;  draw(plot)
;  frame(wks)

;
; Default was that labelbar appeared in center of plot.
;
; Change the zone to 2 so the labelbar is outside the
; plot, and then center it under plot and move it up a
; smidge.
;
  setvalues annoid
    "amZone"           : 2
    "amParallelPosF"   : 0.5            ; Center labelbar.
    "amOrthogonalPosF" : -0.1
    "amResizeNotify"  : True            ; Allow resize if plot resized.
  end setvalues

  draw(plot)
  frame(wks)

;
; Watch how labelbar automatically resizes if you resize the plot.
;
  setvalues plot
    "vpWidthF"  : 0.4
    "vpHeightF" : 0.2
  end setvalues

  draw(plot)
  frame(wks)

;
; Remove annotation and  redraw plot. Labelbar will be gone.
;
  NhlRemoveAnnotation(plot,annoid)

  draw(plot)
  frame(wks)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

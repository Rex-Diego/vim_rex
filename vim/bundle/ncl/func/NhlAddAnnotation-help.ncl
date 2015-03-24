THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlAddAnnotation.shtml
THE_TITLE:NhlAddAnnotation
   NCL Home > Documentation > Functions > NCL object routines, Graphics
   routines

NhlAddAnnotation

   Add annotations to a plot object as an external annotation.

Prototype

        function NhlAddAnnotation (
                plot_id      [1] : graphic,
                anno_view_id [*] : graphic
        )

        return_val [dimsizes(anno_view_id)] :  graphic

Arguments

   plot_id

   A reference to a plot object to which the annotation is to be added.

   Plot objects are created by using one of the many gsn functions, or by
   calling the NCL create language construct.
   anno_view_id

   One or more view objects to be added as an annotation of plot_id. A
   view object is just basically another plot object.

Return value

   The return value is a multi-dimensional array, where each element
   contains a reference to an AnnoManager object created during the call.
   Each element in anno_view_id is added to the plot_id.

Description

   This function adds one or more views to a plot as annotations. You need
   to use AnnoManager resources in order to control how the views are
   added to the plot. When you add an annotation to a plot, then when you
   resize the plot, the annotations will be resized accordingly.

See Also

   NhlRemoveAnnotation

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
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
;
; Open a netCDF file and pull off the some temperature data.
;
  datadir = ncargpath("data")
  datafile = datadir + "/cdf/meccatemp.cdf"
  n = addfile(datafile,"r")
  t = n->t(0,:,:)

  wks = gsn_open_wks("x11","annotation")
  gsn_define_colormap(wks,"rainbow")

  res                     = True
  res@gsnAddCyclic        = False
  res@gsnSpreadColors     = True
  res@gsnMaximize         = True
  res@gsnDraw             = False
  res@gsnFrame            = False

  res@cnLevelSelectionMode = "ManualLevels"
  res@cnMinLevelValF      =  195.0
  res@cnMaxLevelValF      =  328.0
  res@cnLevelSpacingF     = 2.25
  res@cnFillOn            = True
  res@cnLinesOn           = False
  res@cnLineLabelsOn      = False
  res@cnInfoLabelOn       = False
  res@mpGridAndLimbOn     = False

  res@lbLabelBarOn        = False    ; Make sure the default labelbar
                                     ; isn't drawn.
  plot = gsn_csm_contour_map(wks,t,res)

;
; Get some resource values and use these to create a labelbar.
;
  getvalues plot@contour
    "cnLevels"               : levels
    "cnFillColors"           : colors
    "cnInfoLabelFontHeightF" : font_height
  end getvalues

  labels = "" + levels       ; Convert levels to a string array. This is
                             ; not necessary, but it gets rid of the
                             ; annoying error message about coercing types.

  lbres                    = True      ; Set up a resource list for the labelbar
.
  lbres@vpWidthF           = 0.8
  lbres@vpHeightF          = 0.1

  lbres@lbBoxLinesOn       = False
  lbres@lbFillColors       = colors
  lbres@lbMonoFillPattern  = True

  lbres@lbOrientation      = "Horizontal"
  lbres@lbPerimOn          = False

  lbres@lbLabelFontHeightF = font_height
  lbres@lbLabelAutoStride  = True

  lbid = gsn_create_labelbar_ndc(wks,dimsizes(levels)+1,labels,0.1,0.1,lbres)

  annoid = NhlAddAnnotation(plot,lbid)

;
; If you draw the plot at this point, labelbar will be in the
; middle of the plot, because this is the default.
;
 draw(plot)
 frame(wks)

;
; Default was that labelbar appeared in center of plot.
;
; Change the zone to 2 so the labelbar is outside the
; plot then center it under plot and move it down a smidge.
;
  setvalues annoid
    "amZone"           : 2
    "amParallelPosF"   : 0.5            ; Center labelbar.
    "amOrthogonalPosF" : 0.1            ; Move down, away from plot
    "amResizeNotify"   : True           ; Allow resize if plot resized.
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
; Remove annotation and redraw plot. Labelbar will be gone.
;
 NhlRemoveAnnotation(plot,annoid)

 draw(plot)
 frame(wks)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

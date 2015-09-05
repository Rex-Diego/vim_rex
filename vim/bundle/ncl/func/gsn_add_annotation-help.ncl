THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_add_annotation.shtml
THE_TITLE:gsn_add_annotation
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_add_annotation

   Attaches the given annotation to the given plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_add_annotation (
                plot_id    [1] : graphic,
                graphic_id [1] : graphic,
                res        [1] : logical
        )

        return_val [1] :  graphic

Arguments

   plot_id

   A plot identifier created by using one of the many gsn functions, or by
   calling create to create a View object.
   graphic_id

   An identifier of a graphical object (like another plot or a labelbar)
   created by using one of the many gsn functions, or by calling create to
   create a View object.
   res

   A variable containing an optional list of annotation manager resources,
   attached as attributes. Set to True if you want the attached attributes
   to be applied, and False if you either don't have any resources to set,
   or you don't want the resources applied.

Return value

   A scalar id of the annotation created is returned.

Description

   This function attaches the graphical object represented by graphic_id
   to the plot represented by plot_id. By attaching one object to another,
   they become one object, and hence when you draw or resize the plot
   represented by plot_id, the graphical object will also be drawn or
   resized accordingly. This is especially useful if you plan to pass the
   plot to gsn_panel.

   By default, the graphical object is attached to the center of the plot.
   To change this, use a combination of the resources amJust,
   amParallelPosF, and amOrthogonalPosF. amJust allows you to specify
   which corner of the graphical object you want to use as the positioning
   point. The default is "CenterCenter" (the center of the object). Other
   possible values are "TopLeft", "TopCenter", "TopRight", "CenterLeft",
   "CenterRight", "BottomLeft", "BottomCenter", and "BottomRight".

   The values for amParallelPosF and amOrthogonalPosF go from roughly -0.5
   to 0.5, although you can use smaller or larger values. The default is
   0.0 for both resources, which is the dead center of the plot. A
   parallel value of 0.5 attaches the corner of the graphical object
   (specified by amJust) to the flush right edge of the plot. A parallel
   value of -0.5 attaches the corner to the flush left edge of the plot.
   Here's a table showing what the various values will do:

   parallel
   orthogonal
   location of object

   0.0 0.0 graphical object attached to dead center of plot
   0.5 0.5 graphical object attached to bottom right of plot
   0.5 -0.5 graphical object attached to top right of plot
   -0.5 -0.5 graphical object attached to top left of plot
   -0.5 0.5 graphical object attached to bottom left of plot

   The annotation id returned is useful if you need to remove the
   annotation later with NhlRemoveAnnotation.

   This function also recognizes the gsnMaximize resource. This is
   especially useful if gsn_add_annotation is being used to add an
   annotation outside the plot's original boundary, hence making it
   bigger. Even if the original plot was maximized to fit in the screen,
   it will need to be "remaximized" if an annotation is added outside its
   boundaries.

See Also

   gsn_create_labelbar, gsn_create_legend, gsn_text, gsn_text_ndc,
   gsn_add_text, gsn_polygon, gsn_polymarker_ndc, gsn_polyline,
   gsn_polygon_ndc, gsn_polymarker_ndc, gsn_polyline_ndc, gsn_add_polygon,
   gsn_add_polymarker, gsn_add_polyline, gsn_add_shapefile_polylines,
   NhlRemoveAnnotation

Examples

   For some application examples, see:
     * Text example 9
     * Unique example 1

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
  res@gsnSpreadColors     = True ; the default in 6.1.0
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

  lbid = gsn_create_labelbar(wks,dimsizes(levels)+1,labels,lbres)

  annoid1 = gsn_add_annotation(plot,lbid,False)

;
; If you draw the plot at this point, labelbar will be in the
; middle of the plot, because this is the default.
;
 draw(plot)
 frame(wks)

;
; Remove annotation. Labelbar will be gone.
;
 NhlRemoveAnnotation(plot,annoid1)

;
; Default was that labelbar appeared in center of plot.
;
; Change the zone to 2 so the labelbar is outside the
; plot then center it under plot and move it down a smidge.
;
 amres = True
 amres@amZone           = 2
 amres@amParallelPosF   = 0.5            ; Center labelbar.
 amres@amOrthogonalPosF = 0.1            ; Move down, away from plot

 annoid2 = gsn_add_annotation(plot,lbid,amres)

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
 NhlRemoveAnnotation(plot,annoid2)

 draw(plot)
 frame(wks)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

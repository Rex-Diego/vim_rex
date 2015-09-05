THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_create_labelbar.shtml
THE_TITLE:gsn_create_labelbar
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_create_labelbar

   Creates a labelbar.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_create_labelbar (
                wks    [1] : graphic,
                nboxes [1] : integer,
                labels [*] : string,
                res    [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   nboxes

   The number of labelbar boxes you want.
   labels

   An array of strings containing the labelbar labels.
   res

   A variable containing an optional list of labelbar resources, attached
   as attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the labelbar created is returned. This is useful if you
   want to use gsn_add_annotation to attach the labelbar to a plot.

Description

   This function creates a labelbar, given the number of boxes and labels
   for each box and returns an id for the labelbar. It is possible to have
   a different number of labels than you do boxes, depending on how you
   label the boxes (by the box centers, box exterior edges, or box
   interior edges). Note that this function does not draw the labelbar. To
   do this, you must call draw and pass it the labelbar id created.

   This function is similar to the procedure gsn_labelbar_ndc, except it
   returns the labelbar id.

   If you want the ends of your labelbar to be triangular instead of
   rectangular, then see example "lb_16.ncl" on the labelbar applications
   page.

See Also

   gsn_labelbar_ndc, gsn_create_legend, gsn_create_text,
   gsn_add_annotation

Examples

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

  lbid = gsn_create_labelbar(wks,dimsizes(levels)+1,labels,lbres)

  annoid = gsn_add_annotation(plot,lbid,False)

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
 amres = True
 amres@amZone           = 2
 amres@amParallelPosF   = 0.5            ; Center labelbar.
 amres@amOrthogonalPosF = 0.1            ; Move down, away from plot

 annoid = gsn_add_annotation(plot,lbid,amres)

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

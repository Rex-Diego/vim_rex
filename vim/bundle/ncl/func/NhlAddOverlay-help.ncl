THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlAddOverlay.shtml
THE_TITLE:NhlAddOverlay
   NCL Home > Documentation > Functions > NCL object routines, Graphics
   routines

NhlAddOverlay

   Overlays one plot object on another.

Prototype

        procedure NhlAddOverlay (
                base_id      [1] : graphic,
                transform_id [1] : graphic,
                after_id     [1] : graphic
        )

Arguments

   base_id

   The base plot of the overlay chain of plots. The object referenced must
   support overlays.
   transform_id

   The graphical object to be overlaid on the base_id plot. The object
   must be one of the Transform objects; that is, an object that can go
   through a transformation to become part of the base_id plot. Examples
   of Transform objects include contour plots, XY plots, vector plots, and
   streamline plots.
   after_id

   If the base plot already contains one or more overlaid plots, then
   after_id identifies the existing overlay that the new overlay is to
   follow in the overlay sequence. A value less than 0 specifies that the
   new overlay is to be added to the end of the sequence. If the value is
   the id of the base plot itself, the new overlay is placed just behind
   the base plot in the sequence.

Description

   The NhlAddOverlay procedure is used to set the transform object so it
   will be drawn over the base_id plot. The base_id plot must have the
   same workstation parent as the transform_id object, and it cannot
   already be an overlaid plot itself. The transform_id object will become
   a plot member of the base_id plot.

   The base plot will provide the coordinate transformation and data
   boundaries that together determine where the data coordinate space
   belonging to the overlay will appear, and how much of it will be
   visible. In addition, if the transform is a plot object, the base plot
   assumes management responsibilities for the plot object's plot members
   if it has any.

   If the base plot already has overlays, you can place the new overlay
   anywhere in the overlay sequence using the after_id parameter. The
   overlay sequence determines the basic drawing order for the overlays.

   Note that map plots cannot become overlay plots, although they can
   serve as base plots.

   Once you overlay transform_id plot, you can no longer draw it
   separately. You can only draw the base_id plot, which causes the base
   plot to be drawn along with all the plots that have been overlaid on
   it.

   This procedure is similar to overlay, only it has the additional
   after_id argument.

See Also

   overlay, NhlRemoveOverlay, NhlAddPrimitive

Examples

   For a GSN example that uses the overlay procedure, see examples 1 or 3
   in the "Contours overlaid on contours" section, and example 1 in the
   "Meteogram" section.

   Example 1
   This example creates a map plot and overlays vectors and contours using
   NhlAddOverlay. It then uses NhlRemoveOverlay to remove the vectors and
   redraw the plot (illustration only).
begin
  MSIZE = 73
  NSIZE = 73
  NROWS = 11

;
; Define our own colormap.
;
  cmap = (/(/1.0,1.0,1.0/), \
           (/0.0,0.0,0.0/), \
           (/0.9,0.9,0.9/), \
           (/0.6,0.6,0.6/), \
           (/0.3,0.3,0.3/), \
           (/0.8,0.9,1.0/), \
           (/0.5,0.0,0.5/), \
           (/0.0,0.5,0.7/), \
           (/0.0,0.0,0.0/), \
           (/0.00000,1.00000,0.00000/), \
           (/0.14286,1.00000,0.00000/), \
           (/0.28571,1.00000,0.00000/), \
           (/0.42857,1.00000,0.00000/), \
           (/0.57143,1.00000,0.00000/), \
           (/0.71429,1.00000,0.00000/), \
           (/0.85714,1.00000,0.00000/), \
           (/1.00000,1.00000,0.00000/), \
           (/1.00000,0.85714,0.00000/), \
           (/1.00000,0.71429,0.00000/), \
           (/1.00000,0.57143,0.00000/), \
           (/1.00000,0.42857,0.00000/), \
           (/1.00000,0.28571,0.00000/), \
           (/1.00000,0.14286,0.00000/), \
           (/1.00000,0.00000,0.00000/) /)
;
; Create an ncgmWorkstation object.
;
  wks = create "vc07Work" xWorkstationClass defaultapp
    "wkColorMap" : cmap
  end create

;
; Read the data file.
;
;   data(0,:,:) is U
;   data(1,:,:) is V
;   data(2,:,:) is P
;
  path = ncargpath("examples")
  data = asciiread(path + "/fcover.dat",(/3,73,73/),"float")
  data@_FillValue = -9999.0
;
; Massage the data to eliminate surplus of vectors near the pole
;
  ithin = (/90,15,5,5,4,4,3,3,2,2,2/)
  do j=1,NROWS
    data(0,NSIZE-j,ind(ispan(1,MSIZE,1) % ithin(j-1) .ne. 0)) = -9999.0
  end do

;
; Create a MapPlot object.
;
  map = create "mapplot" mapPlotClass wks
    "vpXF"                    : 0.05
    "vpYF"                    : 0.95
    "vpWidthF"                : 0.9
    "vpHeightF"               : 0.9

    "mpProjection"            : "Stereographic"
    "mpCenterLatF"            : 90.0
    "mpCenterLonF"            : 180.0
    "mpCenterRotF"            : 45.0
    "mpFillOn"                : True
    "mpGridAndLimbDrawOrder"  : "Draw"
    "mpGridLineDashPattern"   : 5
    "mpLabelsOn"              : False
    "mpLimitMode"             : "Corners"

    "mpLeftCornerLatF"        : 10.
    "mpLeftCornerLonF"        : -180.
    "mpRightCornerLatF"       : 10.
    "mpRightCornerLonF"       : 0.

    "mpLandFillColor"         : 3
    "mpOceanFillColor"        : 7
    "mpInlandWaterFillColor"  : 7
  end create

;
; Create a ScalarField object.
;
  sfield = create "ScalarField" scalarFieldClass defaultapp
    "sfDataArray"     : data(2,:,:)
    "sfMissingValueV" : data@_FillValue
    "sfXCStartV"      : -180.
    "sfYCStartV"      : -90.
    "sfXCEndV"        : 180.
    "sfYCEndV"        : 90.
  end create
;
; Create a VectorField object.
;
  vfield = create "VectorField" vectorFieldClass defaultapp
    "vfMissingUValueV" : -9999.0
    "vfMissingVValueV" : -9999.0

    "vfUDataArray"     : data(0,:,:)
    "vfVDataArray"     : data(1,:,:)
    "vfXCStartV"       : -180.
    "vfYCStartV"       :  -90.
    "vfXCEndV"         :  180.
    "vfYCEndV"         :   90.
  end create

;
; Create a VectorPlot object.
;
  vector = create "vectorplot" vectorPlotClass wks
    "vcUseScalarArray"         :  True
    "vcVectorFieldData"        :  vfield
    "vcScalarFieldData"        :  sfield
    "vcLevelSelectionMode"     : "ManualLevels"
    "vcMinLevelValF"           : 970.
    "vcMaxLevelValF"           : 1040.
    "vcLevelSpacingF"          : 5.
    "vcLevelColors"            : ispan(9,23,1)
    "vcLineArrowHeadMinSizeF"  :  0.007
    "vcLineArrowThicknessF"    : 3.0
    "vcMaxLevelCount"          : 15
    "vcMinFracLengthF"         : 0.4
    "vcMonoLineArrowColor"     : False
    "vcRefAnnoOn"              : False
    "vcRefLengthF"             : 0.054794524
  end create

  getvalues vector
    "vcMinMagnitudeF": vmin
    "vcMaxMagnitudeF": vmax
  end getvalues

  setvalues vector
    "vcMinMagnitudeF": vmin + 0.1 * (vmax - vmin)
  end setvalues

;
; Create a ContourPlot object.
;
  contour = create "contourplot" contourPlotClass wks
    "cnScalarFieldData"          : sfield
    "cnInfoLabelOn"              : False
    "cnLineColor"                : 6
    "cnLineLabelPerimOn"         : False
    "cnLineLabelsOn"             : False
    "cnLineThicknessF"           : 3.0
    "cnMaxLevelCount"            : 20
  end create

;
; Overlay the vectors and the contours on the map and draw
; everything.
;
  NhlAddOverlay(map,vector,map)
  NhlAddOverlay(map,contour,map)

  draw(map)
  frame(wks)

;
; Remove the vector overlay and redraw the plot.
;
  NhlRemoveOverlay(map,vector,False)
  draw(map)
  frame(wks)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

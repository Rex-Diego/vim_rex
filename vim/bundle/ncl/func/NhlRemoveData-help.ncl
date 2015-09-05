THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlRemoveData.shtml
THE_TITLE:NhlRemoveData
   NCL Home > Documentation > Functions > NCL object routines

NhlRemoveData

   Removes data items from one or more plots.

Prototype

        procedure NhlRemoveData (
                plot_objs [*] : graphic,
                resname   [1] : string,
                data_objs [*] : graphic
        )

Arguments

   plot_objs

   An array of one or more plot ids from which data are to be removed.
   resname

   The resource name from which the data should be removed.
   data_objs

   An array of one or more DataItem instances to be removed from each of
   the given plot_objs.

Description

   The NhlRemoveData procedure removes one or more DataItem instances from
   one or more plots, given the resource name from which the data should
   be removed.

   The data items being removed should have been added with the NhlAddData
   function, or added using the create or setvalues statements.

See Also

   NhlAddData, NhlUpdateData

Examples

   This example shows how to create an XY plot with a single curve, and
   then use NhlAddData to add additional curves. It then uses
   NhlRemoveData to remove some of the curves (just for illustration on
   how to do this).

load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
;
; Create array to contain dataitem ids.
;
  ncurve  = 10
  npts    = 100
  dataids = new(ncurve-1,graphic)
  addids  = new(ncurve-1,graphic)

;
; Initialize some dummy data for the xy plot.
;

  ii = new((/ncurve,npts/),float)
  jj = new((/npts,ncurve/),float)
  ii = onedtond(ispan(0,npts-1,1),(/ncurve,npts/))
  jj = onedtond(ispan(1,ncurve,1),(/npts,ncurve/))
  jj!0 = "x"
  jj!1 = "y"

  pi = 3.14159
  y = jj(y | :,x | :)*sin((2.*ii*pi)/((npts-(jj(y | :, x | :)-1)*10)-1))
  delete(ii)
  delete(jj)

;
; Begin graphics section.
;
  wks = gsn_open_wks("x11","adddata")    ; open workstation

  res                  = True
  res@gsnMaximize      = True
  res@gsnDraw          = False
  res@gsnFrame         = False

  res@trYMinF          = min(y)    ; Make sure we have room to plot
  res@trYMaxF          = max(y)    ; all curves.

  res@xyLineColor      = 2
  res@xyLineThicknessF = 2.

;
; Create XY plot, but don't draw it yet.
;
  xy = gsn_y(wks,y(0,:),res)
;
; Loop through each curve. For each remaining curve, create
; the data object and add it to the existing XY plot.
;
  do i=1,ncurve-1
;
; Create data object.
;
    dataids(i-1) = create "xyData"+i coordArraysClass defaultapp
      "caYArray": y(i,0:(npts-i*10)-1)
    end create
;
; Add to existing plot.
;
    addids(i-1) = NhlAddData(xy,"xyCoordData",dataids(i-1))
;
; Set some resources for this particular curve.
;
    setvalues addids(i-1)
      "xyLineColor"      : i+3
      "xyLineThicknessF" : 1.02*(i+2)
    end setvalues
  end do

;
; Now draw the plot and advance the frame. You should see all
; ten curves, each with a different color and thickness.
;
  draw(xy)
  frame(wks)

;
; Remove every other data item and redraw.
; You should see only five curves now.
;
  NhlRemoveData(xy,"xyCoordData",dataids(::2))
  draw(xy)
  frame(wks)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

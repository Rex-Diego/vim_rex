THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlAddData.shtml
THE_TITLE:NhlAddData
   NCL Home > Documentation > Functions > NCL object routines

NhlAddData

   Adds one or more additional data items to a plot.

Prototype

        function NhlAddData (
                dcomms     [*] : graphic,
                res_name   [1] : string,
                data_items [*] : graphic
        )

        return_val [dimsizes(dcomms)][dimsizes(data_items)] :  graphic

Arguments

   dcomms

   An array of DataComm instances.
   res_name

   A single string containing a resource name to assign the data_items
   values to.
   data_items

   An array of DataItem instances to be added to each of the objects in
   the dcomms array.

Return value

   The return value is a multi-dimensional array of references to
   data-specific objects created by the add data call. The output is
   dimensioned m x n, where m is the length of dcomms, and n is the length
   of data_items.

Description

   The NhlAddData function can be used to assign each element of the
   data_items array to each element of the dcomms array. Note that only
   one resource name is used, so all objects in the dcomms array must
   accept the same resource.

See Also

   NhlUpdateData, NhlRemoveData

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

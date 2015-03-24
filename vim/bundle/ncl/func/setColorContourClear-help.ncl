THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/setColorContourClear.shtml
THE_TITLE:setColorContourClear
   NCL Home > Documentation > Functions > Graphics routines

setColorContourClear

   Sets the color contours between two given levels transparent.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function setColorContourClear (
                plot   : graphic,
                clow   : numeric,
                chigh  : numeric
        )

        return_val [1] :  graphic

Arguments

   plot

   The plot to be modified.
   clow

   The low value of the range of contours that the user wishes to set to
   transparent.
   chigh

   The high value of the range of contours that the user wishes to set to
   transparent.

Return value

   plot will be returned with the given color contours modified.

Description

   This function sets contours in the range clow to chigh to clear
   (transparent).

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin
  f      = addfile ("/cgd/cas/shea/MURPHYS/ATMOS/80.nc", "r")
  x      = f->U(0,17,:,:)       ;Grab first timestep, 17th sigma level

  wks = gsn_open_wks("ps","test")
  res                     = True
  res@gsnDraw = False
  res@gsnFrame = False
  plot = gsn_csm_contour_map_ce(wks,x,res)
  plot = setColorContourClear(plot,-5.,5.)      ;set all contours between -5 and
 5 m/s to transparent
  draw(plot)
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

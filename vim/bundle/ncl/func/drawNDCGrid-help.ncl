THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/drawNDCGrid.shtml
THE_TITLE:drawNDCGrid
   NCL Home > Documentation > Functions > Graphics routines

drawNDCGrid

   Draws NDC grid lines at 0.1 NDC coordinate intervals and labels them.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        procedure drawNDCGrid (
                wks  : graphic
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.

Description

   This procedure draws NDC grid lines at 0.1 NDC coordinate intervals and
   labels them. This procedure is useful to help determine placement of
   labels and lines on plots when using functions like gsn_add_text.

   The frame is not advanced in this procedure.

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin
  f      = addfile ("80.nc", "r")
  x      = f->U(0,17,:,:)       ; Grab first timestep, 17th sigma level

  wks = gsn_open_wks("ps","test")
  res                     = True
  res@gsnFrame = False
  plot = gsn_csm_contour_map_ce(wks,x,res)

  drawNDCGrid(wks)
  txres = True
  txres@txFontHeightF = 0.015
  gsn_text_ndc(wks,"Now I can exactly place the text where I want it to be!",0.5
,0.2,txres)
  frame(wks)       ; The above text will be centered at .5 X NDC coordinate (mid
dle of the page),
                   ; and .2 Y NDC coordinate (near bottom of the page)

end

   For an application example, see:
     * "text_3.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/infoTimeStamp.shtml
THE_TITLE:infoTimeStamp
   NCL Home > Documentation > Functions > Graphics routines

infoTimeStamp

   Draws two text strings at the bottom of the workstation to indicate the
   time the plot was created and other information.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        procedure infoTimeStamp (
                wks          : graphic,
                font_height  : float,
                other_info   : string
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   font_height

   The font height of the text strings.
   other_info

   A user-supplied text string that will appear on the bottom right of the
   workstation.

Description

   This procedure draws a text string at the bottom left of the given
   workstation to indicate the time the visualization was created, and
   draws the other_info text string at the bottom right of the
   workstation. The frame is not advanced in this procedure.

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin
;
; Read in netCDF file.
;
  a = addfile("uv300.nc","r")
  u = a->U(0,:,8)
;
; Create plot.
;
  wks = gsn_open_wks("ncgm","infoTimeStamp")

  res                 = True                     ; plot mods desired
  res@gsnFrame        = False                    ; don't advance frame yet

  plot = gsn_csm_xy(wks,u&lat,u,res)             ; create xy plot
;
; Add time stamp.
;
  infoTimeStamp(wks,0.015,"infoTimeStamp test")
  frame(wks)                                     ; now advance frame
end


   For an application example, see:
     * "text_8.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

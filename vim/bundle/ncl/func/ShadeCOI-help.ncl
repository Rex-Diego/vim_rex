THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/ShadeCOI.shtml
THE_TITLE:ShadeCOI
   NCL Home > Documentation > Functions > Graphics routines

ShadeCOI

   Adds the cone of influence as a shaded polygon.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function ShadeCOI (
                wks   : graphic,
                plot  : graphic,
                w     : numeric,
                time  : numeric,
                res   : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   plot

   A plot to add the cone of influence polygon to. It can be an identifier
   created by using one of the many gsn functions, or by calling create to
   create a View object.
   w

   The data array (returned from the wavelet function); it must contain a
   "coi" attribute.
   time

   The time values corresponding with the coi values.
   res

   Optional list of GraphicStyle resources (for polygon fill).

Return value

   plot will be returned with the cone of influence shaded.

Description

   This function adds the cone of influence (returned from the wavelet
   function) as a shaded polygon. To control how the polygon is shaded,
   you can set res to True and set res@gsFillIndex resource to the desired
   fill pattern.

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin
  f      = addfile ("/fs/cgd/home0/shea/ncld/test/sst_nino3.nc", "r")
  x      = f->SST
  N      = dimsizes(x)   ; number of elements [here 504]

  mother = 0             ; Morlet wavelet
  param  = 6.0           ; common for Morlet
  dt     = 0.25
  s0     = 0.25
  dj     = 0.25          ; 4 sub-octaves per octave
  jtot   = 44            ; =subScale*11
  npad   = 1024          ; pad with extra zeros
  nadof  = new( 2,float) ; ignored

  noise  = 1             ; test vs red noise
  siglvl = 0.05
  isigtest= 0

  w      = wavelet (x,mother,dt,param,s0,dj,jtot,npad \
                     ,noise,isigtest,siglvl,nadof)

                           ; create coordinate arrays for plot
  power            = onedtond( w@power, (/jtot,N/) )
  power!0          = "period"                        ; Y axis
  power.     = w@period
  power!1          = "time"                          ; X axis
  power&time       = x&time
  power@long_name  = "Power Spectrum"
  power@units      = "C^2/unit-freq"

  wks = gsn_open_wks("ps","wavelet")
  res                     = True
  res@cnFillOn            = True
  res@trYReverse          = True
  res@gsnSpreadColors     = True
  res@gsnDraw = False
  res@gsnFrame = False
  plot = gsn_csm_contour(wks,power({0:64},:),res)
  plot = ShadeCOI(wks,plot,w,x&time,False)
  draw(plot)
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

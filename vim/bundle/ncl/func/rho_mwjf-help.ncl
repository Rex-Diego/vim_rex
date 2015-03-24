THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/rho_mwjf.shtml
THE_TITLE:rho_mwjf
   NCL Home > Documentation > Functions > Oceanography

rho_mwjf

   Computes ocean water density given a specified range for potential
   temperature (deg Celisus) and salinity (psu).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function rho_mwjf (
                t2d [*][*] : numeric,
                s2d [*][*] : numeric,
                depth  [1] : numeric
        )

        return_val  :  typeof(t2d)

Arguments

   t2d

   A two-dimensional array of temperature values (must be deg C).
   s2d

   A two-dimensional array of the same size as t2d containing salinity
   values (must be psu).
   depth

   A scalar value for depth at which to compute density (meters).

Return value

   The results are returned in an array of the same type and size as t2d.

Description

   This function computes potential density for a specifed range or
   potential T and Salt. It can also be used for water mass T-S diagrams
   (see the example below).

   This function is based on Steve Yeager's "Rhoalphabeta", which uses the
   CESM3 POP equation of state "mwjf" calculation to compute density.

   Note: In September 2009, Dr. Arne Melson [Norwegian Meteorological
   Institute, R & D - Oceanography ] noted that the results were
   applicable for computing surface potential density only, i.e., where
   depth=0. A modification has since been applied [version 5.2.0] to
   accurately compute all density surfaces (depth >= 0).

   References:
  Levitus, S., R. Burgett, and T.P. Boyer, World Ocean Atlas
    1994, Volume 3: Salinity, NOAA Atlas NESDIS 3, US Dept. of
    Commerce, 1994.
  Levitus, S. and T.P. Boyer, World Ocean Atlas 1994,
    Volume 4: Temperature, NOAA Atlas NESDIS 4, US Dept. of
    Commerce, 1994.
  Dukowicz, J. K., 2000: Reduction of Pressure and Pressure
    Gradient Errors in Ocean Simulations, J. Phys. Oceanogr.,
    submitted.

Examples

; read potential temp (TEMP), salinity (SALT)
; compute potential density (PD) for specified range PD(t,s)
; (use ncl function based yeager's algorithm for rho computation)
; assumes annual and zonally avgeraged input data set (i.e, one time slice)
; used k.lindsay's "za" for zonal avg -- already binned into basins
; plots temp vs salt (scatter plot), pd overlay

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

begin
; ================================>  ; PARAMETERS
  case    = "PHC2_gx1v3"
  ocnfile = "za_PHC2_T_S_gx1v3.nc"

  depth_min = 14895.82   ; in cm, depth of first layer to be included
  depth_max =  537499.9
;
; plot limits
;
  smincn = 32.5
  smaxcn = 37.0
  tmincn = -2.
  tmaxcn = 22.
;
; Choose basin index
;
; 0 = global  1 = southern ocean 2 = pacific 3 = indian 6 = atlantic
; 8 = labrador 9 = GIN 10 = arctic
;
  bi = 2

;=====> basin check

  if(bi.lt.0.or.bi.gt.10) then
    print("basin index "+ bi + " not supported")
    exit
  end if

  if(bi.eq.0) then
    basin = "Global"
    blab = "global"
  end if
  if(bi.eq.1) then
      basin = "Southern Ocean"
      blab = "so"
  end if
  if(bi.eq.2) then
    basin = "Pacific Ocean"
    blab = "pacific"
  end if
  if(bi.eq.3) then
    basin = "Indian Ocean"
    blab = "indian"
  end if
  if(bi.eq.6) then
    basin = "Atlantic Ocean"
    blab = "atlanticn"
  end if
  if(bi.eq.8) then
    basin = "Labrador Sea"
    blab = "lab"
  end if
  if(bi.eq.9) then
    basin = "GIN Sea"
    blab = "gin"
  end if
  if(bi.eq.10) then
    basin = "Arctic Ocean"
    blab = "arctic"
  end if

;=====> initial resource settings

  wks = gsn_open_wks("ps","TS_diagram")    ; Open a Postscript file

;===== data
  focn = addfile(ocnfile, "r")
  salt = focn->SALT(0,:,{depth_min:depth_max},:)   ;(basins, z_t, lat_t)
  temp = focn->TEMP(0,:,{depth_min:depth_max},:)

;====section out choice basin
  temp_ba = temp(bi,:,:)
  salt_ba = salt(bi,:,:)

;===== put into scatter array format
  tdata_ba = ndtooned(temp_ba)
  sdata_ba = ndtooned(salt_ba)

  ydata = tdata_ba
  xdata = sdata_ba

;============== compute potenial density (PD), using rho_mwjf
;
; for potential density, depth = 0. (i.e. density as if brought to surface)
;
;===========================================================================
; WARNING: T-S diagrams use POTENTIAL DENSITY... if set depth to something
; other then 0, then you will be plotting density contours computed for the
; specified depth layer.
;===========================================================================

  depth = 0.  ;in meters
  tspan = fspan(tmincn,tmaxcn,51)
  sspan = fspan(smincn,smaxcn,51)

  ; the more points the better... using yeager's numbers

  t_range = new((/51,51/),float)
  s_range = new((/51,51/),float)
  t_range = conform(t_range,tspan,0)
  s_range = conform(s_range,sspan,1)

  pd = rho_mwjf(t_range,s_range,depth)

  pd!0    = "temp"
  pd!1    = "salt"
  pd&temp = tspan
  pd&salt = sspan
  pd = 1000.*(pd-1.)        ; Put into kg/m3 pot den units

  printVarSummary(pd)
  printVarInfo(pd,"rho_mwjf")

;=================Graphics

;--- scatter plot
  res                     = True
  res@gsnDraw             = False
  res@gsnFrame            = False
  res@xyMarkLineModes     = "Markers"
  res@xyMarkers           = 16
  res@xyMarkerColors      = "black"
  res@pmLegendDisplayMode = "Never"
  res@txFontHeightF       = 0.01
  res@tiXAxisString       = salt@units
  res@tiXAxisFontHeightF  = 0.02
  res@tiYAxisString       = temp@units
  res@tiYAxisFontHeightF  = 0.02
  res@trXMinF             = smincn
  res@trXMaxF             = smaxcn
  res@trYMinF             = tmincn
  res@trYMaxF             = tmaxcn
  res@gsnRightString      = depth_min/100. + "-"+depth_max/100. +"m"
  res@gsnLeftString       = basin

  plot = gsn_csm_xy(wks,xdata,ydata,res)

;----- pd overlay
  resov                          = True
  resov@gsnDraw                  = False
  resov@gsnFrame                 = False
  resov@cnLevelSelectionMode     = "AutomaticLevels"
  resov@cnInfoLabelOn            = "False"
  resov@cnLineLabelPlacementMode = "Constant"
  resov@cnLineLabelFontHeightF     = ".02"

  plotpd = gsn_csm_contour(wks,pd,resov)
  overlay(plot,plotpd)


; panel resources
  pan                     = True
  pan@gsnMaximize         = True
  pan@gsnPaperOrientation = "portrait"
  pan@txFontHeightF       = 0.025
  pan@txString            = case + " ANN AVG:  T-S Diagram  "
  gsn_panel(wks,plot,(/1,1/),pan)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

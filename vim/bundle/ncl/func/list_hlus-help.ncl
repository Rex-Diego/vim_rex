THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/list_hlus.shtml
THE_TITLE:list_hlus
   NCL Home > Documentation > Functions > NCL object routines

list_hlus

   Lists all of the HLU objects currently referenced by NCL variables.

Prototype

        procedure list_hlus (
        )

Description

   This procedure lists every variable reference to an HLU object
   currently in the NCL identifier list. An HLU object is what is returned
   by many the gsn plotting functions, or by a create call in NCL.

   If list_hlus is executed on the NCL command line, this invokes a pager
   for scrolling through the list. The pager is either "more" or whatever
   the user's PAGER environment variable is set to.

See Also

   list_files, list_procfuncs, list_vars

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
;
; Read in netCDF file.
;
  a = addfile("$NCARGTEST/nclscripts/plotting/uv300.nc","r")
  u = a->U(0,:,:)
;
; Open a workstation.
;
  wks = gsn_open_wks("ncgm","gsn_csm_y")

;
; Set some resources.
;
  res                        = True                        ; plot mods desired
  res@gsnMaximize            = True
  res@tiMainString          = "Example of gsn_csm_y"      ; title
;
; Create a plot.
;
  plot = gsn_csm_y(wks,u(:,30),res)

;
; Print the list of "HLU" objects.
;
  list_hlus()

end

   The output from the list_hlus call above is:
Variable: plot
        gsn_csm_y_xy    xyPlotClass

Variable: wks
        gsn_csm_y       ncgmWorkstationClass


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

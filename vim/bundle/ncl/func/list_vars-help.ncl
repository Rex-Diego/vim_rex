THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/list_vars.shtml
THE_TITLE:list_vars
   NCL Home > Documentation > Functions > Variable query

list_vars

   Lists the currently defined variables that do not reference files or
   HLU objects.

Prototype

        procedure list_vars (
        )

Description

   This procedure lists all of the currently defined variables, their
   types, and their dimensionality. If run at the command line, this
   procedure invokes a pager for scrolling through the list. The pager is
   either "more" or whatever the user's PAGER environment variable is set
   to.

See Also

   list_files, list_hlus, list_procfuncs

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
; Print the list of variables and their dimensions.
;
  list_vars()

end

   The output from the list_vars call above is:
float   u [ lat | 64 ] x [ lon | 128 ]
        time
        _FillValue
        long_name
        short_name
        units

logical res [ 1 ]
        tiMainString
        gsnMaximize

   Note that a, wks, and plot are not included, because these reference
   either files or HLU objects. See list_hlus or list_files if you want to
   list these.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

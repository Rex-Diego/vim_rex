THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/clear.shtml
THE_TITLE:clear
   NCL Home > Documentation > Functions > Workstation routines

clear

   Clears the given workstation objects.

Prototype

        procedure clear (
                wks  : graphic
        )

Arguments

   wks

   An array of any dimensionality of NCL Workstation identifiers. The
   identifiers are ones returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

Description

   This procedure loops through the given list of workstation identifiers
   and clears the workstation. If any of the workstations were set up to
   pause on the clear procedure, they must have a button click or key
   click in them before the actual clearing occurs.

See Also

   NhlClearWorkstation, frame, update

Examples

   Run this script and see how the use of "clear" affects whether the two
   XY plots get drawn on the same window.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  x = (/10.,20.,30.,40.,50.,60.,70.,80.,90./)
  y = (/0.,0.71,1.,0.7,0.002,-0.71,-1.,-0.71,-0.003/)

  wtype = "x11"
  wks = gsn_open_wks(wtype,"clear_example")

  res             = True
  res@gsnMaximize = False
  res@gsnFrame    = False    ; Must be set False, otherwise a new
                             ; X11 window will be created.

  plot = gsn_xy(wks,x,y,res)

  clear(wks)    ; If "wtype" is "ps", this behaves like a page advance

  y2 = (/(/0., 0.7, 1., 0.7, 0., -0.7, -1., -0.7, 0./),\
        (/2., 2.7, 3., 2.7, 2.,  1.3,  1.,  1.3, 2./),\
        (/4., 4.7, 5., 4.7, 4.,  3.3,  3.,  3.3, 4./)/)

  plot = gsn_xy(wks,x,y2,res)

  frame(wks)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

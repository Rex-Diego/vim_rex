THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlAppGetDefaultParentId.shtml
THE_TITLE:NhlAppGetDefaultParentId
   NCL Home > Documentation > Functions > NCL object routines

NhlAppGetDefaultParentId

   Returns a reference to the current default App object.

Prototype

        function NhlAppGetDefaultParentId (
        )

        return_val [1] :  graphic

Description

   This function returns a reference to the current default App object.
   The default App object controls which resource database is used by
   default when creating NCL objects.

See Also

   NhlGetParentWorkstation, NhlGetParentId, NhlGetWorkspaceObjectId,

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("ncgm","test")

  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)
  xy   = gsn_y(wks,y,False)

  parent = NhlAppGetDefaultParentId()
  print(parent)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

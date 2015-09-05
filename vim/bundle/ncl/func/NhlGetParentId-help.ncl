THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlGetParentId.shtml
THE_TITLE:NhlGetParentId
   NCL Home > Documentation > Functions > NCL object routines

NhlGetParentId

   Returns the ids of the parent ids of the given objects.

Prototype

        function NhlGetParentId (
                objs  : graphic
        )

        return_val [dimsizes(objs)] :  graphic

Arguments

   objs

   An array of one or more NCL objects whose parent ids are requested.

Description

   This function returns an array of parent object ids. If an object has
   no parent, either the default parent is returned if the object was
   created with the defaultapp as the parent, or the parent id that was
   provided with the object's create statement.

See Also

   NhlAppGetDefaultParentId, NhlGetWorkspaceObjectId,
   NhlGetParentWorkstation

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("ncgm","test")

  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)
  xy   = gsn_y(wks,y,False)

  parent_ids = NhlGetParentId((/wks,xy/))
  print(parent_ids)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

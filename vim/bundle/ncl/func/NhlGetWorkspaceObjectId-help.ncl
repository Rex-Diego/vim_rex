THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlGetWorkspaceObjectId.shtml
THE_TITLE:NhlGetWorkspaceObjectId
   NCL Home > Documentation > Functions > NCL object routines

NhlGetWorkspaceObjectId

   Returns a reference to the current Workspace object.

Prototype

        function NhlGetWorkspaceObjectId (
        )

        return_val [1] :  graphic

Description

   The Workspace object manages blocks of memory used by the NCL objects.
   This function returns a reference to the workspace object so the
   workspace array sizes may be configured by the user.

See Also

   NhlGetParentWorkstation, NhlGetParentId, NhlGetParentWorkstation

Examples

   The following code snippet shows how to use the NhlGetWorkspaceObjectId
   function to increase the maximum workspace memory:

  wks = gsn_open_wks("x11","example")

  setvalues NhlGetWorkspaceObjectId()
    "wsMaximumSize" : 300000000
  end setvalues

   This is useful if you find yourself getting an error message from NCL
   that looks like this:
fatal:ContourPlotPreDraw: Workspace reallocation would exceed maximum size 10000
0000
fatal:ContourPlotDraw: draw error
warning:WorkstationDeactivate: workstation not active or not opened


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

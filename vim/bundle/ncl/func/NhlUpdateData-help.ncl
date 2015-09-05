THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlUpdateData.shtml
THE_TITLE:NhlUpdateData
   NCL Home > Documentation > Functions > NCL object routines

NhlUpdateData

   Forces the DataComm instances to update their internal states.

Prototype

        procedure NhlUpdateData (
                dcomms [*] : graphic
        )

Arguments

   dcomms

   An array of ids of the DataComm classes to be updated.

Description

   This procedure forces the DataComm instances to update their internal
   states to reflect any changes that have occurred in the DataItem
   instances that have been associated with the DataComm instances.

   This procedure is really only useful when the items in dcomms have the
   resource dcDelayCompute set to True. When this is True, DataComm
   instances are not notified of changes to their data items. This
   procedure tells each object in dcomms to check for changes in its data.
   These data were added with the NhlAddData or added using create or
   setvalues.

See Also

   NhlAddData, NhlRemoveData


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

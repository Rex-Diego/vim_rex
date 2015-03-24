THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlUpdateWorkstation.shtml
THE_TITLE:NhlUpdateWorkstation
   NCL Home > Documentation > Functions > Workstation routines

NhlUpdateWorkstation

   Updates the given workstation objects.

Prototype

        procedure NhlUpdateWorkstation (
                wks  : graphic
        )

Arguments

   wks

   An array of any dimensionality of NCL Workstation identifiers. The
   identifiers are ones returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

Description

   The NhlUpdateWorkstation procedure is used to flush the internal
   buffers of HLU Workstation instances.

   Note: this procedure is identical to the update procedure, and we
   encourage the use of update instead (saves having to type longer names
   and capital letters).

See Also

   clear, update, frame


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

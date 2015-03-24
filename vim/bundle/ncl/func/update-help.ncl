THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/update.shtml
THE_TITLE:update
   NCL Home > Documentation > Functions > Workstation routines

update

   Updates the given workstation objects.

Prototype

        procedure update (
                wks  : graphic
        )

Arguments

   wks

   An array of any dimensionality of NCL Workstation identifiers. The
   identifiers are ones returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

Description

   The update procedure is used to flush the internal buffers of NCL
   Workstation instances.

See Also

   clear, NhlUpdateWorkstation, frame


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlClearWorkstation.shtml
THE_TITLE:NhlClearWorkstation
   NCL Home > Documentation > Functions > Workstation routines

NhlClearWorkstation

   Clears the given workstation objects.

Prototype

        procedure NhlClearWorkstation (
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

   Note: this procedure is identical to the clear procedure, and we
   encourage the use of clear instead (saves having to type longer names
   and capital letters).

See Also

   clear, frame, update


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

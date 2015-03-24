THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/mjo_cross_coh2pha.shtml
THE_TITLE:mjo_cross_coh2pha
   NCL Home > Documentation > Functions > CESM

mjo_cross_coh2pha

   Calculate space-time coherence-squared and phase using the array
   returned by mjo_cross_segment .

Prototype

        procedure mjo_cross_coh2pha (
                STC [16][*][*] : numeric,
                opt        [1] : integer
        )

Arguments

   STC

   A three dimensional variable array as returned by mjo_cross_segment.
   opt

   Currently, not used. Set to 0.

Description

   The only time this is used is when elements (0:7,:,:) have been
   averaged over multiple segments. This will compute the
   coherence-squared and phase using averaged power and cross-power
   quantities. The input array, STC, will be updated appropriately. The
   following will not be changed:
         ( 0,:,:)  -  symmetric power spectrum of x
         ( 1,:,:)  -  asymmetric power spectrum of x
         ( 2,:,:)  -  symmetric power spectrum of y
         ( 3,:,:)  -  asymmetric power spectrum of y
         ( 4,:,:)  -  symmetric cospectrum
         ( 5,:,:)  -  asymmetric cospectrum
         ( 6,:,:)  -  symmetric quadrature spectrum
         ( 7,:,:)  -  asymmetric quadrature spectrum

   The following will be computed using the input power and cross power
   quantities:
         ( 8,:,:)  -  symmetric coherence-squared spectrum
         ( 9,:,:)  -  asymmetric coherence-squared spectrum
         (10,:,:)  -  symmetric phase spectrum
         (11,:,:)  -  asymmetric phase spectrum
         (12,:,:)  -  symmetric component-1 phase spectrum
         (13,:,:)  -  asymmetric component-1 phase spectrum
         (14,:,:)  -  symmetric component-2 phase spectrum
         (15,:,:)  -  asymmetric component-2 phase spectrum

   The coordinate frequencies span 0.0 to 0.5. The coordinate wavenumbers
   span -M/2 to M/2 where M is the number of longitudes.

   See the Level 2 diagnostics description titled MULTI-SCALE INTERACTIONS
   at the US-CLIVAR MJO diagnostics website

See Also

   mjo_cross_segment, mjo_cross, mjo_spectra, wkSpaceTime, wkSpaceTime_cam

Examples

   See Example 11 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/mjo_cross_segment.shtml
THE_TITLE:mjo_cross_segment
   NCL Home > Documentation > Functions > CESM

mjo_cross_segment

   Calculate space-time cross spectrum for a single time segment.

Prototype

        function mjo_cross_segment (
                x [*][*][*] : numeric,
                y [*][*][*] : numeric,
                opt     [1] : integer
        )

        return_val  :

Arguments

   x

   A three dimensional variable array. Nominally: (time,lat,lon).
   The longitudes should be global while the latitudes should span just
   the south-north region of interest. The size of the 'time' dimension
   should be the size of the desired segment length. EG: for daily mean
   data, the size of the time dimension is typically 96, 128, 256, etc.
   y

   A three dimensional variable array similar to
   . Nominally: (time,lat,lon). opt

   Currently, not used. Set to 0.

Return value

   The return variable will be a three-dimensional array
   (16,wavenumber,frequency) containing the 16 cross spectral quantities
   associated with the specific time segment.
         ( 0,:,:)  -  symmetric power spectrum of x
         ( 1,:,:)  -  asymmetric power spectrum of x
         ( 2,:,:)  -  symmetric power spectrum of y
         ( 3,:,:)  -  asymmetric power spectrum of y
         ( 4,:,:)  -  symmetric cospectrum
         ( 5,:,:)  -  asymmetric cospectrum
         ( 6,:,:)  -  symmetric quadrature spectrum
         ( 7,:,:)  -  asymmetric quadrature spectrum
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

Description

   See the Level 2 diagnostics description titled MULTI-SCALE INTERACTIONS
   at the US-CLIVAR MJO diagnostics website

See Also

   mjo_cross, mjo_spectra, wkSpaceTime, wkSpaceTime_cam

Examples

   See Example 11 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

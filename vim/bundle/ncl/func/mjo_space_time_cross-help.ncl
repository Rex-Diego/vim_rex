THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/mjo_space_time_cross.shtml
THE_TITLE:mjo_space_time_cross
   NCL Home > Documentation > Functions > CESM

mjo_space_time_cross

   Calculate space-time cross spectrum over multiple segments.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        function mjo_space_time_cross (
                x    [*][*][*] : numeric,
                y    [*][*][*] : numeric,
                segLength  [1] : integer,
                segOverLap [1] : integer,
                opt        [1] : True
        )

        return_val  :

Arguments

   x

   A three dimensional variable array. Nominally: (time,lat,lon).
   y

   A three dimensional variable array. Nominally: (time,lat,lon).
   segLength

   Length of the segment.
   segOverLap

   Length of the segment.
   opt

   Currently, not used. Set to False.

Return value

   The return variable will be a three-dimensional array
   (12,wavenumber,frequency) containing the 12 cross spectral quantities
   averaged over all segments.
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

   The returned variable will have the following attributes:
   segmentLength - segment length
  segmentOverLap - segment overlap
   segmentRepeat - repeat overlap
             dof - degrees of freedom
            prob - (/0.80, 0.85, 0.90, 0.925, 0.95, 0.99/)
       prob_coh2 - coherence-squared levels corresponding to prob

   and the following coordinate variables:
   freq - frequencies [ 0.0 to 0.5 cycles per day ]
   wave - wave number [-M/2 to M/2 where M is the number of longitudes ]

Description


See the Level 2 diagnostics description:  MULTI-SCALE INTERACTIONS.

US-CLIVAR MJO diagnostics website . Click on "Description";
then the Level 2 "See more specific discussion"


See Also


mjo_spectra,
wkSpaceTime,
wkSpaceTime_cam

Examples



See Example 11 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

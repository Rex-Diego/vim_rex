THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/resolveWavesHayashi.shtml
THE_TITLE:resolveWavesHayashi
   NCL Home > Documentation > Functions > CESM

resolveWavesHayashi

   Reorder the complex coefficients returned by cfftf to resolve the
   progressive and retrogressive waves.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        function resolveWavesHayashi (
                x [2][*][*] : numeric,
                window  [1] : integer,
                spd     [1] : integer
        )

        return_val  :

Arguments

   x

   A three-dimensionsl array. The leftmost dimension contain the real and
   imaginary coefficients; the middle dimension refers to 'longitude'; and
   , the rightmost dimension refers to 'time'.
   window

   Number of days per season/segment.
   spd

   Samples per day: spd=1 for daily data; spd=2 for 12-hourly data; etc.

Return value

   The return array will be two-dimensional. If the two rightmost
   dimensions of x are of sizes M and N, then the returned array will be
   of size (M+1,N+1). The '+1' comes from the 0-th wave and frequency.

Description

   The input x is partitioned as follows:
  Create return array POWER(M+1,N+1) which contains the power spectrum.
  all the following assume indexing starting with 0
  In this array, the negative wavenumbers will be from pn=0 to M/2-1;
  The positive wavenumbers will be for pn=M/2+1 to M.
  Negative frequencies will be from pt=0 to N/2-1
  Positive frequencies will be from pt=N/2+1 to N  .
  Information about zonal mean will be for pn=M/2  .
  Information about time mean will be for pt=N/2  .
  Information about the Nyquist Frequency is at pt=0 and pt=N

See Also

   wkSpaceTime, wkSpaceTime_cam

Examples

   See Example 10 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/relhum_ttd.shtml
THE_TITLE:relhum_ttd
   NCL Home > Documentation > Functions > Meteorology

relhum_ttd

   Calculates relative humidity given temperature and dew point
   temperature.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function relhum_ttd (
                t    : numeric,
                td   : numeric,
                opt  : integer
        )

        return_val [dimsizes(t)] :  numeric

Arguments

   t

   A multi-dimensional array containing the temperature (K). Array size
   and shape must match td.
   td

   A multi-dimensional array containing the dew point temperature (K).
   Array size and shape must match t.
   opt

   Set opt=0 for units of percent and 1 for units of fraction [0-1].

Return value

   A multi-dimensional array of the same sizes as t. The output will be
   double if any of the input is double, and float otherwise.

Description

   Calculates relative humidity given temperature (K) and dew point
   temperature (K).

   The returned values are similar to the results obtained using the
   algorithm in:

Ceaseless Wind, John Dutton. McGraw-Hill, 1976. pp 273-274

Examples

   Example 1

   Consider a sounding with the following values:
begin
  t  =(/  29.3,  \      ; C
          28.1,23.5,20.9,18.4,15.9,13.1,10.1, 6.7, 3.1,   \
          -0.5,-4.5,-9.0,-14.8,-21.5,-29.7,-40.0,-52.4,   \
         -59.2,-66.5,-74.1,-78.5,-76.0,-71.6,-66.7,-61.3, \
         -56.3,-51.7,-50.7,-47.5 /)
  td  = (/24.4,        ; C
          19.6, 15.5, 16.6, 16.8, 14.2, 9.40,  6.1, -4.2, \
          -5.1, -6.5,-12.6,-19.4,-25.0, -29.0, -33.3, -46.5, -58.2 /)


  tk   = t +273.15    ; change to Kelvin
  tdk  = td+273.15

  rh   = relhum_ttd (tk, tdk, 0)
  print(t+"   "+td+"   "+rh)
end

   The output would look like:
        t     td     rh %
       29.3   24.4   75.074
       28.1   19.6   60.164
       23.5   15.5   60.9728
       20.9   16.6   76.4957
       18.4   16.8   90.4179
       15.9   14.2   89.6561
       13.1    9.4   78.293
       10.1    6.1   76.2389
        6.7   -4.2   45.8646
        3.1   -5.1   54.986
       -0.5   -6.5   63.9372
       -4.5  -12.6   53.2835
       -9.0  -19.4   42.8393
      -14.8  -25.0   41.7266
      -21.5  -29.0   50.9249
      -29.7  -33.3   70.9325
      -40.0  -46.5   50.0697
      -52.4  -58.2   49.8948


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

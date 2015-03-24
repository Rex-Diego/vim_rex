THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/pres2hybrid.shtml
THE_TITLE:pres2hybrid
   NCL Home > Documentation > Functions > Meteorology

pres2hybrid

   Interpolates data on constant pressure levels to hybrid levels.

Prototype

        function pres2hybrid (
                p      [*] : numeric,
                ps         : numeric,
                p0     [1] : numeric,
                xi         : numeric,
                hyao   [*] : numeric,
                hybo   [*] : numeric,
                intflg [1] : integer
        )

        return_val  :  numeric

Arguments

   p

   A one dimensional array specifying the pressure levels. Must be
   top-to-bottom order and must have the same units as ps and p0.
   ps

   A multi-dimensional array containing pressures. Must be at least two
   dimensions and one dimension smaller than xi. The level dimension is
   ordered top-to-bottom. Must have the same units as p0.
   p0

   A scalar value equal to the surface reference pressure. Must have the
   same units as ps and p. Typically p0=100000 [Pa] or 1000 [hPa].
   xi

   A multi-dimensional array containing the variable to be interpolated.
   The three rightmost dimensions must be (pressure) level, lat, and lon.
   The level dimension is ordered top-to-bottom.
   hyao

   A one-dimensional array containing the hybrid coefficients A associated
   with the return_val. Must be ordered top-to-bottom. Must be unitless.
   hybo

   A one-dimensional array containing the hybrid coefficients B associated
   with the return_val. Must be ordered top-to-bottom. Must be unitless.
   intflg

   A scalar integer which specifies the type of extrapolation to be used.
   As of version 4.3.0, this variable was updated to recognize the
   following options:
    =0   no extrapolation. Values set to _FillValue
    =1   values set to nearest valid value
    =2   values less than min(p) set to nearest value
         values greater than max(p) are linearly extrapolated
    =3   values less than min(p) are linearly extrapolated
         values greater than max(p) set to nearest value
    =4   values than min(p) are extrapolated
         values greater than max(p) are extrapolated

Return value

   A multi-dimensional array of the same size as xi except that the level
   dimension has been replaced by the size of hyao. Double if xi or ps are
   double, float otherwise.

Description

   Interpolates from data on constant pressure levels to a set of hybrid
   levels.

   The basic approach is to calculate the pressure at each level for the
   output hybrid levels. Then interpolate the input variable to the
   pressures of the desired output hybrid levels.
   At each latitude, longitude and level (lev[k]) pressures are computed
   using:
             p(k) = A(k)*PO + B(k)*PS            (1)

   This is the form used by the Community Atmosphere Model (CAM) and it is
   the form expected by pres2hybrid. A visualization of the hybrid
   coordinate system is here. Typically, the A and B coefficients might
   have values like:
  A = 0.0048093, 0.0130731, 0.0325591, 0.0639471, 0.0816768, 0.0780201,
      0.0733671, 0.0676476, 0.0608624, 0.0531095, 0.0445995, 0.0356607,
      0.0267266, 0.0183069, 0.0109421, 0.005147 , 0.0013519, 0 ;

  B = 0, 0, 0, 0, 0.0173664, 0.0606928, 0.1158237, 0.1835918, 0.2639851,
      0.3558459, 0.456676, 0.5625875, 0.6684428, 0.768203, 0.8554653,
      0.9241285, 0.9690938, 0.9925282 ;

   If the "A" and "B"coefficients are different from (1) then it is the
   users responsibility to make the appropriate changes. For example, an
   alternative form of (1) is:
             p(k) = AP(k) + B(k)*PS             (2)

   In this form, each AP coefficient AP(k)=A(k)*PO. In this case the value
   of p0 input to pres2hybrid should be set to one [1.0].

See Also

   pres2hybrid_Wrap

Examples

   Example 1

   This example interpolates a variable from ECMWF's 23 pressure levels to
   a set of hybrid levels (26 here).

   diri = "./"
   filC = "sstclimt42_run01.cam2.h0.0001-01.nc"    ; CAM
   filT = "e4oper.an.pl.t85.t.198501"              ; ECMWF pressure level datase
t
   filP = "e4moda.an.ml.t85.psfc.1985.nc"          ; ECMWF surface pressure

   f    = addfile (diri+filT, "r")
   tp   = f->T                                     ; variable to be interpolated
   fP   = addfile (diri+filP, "r")
   psfc = fP->PSFC                                 ; surface pressure (Pa)
   p0   = 100000.                                  ; reference pressure (Pa)

   fC   = addfile (diri+filC, "r")
   hya  = fC->hyam                                 ; levels to which the variabl
e
   hyb  = fC->hybm                                 ; will be interpolated

   plev = tp@lev                                   ; hPa
   plev = plev*100.                                ; match units of p0 and psfc
   plev@units = "Pa"

   th   = pres2hybrid(plev,psfc,p0,tp,hya,hyb,0)          ; temperature on hybri
d levels


   If the input variable looks like:
          Variable: tp
          Type: float
          Total Size: 373817344 bytes
                      93454336 values
          Number of Dimensions: 4
          Dimensions and sizes:   [time | 124] x  [lev | 23] x [lat | 128] x [lo
n | 256]
          Coordinates:
                      time: [1621680..1622418]
                      lev: [1..1000]                      ; note these are hPa
                      lat: [-88.92773..88.92773]
                      lon: [ 0..358.53]
          Number Of Attributes: 3
            standard_name :       air_temperature
            units :       K
            long_name :   Temperature

   The output variable will look like:
          Variable: th
          Type: float
          Number of Dimensions: 4
          Dimensions and sizes:   [124] x  [26] x [128] x [256]

   Note that no meta data is preserved by the built-in function. To
   preserve meta data use pres2hybrid_Wrap .


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

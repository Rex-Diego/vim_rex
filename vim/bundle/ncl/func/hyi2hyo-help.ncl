THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/hyi2hyo.shtml
THE_TITLE:hyi2hyo
   NCL Home > Documentation > Functions > Meteorology

hyi2hyo

   Interpolates from data on one set of hybrid levels to another set of
   hybrid levels.

Prototype

        function hyi2hyo (
                p0     [1] : numeric,
                hyai   [*] : numeric,
                hybi   [*] : numeric,
                ps         : numeric,
                xi         : numeric,
                hyao   [*] : numeric,
                hybo   [*] : numeric,
                intflg [1] : integer
        )

        return_val  :  numeric

Arguments

   p0

   A scalar value equal to the surface reference pressure. Must have the
   same units as ps.
   hyai

   A one-dimensional array containing the hybrid coefficients A associated
   with xi. Must be ordered top-to-bottom. Must be unitless.
   hybi

   A one-dimensional array containing the hybrid coefficients B associated
   with xi. Must be ordered top-to-bottom. Must be unitless.
   ps

   A multi-dimensional array containing pressures. Must be at least two
   dimensions and one dimension smaller than xi. The level dimension is
   ordered top-to-bottom. Must have the same units as p0.
   xi

   A multi-dimensional array containing the variable to be interpolated.
   The three rightmost dimensions must be level, lat, and lon. The level
   dimension is ordered top-to-bottom.
   hyao

   A one-dimensional array containing the hybrid coefficients A associated
   with the return_val. Must be ordered top-to-bottom. Must be unitless.
   hybo

   A one-dimensional array containing the hybrid coefficients B associated
   with the return_val. Must be ordered top-to-bottom. Must be unitless.
   intflg

   A scalar integer which specifies the type of extrapolation to be used.
   A value of 0 will cause all values outside of input pressure range to
   be set to xi's missing value (if xi has none, then 1e20 is used for
   V5.2.1 and earlier or the default missing for float/double is used for
   V6.0.x and higher). A value of 1 will set output values to the closest
   input pressure level.

Return value

   A multi-dimensional array of the same size as xi except that the level
   dimension has been replaced by the size of hyao. Double if xi or ps are
   double, float otherwise. float.

Description

   Interpolates from data on one set of hybrid levels to another set of
   hybrid levels. It is assumed that hyai, hyab, ps and xi are from the
   same source.

   The basic approach is to calculate the pressures at each level for the
   input and output hybrid levels. Then interpolate in the input variable
   to the pressures of the desired output hybrid levels. Log-linear
   interpolation is used.
   At each latitude, longitude and level (lev[k]) pressures are computed
   using:
             p(k) = A(k)*PO + B(k)*PS            (1)

   This is the form used by the Community Atmosphere Model (CAM) and it is
   the form expected by hyi2hyo. A visualization of the hybrid coordinate
   system is here. Typically, the A and B coefficients might have values
   like:
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
   of p0 input to hyi2hyo should be set to one [1.0].

See Also

   hyi2hyo_Wrap

Examples

   Example 1

   This example interpolates a variable from ECMWF's 60 hybrid level model
   to a different set of hybrid levels (26 here).

   diri = "./"
   filC = "sstclimt42_run01.cam2.h0.0001-01.nc"    ; CAM
   filU = "e4moda.an.ml.t85.u.1985.nc"             ; ECMWF [ds126.2]
   filP = "e4moda.an.ml.t85.psfc.1985.nc"          ; ECMWF [ds126.2]

   f    = addfile (diri+filU, "r")
   hyai = f->hyam                                  ; midlayer coef
   hybi = f->hybm
   ui   = f->U                                     ; variable to be interpolated
   p0   = f->P0                                    ; reference pressure (Pa)
   fP   = addfile (diri+filP, "r")
   psfc = fP->PSFC                                 ; surface pressure (Pa)

   fC   = addfile (diri+filC, "r")
   hyao = fC->hyam                                 ; levels to which the variabl
e
   hybo = fC->hybm                                 ; will be interpolated

   uo   = hyi2hyo(p0,hyai,hybi,psfc,ui,hyao,hybo,0)


   If the input variable looks like:
          variable: ui
          Type: float
          Total Size: 94371840 bytes
                      23592960 values
          Number of Dimensions: 4
          Dimensions and sizes:   [time | 12] x  [lev | 60] x [lat | 128] x [lon
 | 256]
         Coordinates:
                      time: [1621680..1629696]
                      lev: [1e-06..998.8151]
                      lat: [-88.92773..88.92773]
                      lon: [ 0..358.53]
          Number Of Attributes: 4
            long_name :   U velocity
            units :       m/s
            standard_name :       eastward_wind
            cell_method : time: mean


   The output variable will look like:
          Variable: uo
          Type: float
          Total Size: 40894464 bytes
                      10223616 values
          Number of Dimensions: 4
          Dimensions and sizes:   [12] x  [26] x [128] x [256]

   Note that no meta data is preserved by the built-in function. To
   preserve meta data use hyi2hyo_Wrap .


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

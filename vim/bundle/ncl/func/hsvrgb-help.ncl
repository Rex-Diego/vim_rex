THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/hsvrgb.shtml
THE_TITLE:hsvrgb
   NCL Home > Documentation > Functions > Color routines

hsvrgb

   Converts HSV color values to RGB.

   [new.gif] Available in version 5.0.0 and later.

Prototype

        function hsvrgb (
                hsv  : numeric
        )

        return_val  :  numeric

Arguments

   hsv

   An array of values in the Hue, Saturation, Value (HSV) color space.
   This array can be of any shape, but the rightmost dimension must be 3
   for specifying the HSV values. The Hue values must be in the range
   [0.,360.), and the Saturation and Value values in the range [0.,1.]. A
   Hue of 0. corresponds to RGB red (1.,0.,0.).

Return value

   The returned value is an array of the same dimension and dimension
   sizes as the input array. The input HSV values will have been replaced
   with their Red, Green, Blue (RGB) equivalents. If any values in the
   input array are double precision, the returned array will be double
   precision.

Description

   This function determines the RGB equivalents to HSV color values.

   The returned Red, Green, and Blue values will be in the range [0.,1.].

   For sample color wheels illustrating HSV colors see example color_18 on
   the Color Fill page.

   For a complete description of the algorithm see:
    1. Foley, James D. and van Dam, Andries,"Fundamentals of Interactive
       Computer Graphics",Addison-Wesley Publishing Company, 1982.

   Missing values are not honored.

   This routine is essentially the same as hsv2rgb, but with a different
   interface. It is written to be consistent with the other color
   conversion routines.

See Also

   rgbhsv, rgbhls, hlsrgb, yiqrgb, rgbyiq

Examples

   Example 1

   The following:
begin
  rgb = hsvrgb((/0.0, 1.0, 1.0/))
  print(rgb)
end

   produces:

Variable: rgb
Type: float
Total Size: 12 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
(0)      1
(1)      0
(2)      0

   Example 2

   The following:
begin
  hsv = (/                                                 \
          (/(/  0.d, 1.d, 1.d/),  (/120.d, 1.d, 1.d/)/) ,  \
          (/(/240.d, 1.d, 1.d/),  (/ 60.d, 1.d, 1.d/)/) ,  \
          (/(/300.d, 1.d, 1.d/),  (/180.d, 1.d, 1.d/)/)    \
        /)
  rgb = hsvrgb(hsv)
  print(rgb)
end


   produces:

Variable: rgb
Type: double
Total Size: 144 bytes
            18 values
Number of Dimensions: 3
Dimensions and sizes:   [3] x [2] x [3]
Coordinates:
(0,0,0)    1
(0,0,1)    0
(0,0,2)    0
(0,1,0)    0
(0,1,1)    1
(0,1,2)    0
(1,0,0)    0
(1,0,1)    0
(1,0,2)    1
(1,1,0)    1
(1,1,1)    1
(1,1,2)    0
(2,0,0)    1
(2,0,1)    0
(2,0,2)    1
(2,1,0)    0
(2,1,1)    1
(2,1,2)    1

   Example 3

   The NCL code gsn_color.ncl allows you to change HSV values to generate
   color maps.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

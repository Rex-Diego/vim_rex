THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/hlsrgb.shtml
THE_TITLE:hlsrgb
   NCL Home > Documentation > Functions > Color routines

hlsrgb

   Converts HLS color values to RGB.

   [new.gif] Available in version 5.0.0 and later.

Prototype

        function hlsrgb (
                hls  : numeric
        )

        return_val  :  numeric

Arguments

   hls

   An array of values in the Hue, Lishtnesss, Saturation, (HLS) color
   space. This array can be of any shape, but the rightmost dimension must
   be 3 for specifying the HLS values. The Hue values must be in the range
   [0.,360.). A Hue of 0. corresponds to RGB blue (0.,0.,1.).

   The lightness values are in the range [0.,1.]. Lightness is used to
   signify the amount of light; L=0. will result in R=G=B=0. and L=100.
   will result in R=G=B=1. regardless of H and S.

   The saturation values are in the range [0.,1.]. Saturation is a measure
   of the mixture of white light with a pure fully-saturated hue; S=0.
   will result in R=G=B=L/100.

Return value

   The returned value is an array of the same dimension and dimension
   sizes as the input array. The input HLS values will have been replaced
   with their Red, Green, Blue (RGB) equivalents. The output values are in
   the range 0. to 1. inclusive. If any values in the input array are
   double precision, the returned array will be double precision.

Description

   This function determines the RGB equivalents to HLS color values.

   The returned Red, Green, and Blue values will be in the range [0.,1.].

   For a complete description of the algorithm see:
    1. Foley, James D. and van Dam, Andries,"Fundamentals of Interactive
       Computer Graphics",Addison-Wesley Publishing Company, 1982.
    2. Smith, A.R.,"Color Gamut Transformation Pairs",SIGGRAPH '78
       Proceedings, published as Computer Graphics, 12(3),August 1978,
       pp.12-19.

   Missing values are not honored.

See Also

   rgbhls, rgbhsv, hsvrgb, yiqrgb, rgbyiq

Examples

   Example 1

   The following:
begin
  rgb = hlsrgb((/120.0d, 50.0d, 100.0d/))
  print(rgb)
end

   produces:

Variable: rgb
Type: double
Total Size: 24 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
(0)        1
(1)        0
(2)        0

   Example 2

   The following:
begin
  hls = (/ (/(/120, 50, 100/),  (/240, 50, 100/)/) /)
  rgb = hlsrgb(hls)
  print(rgb)
end

produces:


Variable: rgb
Type: float
Total Size: 24 bytes
            6 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [3]
Coordinates:
(0,0)    1
(0,1)    0
(0,2)    0
(1,0)    0
(1,1)    1
(1,2)    0


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

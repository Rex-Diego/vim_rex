THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/rgbhsv.shtml
THE_TITLE:rgbhsv
   NCL Home > Documentation > Functions > Color routines

rgbhsv

   Converts RGB color values to HSV.

   [new.gif] Available in version 5.0.0 and later.

Prototype

        function rgbhsv (
                rgb  : numeric
        )

        return_val  :  numeric

Arguments

   rgb

   An array of Red, Green, Blue (RGB) color values. This array can be of
   any shape, but the rightmost dimension must be 3 for specifying the RGB
   values. The Red, Green, and Blue values are intensities in the range
   [0.,1.].

Return value

   The returned value is an array of the same dimension and dimension
   sizes as the input array. The input RGB values will have been replaced
   with their Hue, Saturation, Value (HSV) equivalents. If any values in
   the input array are double precision, the returned array will be double
   precision.

Description

   This function determines the HSV equivalents to RGB color values.

   The returned Hue values will be in the range [0., 360.). A value of
   (R,0.,0.) in the input RGB space will result in a Hue of 0. in the HSV
   space.

   The returned Saturation values will be in the range [0.,1.]. Saturation
   is a measure of how much white light is mixed with the color.
   Saturation values of 0. represent greys (with a grey value equal to V).
   Saturation values of 1. are fully saturated colors. The hue is
   technically undefined when S=0; the code leaves H at its previous value
   when S=0. (0. initially). The fully saturated pure hues occur when S=1.
   and V=1.

   The returned Value values will be in the range [0.,1.].

   For a complete description of the algorithm see:
    1. Foley, James D. and van Dam, Andries,"Fundamentals of Interactive
       Computer Graphics",Addison-Wesley Publishing Company, 1982.

   Missing values are not honored as such.

See Also

   hsvrgb, hlsrgb, rgbhls, yiqrgb, rgbyiq

Examples

   Example 1

   The following:
begin
  hsv = rgbhsv((/1.0d, 0.0d, 0.0d/))
  print(hsv)
end

   produces:

Variable: hsv
Type: double
Total Size: 24 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
(0)        0
(1)        1
(2)        1

   Example 2

   The following:
begin
  rgb = (/                                             \
           (/(/1.d, 0.d, 0.d/), (/0.d, 1.d, 0.d/)/),   \
           (/(/0.d, 0.d, 1.d/), (/1.d, 1.d, 0.d/)/),   \
           (/(/1.d, 0.d, 1.d/), (/0.d, 1.d, 1.d/)/)    \
        /)
  hsv = rgbhsv(rgb)
  print (hsv)
end


   produces:

Variable: hsv
Type: double
Total Size: 144 bytes
            18 values
Number of Dimensions: 3
Dimensions and sizes:   [3] x [2] x [3]
Coordinates:
(0,0,0)    0
(0,0,1)    1
(0,0,2)    1
(0,1,0)  120
(0,1,1)    1
(0,1,2)    1
(1,0,0)  240
(1,0,1)    1
(1,0,2)    1
(1,1,0)   60
(1,1,1)    1
(1,1,2)    1
(2,0,0)  300
(2,0,1)    1
(2,0,2)    1
(2,1,0)  180
(2,1,1)    1
(2,1,2)    1


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

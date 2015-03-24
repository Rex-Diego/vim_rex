THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/rgbhls.shtml
THE_TITLE:rgbhls
   NCL Home > Documentation > Functions > Color routines

rgbhls

   Converts RGB color values to HLS.

   [new.gif] Available in version 5.0.0 and later.

Prototype

        function rgbhls (
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
   with their Hue, Lightness, Saturation (HLS) equivalents. If any values
   in the input array are double precision, the returned array will be
   double precision.

Description

   This function determines the HLS equivalents to RGB color values.

   The returned Hue values will be in the range [0., 360.). A value of
   (R,0.,0.) in the input RGB space will result in a hue of 120. in the
   HLS space.

   The returned lightness values will be in the range [0.,100.]. Lightness
   is a measure of the quantity of light - a lightness of 0. is black, and
   a lightness of 100. gives white. The pure hues occur at lightness value
   50. The lightness should be thought of as a percentage.

   The returned Saturation values will be in the range [0.,100.].
   Saturation is a measure of how much white light is mixed with the
   color. Saturation values of 0. represent greys (with a grey value equal
   to V). Saturation values of 100. are fully saturated colors. The hue is
   technically undefined when S=0; the code leaves H at its previous value
   when S=0. (0. initially). The fully saturated pure hues occur when
   S=100. and L=50.

   For a complete description of the algorithm see:
    1. Foley, James D. and van Dam, Andries,"Fundamentals of Interactive
       Computer Graphics",Addison-Wesley Publishing Company, 1982.
    2. Smith, A.R.,"Color Gamut Transformation Pairs",SIGGRAPH '78
       Proceedings, published as Computer Graphics, 12(3),August 1978,
       pp.12-19.

   Missing values are not honored.

See Also

   hlsrgb, rgbhsv, hsvrgb, yiqrgb, rgbyiq

Examples

   Example 1

   The following:
begin
  hsv = rgbhls((/1.0d, 0.0d, 0.0d/))
  print(hsv)
end

   produces:

Variable: hls
Type: double
Total Size: 24 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
(0)      120
(1)       50
(2)      100


   Example 2

   The following:
begin
  rgb = (/                                       \
           (/(/1., 0., 0./), (/0., 1., 0./)/),   \
           (/(/0., 0., 1./), (/1., 1., 0./)/),   \
           (/(/1., 0., 1./), (/0., 1., 1./)/)    \
        /)
  hls = rgbhls(rgb)
  print (hls)
end


   produces:

Variable: hls
Type: float
Total Size: 72 bytes
            18 values
Number of Dimensions: 3
Dimensions and sizes:   [3] x [2] x [3]
Coordinates:
(0,0,0) 120
(0,0,1) 50
(0,0,2) 100
(0,1,0) 240
(0,1,1) 50
(0,1,2) 100
(1,0,0)  0
(1,0,1) 50
(1,0,2) 100
(1,1,0) 180
(1,1,1) 50
(1,1,2) 100
(2,0,0) 60
(2,0,1) 50
(2,0,2) 100
(2,1,0) 300
(2,1,1) 50
(2,1,2) 100



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

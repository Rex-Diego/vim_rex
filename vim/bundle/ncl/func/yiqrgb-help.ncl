THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/yiqrgb.shtml
THE_TITLE:yiqrgb
   NCL Home > Documentation > Functions > Color routines

yiqrgb

   Converts YIQ color values to RGB.

   [new.gif] Available in version 5.0.0 and later.

Prototype

        function yiqrgb (
                yiq  : numeric
        )

        return_val  :  numeric

Arguments

   yiq

   An array of values in the Y (luma), I (in-phase), Q (quadrature) color
   space. This array can be of any shape, but the rightmost dimension must
   be 3 for specifying the YIQ values.

Return value

   The returned value is an array of the same dimension and dimension
   sizes as the input array. The input YIQ values will have been replaced
   with their Red, Green, Blue (RGB) equivalents. If any values in the
   input array are double precision, the returned array will be double
   precision.

Description

   This function determines the RGB equivalents to YIQ color values.

   The YIQ color model is used in U.S. commercial analog television and is
   a recoding of RGB for transmission efficeincy.

   The Y component (luma) is the only component used by black and white
   TVs. Y minimizes the effect of two colors appearing different to the
   human eye but mapping to similar monochrome intensities. Y values range
   between 0. and 1. inclusive.

   The I (in-phase) component is in the range [-0.6, 0.6]. It attains its
   maximum when the input RGB triple is (1.,0.,0.); it attains its minimum
   when the input RGB triple is (0.,1.,1.) .

   The Q (quadrature) component is in the range [-0.53, 0.53]. Q attains
   its maximum when the input RGB triple is (1.,0.,1.) and it attains its
   minimum when the input triple is (0.,1.,0.).

   The returned Red, Green, and Blue values will be in the range [0.,1.].

   For a complete description of the algorithm see:
    1. Foley, James D. and van Dam, Andries,"Fundamentals of Interactive
       Computer Graphics",Addison-Wesley Publishing Company, 1982.

   Missing values are not honored.

See Also

   rgbyiq, rgbhsv, hsvrgb, rgbhls, hlsrgb

Examples

   Example 1

   The following:
begin
  rgb = yiqrgb((/ 0.2988923,  0.5960701,  0.2113775 /))
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
  yiq = (/ (/ 0.2988923,  0.5960701,  0.2113775 /),    \
           (/ 0.5870147, -0.2743084, -0.5229885 /)  /)
  rgb = yiqrgb(yiq)
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

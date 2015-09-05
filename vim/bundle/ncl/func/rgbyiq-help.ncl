THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/rgbyiq.shtml
THE_TITLE:rgbyiq
   NCL Home > Documentation > Functions > Color routines

rgbyiq

   Converts RGB color values to YIQ values.

   [new.gif] Available in version 5.0.0 and later.

Prototype

        function rgbyiq (
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
   with their YIQ equivalents. If any values in the input array are double
   precision, the returned array will be double precision.

Description

   This function determines the YIQ equivalents to RGB color values. The
   YIQ color model is used in U.S. commercial analog television and is a
   recoding of RGB for transmission efficeincy.

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

   For a complete description of the algorithm see:
    1. Foley, James D. and van Dam, Andries,"Fundamentals of Interactive
       Computer Graphics",Addison-Wesley Publishing Company, 1982.

   Missing values are not honored.

See Also

   yiqrgb, hsvrgb, rgbhsv, hlsrgb, rgbhls

Examples

   Example 1

   The following:
begin
  yiq = rgbyiq((/1.0, 0.0, 1.0/))
  print (yiq)
end

   produces:

Variable: yiq
Type: float
Total Size: 12 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
(0)     0.4129853
(1)     0.2743087
(2)     0.5229881

   Example 2

   The following:
begin
  rgb = (/ (/1.d, 0.d, 1.d/), (/0.d, 1.d, 0.d/) /)
  yiq = rgbyiq(rgb)
  print (yiq)
end

   produces:

Variable: yiq
Type: double
Total Size: 48 bytes
            6 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [3]
Coordinates:
(0,0)   0.4129853
(0,1)   0.2743087
(0,2)   0.5229881
(1,0)   0.5870147
(1,1)  -0.2743087
(1,2)  -0.5229881


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

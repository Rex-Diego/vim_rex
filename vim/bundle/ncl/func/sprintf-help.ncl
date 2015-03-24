THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sprintf.shtml
THE_TITLE:sprintf
   NCL Home > Documentation > Functions > String manipulation

sprintf

   Converts floats or doubles into formatted strings.

Prototype

        function sprintf (
                format [1] : string,
                array      : float    ; or double
        )

        return_val [dimsizes(array)] :  string

Arguments

   format

   A "C" style format string, See "man sprintf" for more information.
   array

   An array of any dimensionality of float or double values.

Description

   This function uses the format string to call the system "sprintf"
   function. This is different from the C version in two ways: 1) only one
   "%" operator is allowed for the string, and 2) only floating point
   numbers (float and double) are allowed. You must understand how to
   create a C format string to use this function.

   Briefly, the applicable conversion characters for printing are:
    1. Each conversion specification begins with a % and ends with a
       conversion character: f, e/E, g/G.
    2. Between the % and the conversion character, there may be, in order:
          + A minus sign, which specifies left adjustment of the converted
            argument.
          + A number that specifies the minimum field width. The converted
            argument will be printed in a field at least this wide. It
            will be padded if necessary.
          + A period, which separates the field width from the precision.
          + A number, the precision, that specifies the maximum number of
            characters to be printed from a string, or the number of
            digits after the decimal point of a floating point value.
    3. Conversion characters are:

     f: [-]m.dddddd, where the number of d's is given by the precision
     (default 6).

     e[,E]: [-]m.dddddde±xx or [-]m.ddddddE±xx, where the number of d's
     is given by the precision (default 6).
     g[,G]: use %e or %E if the exponent is less than -4 or greater than
     or equal to the precision; otherwise use %f.

See Also

   sprinti, write_matrix

Examples

   Example 1

   The code snippet:
  x = 12.3456
  title = "Sample title,  x=" + sprintf("%5.2f", x)

   will result in title = "Sample title, x=12.35". Note that the value
   returned by sprintf is rounded, due to the specified print format.

   Example 2

   Here are some additional examples demonstrating the "e[,E]" and "g[,G]"
   formats:

  x = 12.3456
  print( sprintf("%7.3e", x) )   ===>    1.235e+01

  x = -0.000013583
  print( sprintf("%4.3E", x) )   ===>    -1.358E-05

  x = 23456789.
  print( sprintf("%6.4g", x) )   ===>    2.3457e+07

  print( sprintf("%6.4G", 10000000.) )   ===>    1E+07

  print( sprintf("%6.4g", 10.) )   ===>    10

  print( sprintf("%6.4g", 10.56) )   ===>    10.56

   Example 3

   A user could also put the format into a string variable:
  fmt = "%5.2f"
  emt = "%7.3e"
  gmt = "%4.3g"
  title = "Sample title,  x=" + sprintf(fmt, x) +" y="+ sprintf(fmt, y) \
                       +" z=" + sprintf(gmt, z)
  subTitle = sprintf(gmt, x)

   Example 4

   sprinti and sprintf can be used to provide limited formatting for
   printing ASCII text. The following code:
  print("      K     mylats      mylons     exacts    mytemps       fo")
  do n=0,N-1
    print (sprinti("%6.0i", knt(n))    +" " \
          +sprintf("%9.5f", mylats(n)) +"  " \
          +sprintf("%9.2f", mylons(n)) +"  " \
          +sprintf("%9.3f", exacts(n)) +"  " \
          +sprintf("%9.4f", mytemps(n))+"  " \
          +sprintf("%9.4f", fo(n))    )
  end do

   will produce the following output:
(0)          K    mylats     mylons     exacts    mytemps       fo
(0)             16.28100    -126.14     20.650    20.6500    20.6500
(0)          5  16.28110    -126.14     20.650    20.6500  -999.0000
(0)         25  16.36279    -125.77     20.550    20.5500    20.5500
(0)         50  16.36289    -125.77     20.550    20.4501    20.4501
(0)         75  16.71504    -125.86     20.350    20.3500    20.3500
(0)        100  16.71514    -125.86     20.350    20.3501    20.3502
(0)        300  16.63296    -126.22     20.650    20.6500    20.6500
(0)        400  16.63305    -126.22     20.650    20.6500  -999.0000
(0)        700  40.57919     -74.57      2.350     2.3500     2.3500
(0)        900  40.57929     -74.57      2.350     3.4908     3.4891
(0)       1000  40.52584     -74.11      4.750     4.7500     4.7500
(0)       3000  40.52594     -74.11      4.750     4.5151     4.5153
(0)       7000  40.87282     -74.04      1.350     1.3500     1.3500
(0)      10000  40.87292     -74.04      1.350     2.2145     2.2143
(0)      15000  40.92625     -74.50      0.850     0.8500     0.8500
(0)     123456  40.92635     -74.50      0.850     1.4571     1.4570


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

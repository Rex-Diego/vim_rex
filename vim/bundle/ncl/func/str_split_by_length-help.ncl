THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_split_by_length.shtml
THE_TITLE:str_split_by_length
   NCL Home > Documentation > Functions > String manipulation

str_split_by_length

   Splits a string or strings into an array of strings given a length, or
   an array of lengths.

   [new.gif] Available in version 6.0.0 and later.

Prototype

        function str_split_by_length (
                string_val [*] : string,
                length_val [*] : integer
        )

        return_val [*] :  string

Arguments

   string_val

   The input string(s) to split.
   length_val

   The length(s) of which to split the string(s) into.

Return value

   An array of strings.

Description

   This function splits string(s) based on a length or a length array. If
   the sum of the length array is larger than the length of the input
   string, then missing values are is assigned to the sub-strings beyond
   the input string length.

See Also

   str_split, str_split_csv

Examples

   Example 1

   Split string(s) by length, or by array of length

 digit_strings = (/"012345678901234567890123456789", "01234567898765432100123456
789876543210"/)
 alpha_strings = (/"abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"/)
 dtime_strings = (/"20010203040506", "200203040506", "20030405", "200405060708",
 "20050607080910"/)

 tst_digit = str_split_by_length(digit_strings, 1)
 tst_alpha = str_split_by_length(alpha_strings, 2)

 dtime_map = (/4,2,2,2,2,2/)
 tst_dtime = str_split_by_length(dtime_strings, dtime_map)

 print(tst_digit)
 print(tst_alpha)
 print(tst_dtime)

 print("dtime_year  : " + tst_dtime(:,0))
 print("dtime_month : " + tst_dtime(:,1))
 print("dtime_day   : " + tst_dtime(:,2))
 print("dtime_hour  : " + tst_dtime(:,3))
 print("dtime_minute: " + tst_dtime(:,4))
 print("dtime_second: " + tst_dtime(:,5))

   Output will be:

Variable: tst_digit
Type: string
Total Size: 304 bytes
            76 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [38]
Coordinates:
(0,0)   0
(0,1)   1
(0,2)   2
(0,3)   3
(0,4)   4
(0,5)   5
(0,6)   6
(0,7)   7
(0,8)   8
(0,9)   9
(0,10)  0
(0,11)  1
(0,12)  2
(0,13)  3
(0,14)  4
(0,15)  5
(0,16)  6
(0,17)  7
(0,18)  8
(0,19)  9
(0,20)  0
(0,21)  1
(0,22)  2
(0,23)  3
(0,24)  4
(0,25)  5
(0,26)  6
(0,27)  7
(0,28)  8
(0,29)  9
(0,30)  missing
(0,31)  missing
(0,32)  missing
(0,33)  missing
(0,34)  missing
(0,35)  missing
(0,36)  missing
(0,37)  missing
(1,0)   0
(1,1)   1
(1,2)   2
(1,3)   3
(1,4)   4
(1,5)   5
(1,6)   6
(1,7)   7
(1,8)   8
(1,9)   9
(1,10)  8
(1,11)  7
(1,12)  6
(1,13)  5
(1,14)  4
(1,15)  3
(1,16)  2
(1,17)  1
(1,18)  0
(1,19)  0
(1,20)  1
(1,21)  2
(1,22)  3
(1,23)  4
(1,24)  5
(1,25)  6
(1,26)  7
(1,27)  8
(1,28)  9
(1,29)  8
(1,30)  7
(1,31)  6
(1,32)  5
(1,33)  4
(1,34)  3
(1,35)  2
(1,36)  1
(1,37)  0


Variable: tst_alpha
Type: string
Total Size: 104 bytes
            26 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [13]
Coordinates:
(0,0)   ab
(0,1)   cd
(0,2)   ef
(0,3)   gh
(0,4)   ij
(0,5)   kl
(0,6)   mn
(0,7)   op
(0,8)   qr
(0,9)   st
(0,10)  uv
(0,11)  wx
(0,12)  yz
(1,0)   AB
(1,1)   CD
(1,2)   EF
(1,3)   GH
(1,4)   IJ
(1,5)   KL
(1,6)   MN
(1,7)   OP
(1,8)   QR
(1,9)   ST
(1,10)  UV
(1,11)  WX
(1,12)  YZ


Variable: tst_dtime
Type: string
Total Size: 120 bytes
            30 values
Number of Dimensions: 2
Dimensions and sizes:   [5] x [6]
Coordinates:
(0,0)   2001
(0,1)   02
(0,2)   03
(0,3)   04
(0,4)   05
(0,5)   06
(1,0)   2002
(1,1)   03
(1,2)   04
(1,3)   05
(1,4)   06
(1,5)   missing
(2,0)   2003
(2,1)   04
(2,2)   05
(2,3)   missing
(2,4)   missing
(2,5)   missing
(3,0)   2004
(3,1)   05
(3,2)   06
(3,3)   07
(3,4)   08
(3,5)   missing
(4,0)   2005
(4,1)   06
(4,2)   07
(4,3)   08
(4,4)   09
(4,5)   10
(0)     dtime_year  : 2001
(1)     dtime_year  : 2002
(2)     dtime_year  : 2003
(3)     dtime_year  : 2004
(4)     dtime_year  : 2005
(0)     dtime_month : 02
(1)     dtime_month : 03
(2)     dtime_month : 04
(3)     dtime_month : 05
(4)     dtime_month : 06
(0)     dtime_day   : 03
(1)     dtime_day   : 04
(2)     dtime_day   : 05
(3)     dtime_day   : 06
(4)     dtime_day   : 07
(0)     dtime_hour  : 04
(1)     dtime_hour  : 05
(2)     dtime_hour  : missing
(3)     dtime_hour  : 07
(4)     dtime_hour  : 08
(0)     dtime_minute: 05
(1)     dtime_minute: 06
(2)     dtime_minute: missing
(3)     dtime_minute: 08
(4)     dtime_minute: 09
(0)     dtime_second: 06
(1)     dtime_second: missing
(2)     dtime_second: missing
(3)     dtime_second: missing
(4)     dtime_second: 10


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

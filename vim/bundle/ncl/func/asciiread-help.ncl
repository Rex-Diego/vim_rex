THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/asciiread.shtml
THE_TITLE:asciiread
   NCL Home > Documentation > Functions > File IO

asciiread

   Reads a file that contains ASCII representations of basic data types.

Prototype

        function asciiread (
                filepath   [1] : string,
                dimensions [*] : integer or long,
                datatype   [1] : string
        )

        return_val [user_specified] :  datatype

Arguments

   filepath

   Full or relative path needed to locate ASCII file.
   dimensions

   A scalar or one dimensional array specifying the dimension sizes of the
   data to be read.

   As of version 6.0.0, dimensions can be of type int or long.
   datatype

   A string representing the type of the data being read.

Description

   The asciiread function is reads ascii data. If datatype is a numeric
   type, then non-numeric characters are ignored and the numbers are read
   in the order they appear in the input file. However, note that for the
   float and double types, the string 'nan' (any case) is read as a valid
   numerical value. For all the integer types, the prefix '0x' or '0X'
   signifies a value represented in hexadecimal (base 16). For the 'byte'
   type only, the prefix '0', not followed by 'x' or 'X', signifies a
   value represented in octal (base 8).

   All numeric types require require a separator. A separator is a
   non-numeric character [eg, space, comma, alphabetic character].

   For string data, each line of the file is read as a string.

   For character data, the file is read byte-by-byte.

   An error message is generated whenever the number of elements read is
   less than the number implied by the dimensions parameter.

   If -1 is given for the dimensions parameter, all values in the file
   will be read into a one dimensional variable. The dimension size of
   this variable will be equal to the number of elements in the file.

   In version 6.0.0, we fixed a notable quirk in this function: if
   dimensions was set to explicit dimension sizes, then a _FillValue
   attribute was returned, equal to the default fill value for that type.
   If dimensions was equal to -1, then a _FillValue attribute was NOT
   returned.

   Several functions located in contributed.ncl provide additional
   flexibility for reading ascii files.

See Also

   readAsciiTable, readAsciiHead, asciiwrite, write_table, sprinti,
   sprintf, print_table

Examples

   Example 1

   Assume you have an ASCII data file called "data.asc":
 1.  2.  3.
 4.  5.  6.
 7.  8.  9.
10. 11. 12.
13. 14. 15.

   You can read it various ways as shown with the following NCL script:
begin
  z1 = asciiread("data.asc",(/5,3/),"float")
  z2 = asciiread("data.asc",(/4,2/),"float")
end

   The results of z1 and z2 would be:
z1(0,0) = 1.
z1(0,1) = 2.
z1(0,2) = 3.
z1(1,0) = 4.
z1(1,1) = 5.
z1(1,2) = 6.
z1(2,0) = 7.
.
.
.
z1(4,0) = 13.
z1(4,1) = 14.


z2(0,0) = 1.
z2(0,1) = 2.
z2(1,0) = 3.
z2(1,1) = 4.
z2(2,0) = 5.
z2(2,1) = 6.
z2(3,0) = 7.
z2(3,1) = 8.

   Example of using -1:
begin
        z3 = asciiread("data.asc",-1,"float")
end

z3(0) = 1.
z3(1) = 2.
z3(2) = 3.
.
.
.
z3(14)= 15.

   The above z3 could be reshaped via use of onedtond:
     Z3 = onedtond(z3, (/5,3/) )

   Example 2

   Consider an ASCII file ("sample.file") that consists of three "header"
   lines followed by the data array of interest. This file is best read
   using the readAsciiTable function. However, this example is offered to
   illustrate how one can read the file directly via the asciiread and
   ndtooned functions.

   "sample.file":

This header line contains no numbers
but this 2nd line has 3 numbers: 10, 30, 50. and a blank line.

   4.35   4.39   0.27  -3.35  -6.90
   4.36   4.66   3.77  -1.66   4.06
   9.73  -5.84   0.89   8.46  10.39
   4.91   4.59  -3.09   7.55   4.56
   1.77   3.68   5.08   0.14  -5.63
  -0.63 -14.12  -2.51   1.76  -1.43
  -4.29   0.07   5.85   0.87   8.65

   To read the data array:

    x1 = asciiread("sample.file" , -1, "float")
    print (x1)

   Output from print statement:
        Variable: x1
        Type: float
        Total Size: 160 bytes
                     40 values
        Number of Dimensions: 1
        Dimensions and sizes:   [40]
        Coordinates:
        (0)      2
        (1)      3
        (2)     10
        (3)     30
        (4)     50
        (5)     4.35                      <== starting value
        (6)     4.39
        (7)     0.27
        (8)     -3.35
        (9)     -6.9
        [snip]

   Now grab only the values from x1 that are not part of the header, and
   store them in x2:

    x2 = onedtond(x1(5:), (/7,5/))  ; MUST know starting index
    print (x2)

   Output from print statement:
        Variable: x2
        Type: float
        Total Size: 140 bytes
                     35 values
        Number of Dimensions: 2
        Dimensions and sizes:   [7] x [5]
        Coordinates:
        (0,0)   4.35
        (0,1)   4.39
        (0,2)   0.27
        [snip]

   Example 3

   Consider an ASCII file ("numberByte_ascii.file") that consists of three
   rows. Each row has 30 numbers. Unseen at the end of each line is an
   end-of-line character. Each number is to be interpreted as a numeric
   type "byte".

   The file can not be directly read as numeric bytes because all numeric
   types require a non-numeric separator. Also, the 'hidden' end-of-line
   character complicates the situation. Use of charactertoshort and
   stringtocharacter can be used to get the desired type "short" or
   "byte".

   "numericByte_ascii.file":

012345678901234567890123456789
012345678901234567890123456789
012345678901234567890123456789

   The following code snippet will result in each numeric value being
   separated. The "ncol+1" is to account for the hidden end-of-line
   character. The "zero_offset" variable is used to 'normalize' the
   integer character representation to numeric ibtegers.
   nrow = 3
   ncol = 30
   zero_offset = charactertoshort(stringtocharacter("0"))      ; (/48,0/)

   xc   = asciiread("numericByte_ascii.file", (/nrow,ncol+1/), "character")
   xs   = charactertoshort(xc(:,:ncol-1)) - zero_offset(0)
   delete(xs@_FillValue)
   print(xs)

   xb   = shorttobyte( xs )
   print(xb)

   The output looks like:
Variable: xs
Type: short
Total Size: 180 bytes
            90 values
Number of Dimensions: 2
Dimensions and sizes:   [3] x [30]
Coordinates:
Number Of Attributes: 1
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
(0,24)  4
(0,25)  5
(0,26)  6
(0,27)  7
(0,28)  8
(0,29)  9
(1,0)   0
(1,1)   1
(1,2)   2
(1,3)   3

[snip]

(2,23)  3
(2,24)  4
(2,25)  5
(2,26)  6
(2,27)  7
(2,28)  8
(2,29)  9

   Printing as byte is done as hexadecimal. The numbers are the same.
Variable: xb
Type: byte
Total Size: 90 bytes
            90 values
Number of Dimensions: 2
Dimensions and sizes:   [3] x [30]
Coordinates:
(0,0)   0x00
(0,1)   0x01
[snip]
(2,24)  0x04
(2,25)  0x05
(2,26)  0x06
(2,27)  0x07
(2,28)  0x08
(2,29)  0x09


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

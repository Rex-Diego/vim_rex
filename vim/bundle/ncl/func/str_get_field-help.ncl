THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_get_field.shtml
THE_TITLE:str_get_field
   NCL Home > Documentation > Functions > String manipulation

str_get_field

   Returns an array of substrings given a field number and a combination
   of delimiters.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_get_field (
                string_val       : string,
                field_number [1] : integer,
                delimiter    [1] : string
        )

        return_val [dimsizes(string_val)] :  string

Arguments

   string_val

   A string array of any dimensionality.
   field_number

   An integer indicating which field to return; starts from 1.
   delimiter

   A string containing the delimiters that separate each field, such as
   TABs, spaces, colons, semicolons, commas, etc. It can be a combination
   of delimiters.

Description

   This function returns array of substrings given a field number and a
   delimiter or combination of delimiters. The first field starts at 1.
   The C-based function strtok is used to get the number of fields in a
   string.

   If one or more delimiters appear side-by-side in a string, then they
   are treated as if they were just one delimiter. See the examples below
   for a way to handle consecutive delimiters.

   TABs and spaces are recognized as valid delimiters. If your fields are
   separated by a combination of TABs and spaces, then use a delimiter
   string with a tab and a space to correctly delimit the fields.

   Empty strings will be returned if delimiter is empty and field_number
   is not 1, or if field_number is zero, negative, or out-of-range.

   Missing strings will be returned if delimiter or string_val is missing.

See Also

   str_fields_count, str_get_cols, stringtoint, stringtofloat,
   stringtodouble

Examples

   For the next few examples, assume you have an ASCII file "asc3.txt"
   with the following lines:
20030613   0.38   25.28 1088 233.95   6  92  9.99 999.0  -9.99 167.9 1782  BOS_1
  ATL 3
20030613   0.38   25.28 1088 233.95   6  92  9.99 999.0  -9.99 167.9 1782  ORD_2
  ATL 3
20030612 -45.10  168.70  914 279.35   4 272  9.99   1.1   0.01 -99.9 4552  DTW_3
  MSP 3
20030612 -45.10  168.70  914 279.35   4 272  9.99   1.1   0.01 -99.9 4552  SDF_4
  MHR 3

   Example 1 Using a space (" ") as a delimiter, count the number of
   fields, and then select the first field:
 flnm = "asc3.txt"
 strs = asciiread(flnm,-1,"string")

 delim = " "
 nfields = str_fields_count(strs(0), delim)
 print(nfields)   ; nfields = 15

 tfs = str_fields_count(strs, delim)
 print(tfs)       ; all tfs = 15

 field1 = str_get_field(strs, 1, delim)
 print(field1)

   The contents of field1 are:
    20030613
    20030613
    20030612
    20030612

   Example 2

   Read field #13:
 field13 = str_get_field(strs, 13, delim)
 print(field13)

   The contents of field13 are:
    BOS_1
    ORD_2
    DTW_3
    SDF_4

   Example 3

   Read field #9 and convert to a floating point array with 999.0 being a
   missing value:
  field9 = stringtofloat(str_get_field(strs, 9, delim))
  field9@_FillValue = 999.0
  print(field9)
  print("number of missing values = " + num(ismissing(field9)))  ; = 2

   Output:
(0)     999
(1)     999
(2)     1.1
(3)     1.1
(0)     number of missing values = 2

   Example 4

   If you want to treat the following column in "asc3.txt" as two fields:
BOS_1
ORD_2
DTW_3
SDF_4

   then you can use a combination of " " and "_" as your delimiters:
 flnm = "asc3.txt"
 strs = asciiread(flnm,-1,"string")

 delim = " _"     ; space underscore
 nfields = str_fields_count(strs(0), delim)
 print(nfields)       ; = 16

 field13 = str_get_field(strs, 13, delim)
 field14 = stringtoint(str_get_field(strs, 14, delim))

   Output:
 print(field13)
. . .
(0)     BOS
(1)     ORD
(2)     DTW
(3)     SDF


 print(field14)
. . .
(0)     1
(1)     2
(2)     3
(3)     4


   Example 5

   Assume you have an ASCII file "stuff.txt" that contains consecutive
   delimiters:
ID,LAT,LON,ELEV,FLAGS
4,-27.75,152.45,,0
5,-27.03,152.02,,0
6,-26.76,148.82,,1
7,-26.58,148.77,,0
8,-26.48,148.68,1000,0
9,-26.30,148.52,900,0
10,-26.25,148.41,,0

   If you read this file with str_get_field, the fields that are empty
   will be skipped over, and you will get unexpected results. For example:
  data  = asciiread("stuff.txt",-1,"string")
  count = str_fields_count(data,",")
  print(count)

  field4 = stringtoint(str_get_field(data(1:),4,","))
  print(field4)

   produces count equal to (/5,4,4,4,5,5,4/) and field4 equal to
   (/0,0,1,0,1000,900,0/), which is probably not what you want.

   To make sure that the empty fields between the consecutive delimiters
   get treated as real values, use str_sub_str to insert a number between
   these delimiters. We use the default _FillValue for "data" here:

  data = asciiread("stuff.txt",-1,"string")
  data = str_sub_str(data,",,",",data@_FillValue,")

  count = str_fields_count(data,",")
  print(count)

  field4 = stringtoint(str_get_field(data(1:),4,","))
  print(field4)

   Now you get a count of all 5s, and a field4 of all missing values
   except for elements 4 and 5 which are equal to 1000 and 900.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

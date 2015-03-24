THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/yyyymm_time.shtml
THE_TITLE:yyyymm_time
   NCL Home > Documentation > Functions > Date routines

yyyymm_time

   Creates a one-dimensional array containing year-month [yyyymm] values.

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function yyyymm_time (
                yrStrt [1] : integer,
                yrLast [1] : integer,
                TYPE       : string
        )

Arguments

   yrStrt

   An integer specifying the initial year.
   yrLast

   An integer specifying the last year.
   TYPE

   A string specifyin the numeric type to be returned ["integer", "float",
   "double"].

Return value

   A one dimensional array containing values of the form yyyymm. The first
   value will correspond to January of yrStrt. The last value will
   correspond to December of yrLast. In addition, the attributes
   "long_name" and "units" will be set, and the return value will have a
   named dimension "time".

Description

   For each month of each year, the value yyyymm = (yyyy*100 + mm) is
   returned. The 'mm' start at 1 [January] and end at 12 [December].

See Also

   List of "date" and "calendar" functions

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Create a one dimensional [1D] array of type intger spanning 1850
   through 2001.
      yyyymm = yyyymm_time(1850, 2001, "integer")
      print(yyyymm)

   The above returns a 1D array of length 1824 values.
Variable: yyyymm
Type: integer
Total Size: 7296 bytes
            1824 values
Number of Dimensions: 1
Dimensions and sizes:   [time | 1824]
Coordinates:
            time: [185001..200112]
Number Of Attributes: 4
  long_name :   time
  units :       yyyymm
(0)     185001
(1)     185002
(2)     185003
[snip]
(1821)  200110
(1822)  200111
(1823)  200112

   Example 2

   Create a yyyymm variable named "time" that spans April 1901 to
   September 2001. Make the yrStrt and yrLast span the required years.
   Then use NCL's Coordinate subscripting to subset the returned 1D array.
      TIME = yyyymm_time(1901, 2001, "integer")
      time = TIME({190104:200109})    ; coordinate subscripting
      print(time)

   The above returns a 1D array of length 1194 values.
Variable: time
Type: integer
Total Size: 4776 bytes
            1194 values
Number of Dimensions: 1
Dimensions and sizes:   [time | 1194]
Coordinates:
            time: [190104..200009]
Number Of Attributes: 4
  units :       yyyymm
  long_name :   time
(0)     190104
(1)     190105
(2)     190106
(3)     190107
[SNIP]
(1184)  199912
(1185)  200001
(1186)  200002
(1187)  200003
(1188)  200004
(1189)  200005
(1190)  200006
(1191)  200007
(1192)  200008
(1193)  200009


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

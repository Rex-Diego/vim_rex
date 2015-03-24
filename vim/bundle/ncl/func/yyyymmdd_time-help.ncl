THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/yyyymmdd_time.shtml
THE_TITLE:yyyymmdd_time
   NCL Home > Documentation > Functions > Date routines

yyyymmdd_time

   Creates a one-dimensional array containing year-month-day [yyyymmdd]
   values.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function yyyymmdd_time (
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

   A one dimensional array containing values of the form yyyymmdd. The
   first value will correspond to January 1 of yrStrt. The last value will
   correspond to December 31 of yrLast. In addition, the attributes
   "long_name" and "units" will be set, and the return value will have a
   named dimension "time".

Description

   For each year-month-day of each year, the value yyyymmdd = (yyyy*10000
   + mm*100 + dd) is returned. The 'mm' start at 1 [January] and end at 12
   [December]. Leap years will have a 29 February.

See Also

   List of "date" and "calendar" functions

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Create a one dimensional [1D] array of type intger spanning 1850
   through 2001.
      yyyymmdd = yyyymmdd_time(1850, 2001, "integer")
      print(yyyymmdd)

   The above returns a 1D array of length 57708 values.
Variable: yyyymmdd
Type: integer
Total Size: 230832 bytes
            57708 values
Number of Dimensions: 1
Dimensions and sizes:   [time | 57708]
Coordinates:
            time: [18500101..20071231]
Number Of Attributes: 2
  long_name :   time
  units :       YYYYMMDD
(0)     18500101
(1)     18500102
(2)     18500103
[snip]
(787)   18520227
(788)   18520228
(789)   18520229                   < note leap year
(790)   18520301
(791)   18520302
[snip]
(57705) 20071229
(57706) 20071230
(57707) 20071231

   Example 2

   Create a yyyymmdd variable named "time" that spans April 15 1901 thru
   September 21 2001. Make the yrStrt and yrLast span the required years.
   Then use NCL's Coordinate subscripting to subset the returned 1D array.
      TIME = yyyymmdd_time(1901, 2001, "integer")
      time = TIME({19010415:20010921})    ; coordinate subscripting
      print(time)

   The above returns a 1D array of length 36685 values.
Variable: time
Type: integer
Total Size: 146740 bytes
            36685 values
Number of Dimensions: 1
Dimensions and sizes:   [time | 36685]
Coordinates:
            time: [19010415..20010921]
Number Of Attributes: 2
  units :       YYYYMMDD
  long_name :   time
(0)     19010415
(1)     19010416
(2)     19010417
[snip]
(36682) 20010919
(36683) 20010920
(36684) 20010921


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

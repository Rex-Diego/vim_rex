THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cd_calendar.shtml
THE_TITLE:cd_calendar
   NCL Home > Documentation > Functions > Date routines

cd_calendar

   Converts a mixed Julian/Gregorian date to a UT-referenced date.

   [new.gif] Available in version 6.0.0 and later.

Prototype

        function cd_calendar (
                time       : numeric,
                option [1] : integer
        )

Arguments

   time

   A multi-dimensional array of time values that can be in a variety of
   calendaring systems (see below).

   Must have a "units" attribute string in the format "units since
   basetime", for example, "days since 1971-1-1" (see examples below).

   May additionally have a "calendar" attribute with one of the following
   values:
     * "standard" (the default)
     * "gregorian"
     * "proleptic_gregorian"
     * "julian"
     * "360_day", "360"
     * "365_day", "365"
     * "366_day", "366"
     * "noleap", "no_leap"
     * "allleap", "all_leap"
     * "none" (Added in V6.1.0)

   option

   A scalar integer indicating the format of the output. See description
   below.

Return value

   The format of the output is dependent upon the value of option. In all
   cases the first dimension is the same size as time.
     * option = 0
       The array returned will be of type float and dimensioned
       dimsizes(time) x 6:

     utc_date(:,0) --> years
     utc_date(:,1) --> months
     utc_date(:,2) --> days
     utc_date(:,3) --> hours
     utc_date(:,4) --> minutes
     utc_date(:,5) --> seconds
     * option = -1 or 1
       The values returned will be in the format YYYYMM and will be type
       double for option = 1, and type integer for option = -1.
       Note that for option = 1, even though the return value is double,
       the value will be the same as if an integer had been returned (no
       fraction is returned, so days, hours, minutes, and seconds are
       basically truncated).
     * option = -2 or 2
       The values returned will be in the format YYYYMMDD and will be type
       double for option = 2, and type integer for option = -2.
       Note that for option = 2, even though the return value is double,
       the value will be the same as if an integer had been returned (no
       fraction is returned, so hours, minutes, and seconds are basically
       truncated).
     * option = -3 or 3
       The values returned will be in the format YYYYMMDDHH and will be
       type double for option = 3, and type integer for option = -3. Note
       that this option can produce some big numbers. If your year values
       go higher than 2147, then then you should use option 3.
       Note that for option = 3, even though the return value is double,
       the value will be the same as if an integer had been returned (no
       fraction is returned, so minutes, and seconds are basically
       truncated).
     * option = 4
       The values returned will be in the format YYYY.fraction_of_year and
       will be type double. fraction_of_year is the total number of
       seconds in the current day of the year, divided by the total number
       of seconds in that year.
       In V6.1.0, this option was updated to recognize the different
       calendars.
     * option = -5
       The same as option=0, except the values returned will be integers.
       This means that the seconds values may be truncated, as they are
       floating point values.

Description

   Converts a mixed Julian/Gregorian date to a UT-referenced date.

   This function is meant to be a replacement for ut_calendar and thus
   takes the same arguments.

   The default is to use the mixed Julian/Gregorian calendar. To change
   the calendar, you can set time@calendar to one of the following
   strings:
     * "standard"
     * "gregorian"
     * "proleptic_gregorian"
     * "julian"
     * "360_day", "360"
     * "365_day", "365"
     * "366_day", "366"
     * "noleap", "no_leap"
     * "allleap", "all_leap"

   If the input data does not contain a units attribute, then an error
   message will be printed and all missing values returned.

   This code was adopted with permission from a modified version of the
   cdtime software that is part of the NetCDF library developed at
   Unidata/UCAR. The cdtime software is part of CDMS, developed by the
   Program for Climate Model Diagnosis and Intercomparison (PCMDI) at
   Lawrence Livermore National Laboratory (LLNL).

   Caveats

     * Year 0 is not treated as year 1, like it is with the ut_calendar
       and ut_inv_calendar functions.
     * This function does not return the correct minutes and seconds if
       the reference time doesn't start at minute=0, second=0.
     * The "none" calendar is not yet supported.

See Also

   cd_inv_calendar, ut_calendar, ut_inv_calendar, calendar_decode2,
   yyyymm_to_yyyyfrac, yyyymmdd_to_yyyyfrac, yyyymmddhh_to_yyyyfrac
   cd_string, ut_string, time_axis_labels

Examples

   Example 1

   Assume five time values that represent "hours since 1-1-1 00:00:0.0".
   Convert these values to UTC time in the format "hhZ dd mmm yyyy", where
   "mmm" represents a month abbreviation (and not a numerical month).
   sprinti is used to create the desired string:
  begin
  ;
  ; Array to hold month abbreviations. Don't store anything in index
  ; '0' (i.e. let index 1=Jan, 2=Feb, ..., index 12=Dec).
  ;
   month_abbr = (/"","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep", \
                    "Oct","Nov","Dec"/)
  ;
  ; Time values and units.
  ;
    time = (/17522904, 17522928, 17522952, 17522976, 17523000/)
    time@units = "hours since 1-1-1 00:00:0.0"
 ;
 ; Convert to UTC time.
 ;
   utc_date = cd_calendar(time, 0)
 ;
 ; Store return information into more meaningful variables.
 ;
   year   = tointeger(utc_date(:,0))    ; Convert to integer for
   month  = tointeger(utc_date(:,1))    ; use sprinti
   day    = tointeger(utc_date(:,2))
   hour   = tointeger(utc_date(:,3))
   minute = tointeger(utc_date(:,4))
   second = utc_date(:,5)
 ;
 ; Write out strings in the format "hhZ dd mmm yyyy".
 ;

   date_str = sprinti("%0.2iZ ", hour) + sprinti("%0.2i ", day) + \
              month_abbr(month) + " "  + sprinti("%0.4i", year)

   print(date_str)
 end

   The above script will produce the following output:
 Variable: date_str
 Type: string
 Total Size: 20 bytes
            5 values
 Number of Dimensions: 1
 Dimensions and sizes:   [5]
 Coordinates:
 (0)     00Z 01 Jan 2000
 (1)     00Z 02 Jan 2000
 (2)     00Z 03 Jan 2000
 (3)     00Z 04 Jan 2000
 (4)     00Z 05 Jan 2000

   Example 2

   Using the same time values as above, here's what the various options
   return:
   dym      = cd_calendar(time,  1)     ; Double array of length 5 with all
                                       ; values equal to 200001.
   iym      = cd_calendar(time, -1)     ; Same, only type integer

   dymd     = cd_calendar(time,  2)     ; (/20000101,20000102,20000103,
   iymd     = cd_calendar(time, -2)     ;   20000104,20000105/)

   dymdh    = cd_calendar(time,  3)     ; (/2000010100,2000010200,2000010300,
   iymdh    = cd_calendar(time, -3)     ;   2000010400,2000010500/)

   yearfrac = cd_calendar(time,  4)     ; (/2000,2000.002732240437,
                                        ;        2000.005464480874,
                                        ;        2000.008196721311,
                                        ;        2000.010928961749/)

   Example 3

   Use cd_calendar and day_of_year to create a new time variable with
   units of day_of_year.fraction_of_day. day_of_year requires integer
   arguments. Use tointeger to convert. To make the results as precise as
   possible the calculation is done in double precision.
 ;
 ; Time values and units.
 ;
   time = (/3356, 3356.083, 3356.333, 3356.917, 3357.042, 3358.208/)
   time@units = "days since 1995-01-01 00:00:0.0"

   utc_date = cd_calendar(time, 0)

   dyear = day_of_year(tointeger(utc_date(:,0)) \
                       ,tointeger(utc_date(:,1)) \
                       ,tointeger(utc_date(:,2)) )*1.d0   ; make double
   dyear = dyear + \
          (date(:,3)*3600.d0 + date(:,4)*60.d0 + date(:,5)*1.d0)/86400.d0
                                        ; (/70, 70.08299768518519,
                                        ;   70.33299768518519,
                                        ;   70.91699074074074,
                                        ;   71.04199074074074,
                                        ;   72.20799768518519/)


   Example 4

   option = -5 will return integers:
 ;
 ; Time values and units.
 ;
   time = (/3356, 3356.083, 3356.333, 3356.917, 3357.042, 3358.208/)
   time@units = "days since 1995-01-01 00:00:0.0"

   utc_date = cd_calendar(time, -5)

   dyear = day_of_year(utc_date(:,0),utc_date(:,1),utc_date(:,2))

   Example 5

   CAVEAT: As mentioned above, year 0 is treated as such, and not as year
   1 like ut_calendar.

   The difference between the two functions is illustrated by the
   following:
  f = addfile ("camdev07_cam3_6_15_gust_up00.cam2.h1.0003-01-19-00000.nc","r")
  time = f->time                   ; days since 0000-09-01 00:00:00
  date = f->date                   ; yyyymmdd [CAM]
  printVarSummary(time)

  cd_date = cd_calendar(time, -2)     ; YYYYMMDD [NCL]
  ut_date = ut_calendar(time, -2)
  print("original     cd_calendar    ut_calendar")
  print("  " + date + "         " + cd_date + "          " + ut_date)


Output:

Variable: time
Type: double
[snip]
Dimensions and sizes:   [time | 30]
Coordinates:
            time: [   0..  29]
Number Of Attributes: 4
  long_name :   time
  units :       days since 0000-09-01 00:00:00              <*** note 0000
  calendar :    noleap
  bounds :      time_bnds
. ..
    (0) original     cd_calendar    ut_calendar
    (0)  30119         30119          40119
    (1)  30120         30120          40120
    (2)  30121         30121          40121
    (3)  30122         30122          40122
    (4)  30123         30123          40123
    (5)  30124         30124          40124
    (6)  30125         30125          40125
    (7)  30126         30126          40126
    (8)  30127         30127          40127
    (9)  30128         30128          40128
[snip]


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

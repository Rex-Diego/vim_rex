THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ut_calendar.shtml
THE_TITLE:ut_calendar
   NCL Home > Documentation > Functions > Date routines

ut_calendar

   Converts a mixed Julian/Gregorian date to a UT-referenced date.

Prototype

        function ut_calendar (
                time       : numeric,
                option [1] : integer
        )

Arguments

   time

   A multi-dimensional array of time values in a mixed Julian/Gregorian,
   360, 365, or no leap calendaring system (the last three options were
   added in version 5.1.0).

   Must have a units attribute in one of the formats recognized by the
   UDUNITS-2 library.

   May additionally have a "calendar" attribute with one of the following
   values:
     * noleap
     * 360_day
     * 365_day

   The "standard" and "gregorian" calendars are the only ones recognized
   by the Udunits library. The other calendars were added by David W.
   Pierce, the developer of ncview.

   No other calendaring systems are recognized by this function,
   including:
command_year
n kyr B.P.

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
     * option = -5
       Available in version 5.1.0 and later.
       The same as option=0, except the values returned will be integers.
       This means that the seconds values may be truncated, as they are
       floating point values.

Description

   Unidata is no longer supporting the internal code that ut_calendar is
   based on. We recommend that you use the cd_calendar function instead.

   Converts a mixed Julian/Gregorian date to a UT-referenced date using
   the UDUNITS-2 library.

   As of version 5.1.0, other calendars are also recognized, if time
   contains a "calendar" attribute set to one of these values:
     * "360", "360_day"
     * "365", "365_day"
     * "noleap"

   Thanks to David W. Pierce, the developer of ncview, for providing these
   calendar additions.

   If the input data does not contain a units attribute, then an error
   message will be printed and all missing values returned.

   To quote the UDUNITS-2 man page:

     The udunits(3) package uses a mixed Gregorian/Julian calendar
     system. Dates prior to 1582-10-15 are assumed to use the Julian
     calendar, which was introduced by Julius Caesar in 46 BCE and is
     based on a year that is exactly 365.25 days long. Dates on and after
     1582-10-15 are assumed to use the Gregorian calendar, which was
     introduced on that date and is based on a year that is exactly
     365.2425 days long. (A year is actually approximately 365.242198781
     days long.) Seemingly strange behavior of the udunits(3) package can
     result if a user-given time interval includes the changeover date.
     For example, ut_calendar and ut_inv_calendar can be used to show
     that 1582-10-15 *preceded* 1582-10-14 by 9 days.

   Caveats of UDUNITS-2:
     * Year 0 is treated as year 1, because year 0 does not exist in the
       real world calendar.
     * The length of a month is fixed at 1/12 of a tropical year or
       2629743.831225 seconds. This means if you have a units of something
       like "months since 1870-1-1", then at time = 0 you will get:
    year   = 1870
    month  = 1
    day    = 1
    hour   = 0
    second = 0

       However, at time = 1, you will get:
    year   = 1870
    month  = 1
    day    = 31
    hour   = 10
    second = 3.83122

     * Udunits doesn't like uppercase values in the "units" string. For
       example, "HOURS since 1-1-1 00:00:0.0" is not a valid string, but
       "hours since 1-1-1 00:00:0.0" is.

   Important notes

     * ut_calendar is based on an external software package called
       UDUNITS-2, which has phased out the support for these types of
       calendaring routines. Caution should be used when using this
       routine with special calendars like the above, or negative values.
       If you have problems, then check out the user-contributed routine,
       calendar_decode2.
     * As of NCL version 5.2.0, this code is being linked against
       UDUNITS-2, which has a dependency on some xml files that come
       installed with NCL. There's a bug in 5.2.0 that if you are setting
       the environment variable UDUNITS_PATH, you may see the error
       message:

  warning:ut_calendar: Invalid specification string. Missing values will
  be returned.

       There are two possible work-arounds:
         1. Set the UDUNITS2_XML_PATH environment variable:
   setenv UDUNITS2_XML_PATH $NCARG_ROOT/lib/ncarg/udunits/udunits2.xml
or
   export UDUNITS2_XML_PATH=$NCARG_ROOT/lib/ncarg/udunits/udunits2.xml

         2. Unset the UDUNITS_PATH environment variable before you run
            NCL.
       See Also
       cd_calendar, cd_inv_calendar, ut_inv_calendar, calendar_decode2,
       yyyymm_to_yyyyfrac, yyyymmdd_to_yyyyfrac, yyyymmddhh_to_yyyyfrac,
       ut_string, cd_string, time_axis_labels
       Examples
       Example 1
       Assume five time values that represent "hours since 1-1-1
       00:00:0.0". Convert these values to UTC time in the format "hhZ dd
       mmm yyyy", where "mmm" represents a month abbreviation (and not a
       numerical month). sprinti is used to create the desired string:
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
   utc_date = ut_calendar(time, 0)
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
       Using the same time values as above, here's what the various
       options return:
   dym      = ut_calendar(time,  1)     ; Double array of length 5 with all
                                       ; values equal to 200001.
   iym      = ut_calendar(time, -1)     ; Same, only type integer

   dymd     = ut_calendar(time,  2)     ; (/20000101,20000102,20000103,
   iymd     = ut_calendar(time, -2)     ;   20000104,20000105/)

   dymdh    = ut_calendar(time,  3)     ; (/2000010100,2000010200,2000010300,
   iymdh    = ut_calendar(time, -3)     ;   2000010400,2000010500/)

   yearfrac = ut_calendar(time,  4)     ; (/2000,2000.002732240437,
                                        ;        2000.005464480874,
                                        ;        2000.008196721311,
                                        ;        2000.010928961749/)

       Example 3
       Use ut_calendar and day_of_year to create a new time variable with
       units of day_of_year.fraction_of_day. day_of_year requires integer
       arguments. Use tointeger to convert. To make the results as precise
       as possible the calculation is done in double precision.
 ;
 ; Time values and units.
 ;
   time = (/3356, 3356.083, 3356.333, 3356.917, 3357.042, 3358.208/)
   time@units = "days since 1995-01-01 00:00:0.0"

   utc_date = ut_calendar(time, 0)

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
       As of version 5.1.0, you can use option = -5 (instead of option =
       0) to return integers:
 ;
 ; Time values and units.
 ;
   time = (/3356, 3356.083, 3356.333, 3356.917, 3357.042, 3358.208/)
   time@units = "days since 1995-01-01 00:00:0.0"

   utc_date = ut_calendar(time, -5)

   dyear = day_of_year(utc_date(:,0),utc_date(:,1),utc_date(:,2))

       Example 5
       CAVEAT: The one 'subtle' difference between CAM 'time/date' and
       NCL's ut_calendar and ut_inv_calendar function occurs when the time
       units are ".... since 0000..."
       NCL uses Unidata's udunits and the updated ncview calendar
       software. Technically, in the 'time' world, there is no such thing
       as year 0000. The difference is illustrated by the following:
ncl 0> f    = addfile ("camdev07_cam3_6_15_gust_up00.cam2.h1.0000-09-01-00000.nc
","r")
ncl 1> time = f->time                   ; days since 0000-09-01 00:00:00
ncl 2> printVarSummary(time)

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

ncl 3> date = f->date                   ; yyyymmdd [CAM]
ncl 4> DATE = ut_calendar(time, -2)     ; YYYYMMDD [NCL]
ncl 5> DATE1 = DATE - 10000             ; subtract one YYYY

ncl 6> print(date+"   "+DATE+"   "+DATE1)
        CAM    NCL    NCL-one_YYYY
(0)     901   10901       901
(1)     902   10902       902
(2)     903   10903       903
(3)     904   10904       904
(4)     905   10905       905
(5)     906   10906       906
(6)     907   10907       907
(7)     908   10908       908
(8)     909   10909       909
(9)     910   10910       910
[snip]

       As noted in the documentation ...
Caveats of Unidata's Udunits:
    * Year 0 is treated as year 1, because year 0 does not exist
      in the real world calendar.

       Punch line: if you use the CAM file's date variable you can readily
       break down to other units. NCL's ut_calendar function is not
       needed.
   date    = f->date                 ; CAM  date (yyyymmdd)
   year    = date/10000
   mmdd    = date-year*10000
   month   = mmdd/100
   day     = mmdd-month*100

       Again, the difference between CAM and NCL calendars only occurs
       when the units are "xxxx since 0000".

       ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster
       | Sponsored by NSF

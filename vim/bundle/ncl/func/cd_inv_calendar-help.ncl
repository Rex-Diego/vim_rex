THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cd_inv_calendar.shtml
THE_TITLE:cd_inv_calendar
   NCL Home > Documentation > Functions > Date routines

cd_inv_calendar

   Converts a UT-referenced date to a mixed Julian/Gregorian date.

   [new.gif] Available in version 6.0.0 and later.

Prototype

        function cd_inv_calendar (
                year       : integer,
                month      : integer,
                day        : integer,
                hour       : integer,
                minute     : integer,
                second     : numeric,
                units      : string,
                option [1] : integer
        )

        return_val [dimsizes(year)] :  double

Arguments

   year

   An array or scalar integer representing years.
   month

   An array or scalar integer representing months. Must be same
   dimensionality as year.
   day

   An array or scalar integer representing days. Must be same
   dimensionality as year.
   hour

   An array or scalar integer representing hours. Must be same
   dimensionality as year.
   minute

   An array or scalar integer representing minutes. Must be same
   dimensionality as year.
   second

   An array or scalar numeric representing seconds. Must be same
   dimensionality as year.
   units

   A string representing a formatted time unit specification. Valid
   strings include:

seconds
minutes
hours
days
months
years

   The following units qualifiers may also be used:

since
after
from
ref

   Examples:

  units = "days after 0049-09-01 00:00:00"
  units = "hours ref 1-1-1 00:00:0.0"
  units = "months from 1-1-1"

   option

   The actual value of this variable currently has no effect, but it can
   optionally contain a "calendar" attribute. See description below.

Return value

   A double array of the same dimensionality as year. Will have a "units"
   attribute that contains the temporal units.

Description

   This function converts a UT-referenced date to a mixed Julian/Gregorian
   date.

   It is meant to be a replacement for ut_inv_calendar and thus takes the
   same arguments.

   The default is to use the mixed Julian/Gregorian calendar. To change
   the calendar, you can set option@calendar to one of the following
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
     * "none" (Added in V6.1.0)

   This code was adopted with permission from a modified version of the
   cdtime software that is part of the NetCDF library developed at
   Unidata/UCAR. The cdtime software is part of CDMS, developed by the
   Program for Climate Model Diagnosis and Intercomparison (PCMDI) at
   Lawrence Livermore National Laboratory (LLNL).

   Caveats

     * Year 0 is not treated as year 1 like it is with the ut_calendar and
       ut_inv_calendar functions.
     * This function does not return the correct minutes and seconds if
       the reference time doesn't start at minute=0, second=0.
     * The "none" calendar is not yet supported.

See Also

   cd_calendar, ut_calendar, ut_inv_calendar, calendar_decode2, cd_string,
   ut_string, time_axis_labels

Examples

   Example 1: To see how the inverse function cd_inv_calendar works,
   simply take the output from cd_calendar and plug it back into
   cd_inv_calendar:

  utc_date = cd_calendar(time, 0)

  year   = tointeger(utc_date(:,0))
  month  = tointeger(utc_date(:,1))
  day    = tointeger(utc_date(:,2))
  hour   = tointeger(utc_date(:,3))
  minute = tointeger(utc_date(:,4))
  second = utc_date(:,5)

  date = cd_inv_calendar(year,month,day,hour,minute,second,time@units, 0)

   The arrays date and time should be identical.

   Example 2: Convert yyyymmdd to a user specified 'units' attribute. The
   default calendar attribute is "standard". This is the same as the
   "gregorian" calendar.

  yyyymmdd  = (/19900101, 19950105, 19981102, 20030423, 20100612/)

  ntim  = dimsizes(yyyymmdd)

  yyyy  = yyyymmdd/10000
  mmdd  = yyyymmdd-yyyy*10000                ; mmdd = yyyymmdd%10000
  mm    = mmdd/100
  dd    = mmdd-mm*100                        ; dd   = mmdd%100

  hh    = dd                                 ; create arrays [*] of required siz
e
  mn    = dd
  sc    = dd

  hh    = 0                                  ; array syntax
  mn    = 0
  sc    = 0
                                             ; user specified
  units  = "hours since 1900-01-01 00:00:00" ; "seconds/hours/days since ...."
                                             ; do NOT use "months since ...."

  time   = cd_inv_calendar(yyyy,mm,dd,hh,mn,sc,units, 0)
  time!0 = "time"
  print(time)


   The output from the print statement:

Variable: time
Type: double
Total Size: 40 bytes
            5 values
Number of Dimensions: 1
Dimensions and sizes:   [time | 5]
Coordinates:
Number Of Attributes: 2
  calendar :    standard
  units :       hours since 1900-01-01 00:00:00

(0)     788928
(1)     832848
(2)     866376
(3)     905568
(4)     968136


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

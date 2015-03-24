THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ut_inv_calendar.shtml
THE_TITLE:ut_inv_calendar
   NCL Home > Documentation > Functions > Date routines

ut_inv_calendar

   Converts a UT-referenced date to a mixed Julian/Gregorian date.

Prototype

        function ut_inv_calendar (
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

   An array or scalar integer representing months. Must be same size as
   year.
   day

   An array or scalar integer representing days. Must be same size as
   year.
   hour

   An array or scalar integer representing hours. Must be same size as
   year.
   minute

   An array or scalar integer representing minutes. Must be same size as
   year.
   second

   An array or scalar numeric representing seconds. Must be same size as
   year.
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

time@units = "days after 0049-09-01 00:00:00"
time@units = "hours ref 1-1-1 00:00:0.0"
time@units = "months from 1-1-1"

   option

   The actual value of this variable currently has no effect, but it can
   optionally contain a "calendar" attribute. See description below.

Return value

   A double array of the same size as year. Contains a units attribute
   that contains the temporal units.

Description

   Unidata is no longer supporting the internal code that ut_inv_calendar
   is based on. We recommend that you use the cd_inv_calendar function
   instead.

   Converts a UT-referenced date to a mixed Julian/Gregorian date. As of
   version 5.1.0, if the option variable contains a "calendar" attribute
   with one of the following values:

     * "360", "360_day"
     * "365", "365_day"
     * "noleap"

   then this calendar will be used.

   Thanks to David W. Pierce, the developer of ncview, for providing these
   calendar additions.

   Important notes

     * ut_calendar is based on an external software package called
       UDUNITS-2, which has phased out the support for these types of
       calendaring routines. Caution should be used when using this
       routine with special calendars like the above, or negative values.
     * As of NCL version 5.2.0, this code is being linked against
       UDUNITS-2, which has a dependency on some xml files that come
       installed with NCL. There's a bug in 5.2.0 that if you are setting
       the environment variable UDUNITS_PATH, you may see the error
       message:

  warning:ut_inv_calendar: Invalid specification string. Missing values will
  be returned.

       There are two possible work-arounds:
         1. Set the UDUNITS2_XML_PATH environment variable:
   setenv UDUNITS2_XML_PATH $NCARG_ROOT/lib/ncarg/udunits/udunits2.xml
or
   export UDUNITS2_XML_PATH=$NCARG_ROOT/lib/ncarg/udunits/udunits2.xml

         2. Unset the UDUNITS_PATH environment variable before you run
            NCL.
     * In V5.1.0/5.1.1 there's a bug if you use one of the above
       calendars. You will get an error:
  Error, udu_lib_version not set to value value: -1

       A work-around is to call ut_calendar first with dummy data, which
       internally forces "udu_lib_version" to be correctly initialized.
       You can use these three lines:
  dum_time       = 17522904
  dum_time@units = "hours since 1-1-1 00:00:0.0"
  dum_date       = ut_calendar(dum_time, 0)

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

   The following excerpt from the UDUNITS-2 documentation explains the
   time@units encoding by example:

    The specification:

        seconds since 1992-10-8 15:15:42.5 -6:00

    indicates seconds  since October 8th, 1992 at 3 hours, 15 minutes and
    42.5 seconds in the afternoon in the time zone which is six hours to
    the west of Coordinated Universal Time (i.e.  Mountain Daylight Time).
    The time zone specification can also be written without a colon using
    one or two-digits.

See Also

   cd_calendar, cd_inv_calendar, ut_calendar, calendar_decode2, ut_string,
   cd_string, time_axis_labels

Examples

   Example 1

   To see how the inverse function ut_inv_calendar works, simply take the
   output from ut_calendar and plug it back into ut_inv_calendar:

  date = ut_inv_calendar(year,month,day,hour,minute,second,time@units, 0)

   The arrays date and time should be identical.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

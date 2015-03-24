THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/ut_convert.shtml
THE_TITLE:ut_convert
   NCL Home > Documentation > Functions > Date routines

ut_convert

   Converts a time variable from one set of units to another.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function ut_convert (
                dateFrom  : numeric,
                unitsTo   : string
        )

        return_val [dimsizes(dateFrom)] :  double

Arguments

   dateFrom

   The original date(s) to convert. It must contain a "units" attribute in
   one of two formats recognized by the Udunits library:
standard
gregorian

   The following common calendaring systems are NOT recognized by the
   Udunits library.
no_leap
360
365_day
command_year
n kyr B.P.

   unitsTo

   The new date unit to convert to, which must adhere to the same
   restrictions on the input units.

Return value

   An array of type double and the same size as dateFrom.

Description

   This function converts dateFrom from its original Julian/Gregorian
   units to the new specified units, using the built-in functions
   ut_calendar and ut_inv_calendar.

   For support for more calendaring systems, use cd_convert.

   If the input data does not contain a units attribute, then an error
   message will be printed and all missing values will be returned.

   To quote the Udunits man page:

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

   Caveats of Udunits:
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

   This function was contributed by Carl J. Schreck, III, a graduate
   student at the University at Albany in the Department of Earth and
   Atmospheric Sciences.

See Also

   cd_convert, ut_calendar, ut_inv_calendar

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Convert a time variable from hours to days:
  time_hours = ut_inv_calendar( 2000, 01, 01, 00, 00, 00,  "hours since 1800-01-
01 00:00", 0 )
  print( time_hours )
  time_days = ut_convert( time_hours, "days since 1800-01-01 00:00" )
  print( time_days )

   The above will output:
Variable: time_hours
Type: double
Total Size: 8 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
Number Of Attributes: 1
  units :       hours since 1800-01-01 00:00
(0)     1753152

Variable: time_days
Type: double
Total Size: 8 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
Number Of Attributes: 1
  units :       days since 1800-01-01 00:00
(0)     73048

   Example 2

   Overlay on a Hovmueller two datasets that use different units for their
   time coordinates:
  data2&time = ut_convert( data2&time, data1&time@units )
  contour1 = gsn_csm_hov( wks, data1, res1 )
  contour2 = gsn_csm_hov( wks, data2, res2 )
  overlay( contour1, contour2 )


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

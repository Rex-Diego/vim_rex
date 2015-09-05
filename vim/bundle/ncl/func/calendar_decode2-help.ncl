THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/User_contributed/calendar_decode2.shtml
THE_TITLE:calendar_decode2
   NCL Home > Documentation > Functions > Date routines

calendar_decode2

   Translates numeric time coordinates to calendar times.

   [new.gif] Available in version 5.2.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/calendar_decode2.ncl"

        function calendar_decode2 (
                time       : numeric,
                option [1] : integer
        )

Arguments

   time

   An array of numeric time coordinates in one of the supported calendar
   systems. See dimension restrictions below.

   time@units = Udunits-style time reference string, scalar. E.g. "days
   since 1800-1-1 00:00:00". The attribute name "units" must be lower
   case. The string value is case insensitive. The units attribute is
   required.

   time@calendar = name of calendar system, string scalar. E.g.
   "gregorian". The attribute name "calendar" must be lower case. The
   string value is case insensitive. The calendar attribute is optional.
   If missing, Gregorian is implied.
   option

   A scalar integer indicating the format of the output. See description
   below.

Return value

   An array of translated date and time values equivalent to the input
   time coordinates. The format of the output array is selected by the
   option parameter.

   option = 0 or -5: The result array will be of type float (option 0) or
   integer (option -5), with one added dimension on the right:

     result(:,0) --> years
     result(:,1) --> months
     result(:,2) --> days
     result(:,3) --> hours
     result(:,4) --> minutes
     result(:,5) --> seconds

   Other options: The result array will have the same dimensions as the
   input array. For a description of the other formats, see the
   documentation for ut_calendar.

Description

   This version contains partial support for several calendar systems
   described in CF-1 conventions. The COARDS convention is also supported,
   as it uses the Gregorian calendar by default. This is the definitive
   reference for CF-1:

     http://cf-pcmdi.llnl.gov/documents/cf-conventions/1.4/ch04s04.html

   Supported calendar systems:

   gregorian or standard
          Mixed Gregorian/Julian calendar as defined by UDUNITS. This is
          the default when the "calendar" attribute is missing. See
          caution below.

   proleptic_gregorian
          Gregorian calendar extended to dates before 1582-10-15.

   noleap or 365_day
          Gregorian calendar with no leap years. Every year has 365 days.

   all_leap or 366_day
          Gregorian calendar with every year being a leap year. Every year
          has 366 days.

   360_day
          All years are 360 days divided into 30 day months.

   Calendar systems in CF-1.4, not currently supported here:

     julian
     "none"

   Custom calendar attributes in CF-1.4, not currently supported here:

     month_lengths
     leap_year
     leap_month

   Caution: When using the "gregorian" calendar system, the UDUNITS mixed
   Gregorian/Julian interpretation is used.

     http://www.unidata.ucar.edu/packages/udunits

   For the mixed Gregorian/Julian calendar, it is strongly recommended
   that all encoded dates as well as the reference date in the units
   string be greater than or equal to October 15, 1582. This is the valid
   start date for the contemporary interval of the Gregorian calendar
   system.

   Restrictions in this version:

   When calendar = "gregorian" or equivalent, this routine defers to NCL's
   ut_calendar function and includes all of its functionality.

   This also applies for "proleptic_gregorian" or equivalent, but only
   when all dates including the time unit string are "safe" dates later
   than 1582.

   The following apply when any of the other supported calendars are used:

     * Options:
       For proleptic_gregorian calendar with any dates 1852 or earlier,
       only output options 0 and -5 are supported.
     * Dimensions:
       For output options 0 and -5, all calendars other than gregorian and
       proleptic_gregorian, the input time variable must be scalar or a
       one dimensional array. For all other output options, there is no
       restriction on dimensionality.
     * Units string syntax must be one of these three:

     uuuu since y-m-d
     uuuu since y-m-d h:m:s
     uuuu since y-m-d h:m:s.s
       For example:

     days since 1800-1-1
     days since 1800-01-01 0:0:0
     days since 1800-01-01 00:00:0.000
     * Base unit for time (uuuu) must be one of these:

     day or days
     hour or hours
     minute or minutes
     second or seconds
     * The base year must be zero or positive.
     * Time of day in the units string is NOT CHECKED and MUST BE ZERO.
     * (LATER: Time of day in the units string is restricted to zero
       only.)
     * The time zone suffix in the units string is not supported and must
       not be included.
     * The global "conventions" attribute is not checked for consistency
       with calendar attributes encountered.
     * Type and dimension checking of calendar attributes is minimal.

   General notes:

   Following typical conventions, attribute names are CASE SENSITIVE.

   String attribute values are CASE INSENSITIVE.

   Author:

     Dave Allured
     dave.allured@noaa.gov
     University of Colorado, CIRES Climate Diagnostics Center (CDC)
     http://cires.colorado.edu/science/centers/cdc/
     NOAA/ESRL/PSD, Climate Analysis Branch (CAB)
     http://www.esrl.noaa.gov/psd/psd1/

See Also

   cd_calendar, cd_inv_calendar, ut_calendar, ut_inv_calendar


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

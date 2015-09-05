THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/days_in_month.shtml
THE_TITLE:days_in_month
   NCL Home > Documentation > Functions > Date routines

days_in_month

   Calculates the number of days in a month given month, day, and year.

Prototype

        function days_in_month (
                year   : integer,
                month  : integer
        )

        return_val [dimsizes(year)] :  integer

Arguments

   year

   A multi-dimensional integer array or scalar value representing years.
   Values must be >= 0.
   month

   An integer array of the same size as year representing months of the
   year. Values must be 1 to 12.

Return value

   A integer array of the same size as year where each value represents
   the number of days in a particular month.

Description

   Calculates the number of days in a month given arrays of months, days,
   and years. Gregorian calendar only.

   In V6.1.0, this function was upgraded to look for a "calendar"
   attribute attached to the "year" variable. Valid calendars include:
     * "standard" (the default)
     * "gregorian"
     * "julian"
     * "360_day", "360"
     * "365_day", "365"
     * "366_day", "366"
     * "noleap", "no_leap"
     * "allleap", "all_leap"
     * "none"

   Also in V6.1.0, this function was upgraded to recognize missing values.

See Also

   day_of_year, day_of_week, monthday, isleapyear

Examples

   Example 1

dim = days_in_month((/1996,1997,1/),(/2,2,1/))  ; dim = (/29,28,31/)

   Example 2

   This example shows how to use the new "calendar" attribute, which was
   added in NCL version 6.1.0.

year  = (/1996,1997,1/)
month = (/   2,   2,1/)

year@calendar = "standard"
dim = days_in_month(year,month)  ; dim = (/29,28,31/)

year@calendar = "noleap"
dim = days_in_month(year,month)  ; dim = (/28,28,31/)

year@calendar = "allleap"
dim = days_in_month(year,month)  ; dim = (/29,29,31/)

year@calendar = "360_day"
dim = days_in_month(year,month)  ; dim = (/30,30,30/)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

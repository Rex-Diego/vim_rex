THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/monthday.shtml
THE_TITLE:monthday
   NCL Home > Documentation > Functions > Date routines

monthday

   Calculates a concatenated month_day given a day and year.

Prototype

        function monthday (
                year  : integer,
                day   : integer
        )

        return_val [dimsizes(year)] :  integer

Arguments

   year

   A multi-dimensional integer array or scalar value representing years.
   Values must be >= 0.
   day

   An integer array of the same size as year representing days of the
   year. Values must be 1 to 366.

Return value

   An integer array of the same size as year. Each value represents the
   concatenated month and day.

Description

   Calculates a concatenated month_day given arrays of years and days.

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

   day_of_year, day_of_week, days_in_month, isleapyear

Examples

   Example 1

  year = (/1933,1996,1997,1996/)
  day  = (/ 245, 366, 365,  61/)
  md = monthday(year,day)  ; md = (/902,1231,1231,301/)

   Example 2

   This example shows how to use the new "calendar" attribute, which was
   added in NCL version 6.1.0.

  year = (/1933,1996,1997,1996/)
  day  = (/ 245, 366, 365,  61/)

  year@calendar = "standard"
  md = monthday(year,day)  ; md = (/902,1231,1231,301/)

  year@calendar = "allleap"
  md = monthday(year,day)  ; md = (/902,1231,1230,301/)

  day  = (/ 245, 365, 365,  61/)     ; can't use any values > 365
  year@calendar = "noleap"
  md = monthday(year,day)  ; md = (/902,1231,1231,302/)

  day  = (/ 245, 360, 359,  61/)     ; can't use any values > 360
  year@calendar = "360"
  md = monthday(year,day)  ; md = (/905,1230,1229,301/)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

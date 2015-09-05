THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isleapyear.shtml
THE_TITLE:isleapyear
   NCL Home > Documentation > Functions > Date routines

isleapyear

   Determines if a given year is a leap year.

Prototype

        function isleapyear (
                year  : integer
        )

        return_val [dimsizes(year)] :  logical

Arguments

   year

   A multi-dimensional integer array or scalar value representing years.
   Values must be >= 0.

Return value

   A logical array of the same size as year. True = leap, False = no leap.

Description

   Determines if a given year is a leap year.

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

   day_of_year, day_of_week, days_in_month, monthday

Examples

   Example 1

; Every element of isleap will be false in this case
isleap = isleapyear((/1997,1993,1900,1990/))

   Example 2

   This example shows how to use the new "calendar" attribute, which was
   added in NCL version 6.1.0.

year = (/1900,1903,1996,2000,2007/)

year@calendar = "standard"
isleap = isleapyear(year)  ; False, False, True, True, False

year@calendar = "julian"
isleap = isleapyear(year)  ; True, False, True, True, False

year@calendar = "noleap"
isleap = isleapyear(year)  ; False, False, False, False, False

year@calendar = "all_leap"
isleap = isleapyear(year)  ; True, True, True, True, True

year@calendar = "360"
isleap = isleapyear(year)  ; False, False, False, False, False

year@calendar = "365"
isleap = isleapyear(year)  ; False, False, False, False, False



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

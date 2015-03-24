THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/greg2jul.shtml
THE_TITLE:greg2jul
   NCL Home > Documentation > Functions > Date routines

greg2jul

   Converts a Gregorian date to a Julian day.

Prototype

        function greg2jul (
                year   : integer,
                month  : integer,
                day    : integer,
                hour   : integer
        )

        return_val [dimsizes(year)] :  integer or double

Arguments

   year

   Integer array of any dimensionality. Must be >= 0.
   month

   Integer array of any dimensionality. Must be from 1 to 12.
   day

   Integer array of any dimensionality. Must be from 1 to 31.
   hour

   Integer array of any dimensionality. Must from 0 to 23, or the values
   can all be negative if you don't want the hour to enter into the
   calculation.

Return value

   An array of the same size as year. The type is integer if the values of
   hour are negative, and double otherwise.

Description

   Converts a Gregorian date to a Julian day. A Julian day is defined as
   the number of days since January 1, 4713 B.C. A Julian day begins at
   noon Universal Time [UT; 12Z] of the given date (Fliegel & Van
   Flandern, (1968), A Machine Algorithm for Processing Calendar Dates,
   Communications of the ACM 11 No. 10, p657)

   In V6.1.0. this function was upgraded to recognize missing values.

See Also

   jul2greg, day_of_year, days_in_month, day_of_week, monthday, isleapyear
   ut_calendar, ut_inv_calendar

Examples

   Example 1

 juli = greg2jul(-4713,11,25,0) ;  ==>  juli = 0.5 (middle of Gregorian julian d
ay reference date)

 juli = greg2jul(0,1,1,0)       ;  ==>  juli = 1721059.5 (1st day of 1 BC)
 juli = greg2jul(1582,10,15)    ;  ==>  juli = 2299160.5 (1st day of Gregorian r
eform)
 juli = greg2jul(1900,1,1,-1)   ;  ==>  juli = 2415021

 juld = greg2jul(1900,1,1,0)    ;  ==>  juld = 2415020.5
 juld = greg2jul(1900,1,1,6)    ;  ==>  juld = 2415020.75
 juld = greg2jul(1900,1,1,12)   ;  ==>  juld = 2415021.
 juld = greg2jul(1900,1,1,18)   ;  ==>  juld = 2415021.25

 year  = (/1950,1960,1970,1980,1990,2000,2500/)
 month = (/   1,   1,   1,   7,   1,   1,  12/)
 day   = (/   1,   1,   1,  15,   1,   1,  31/)
 hour  = (/  -1,  -1,  -1,  -1,  -1,  -1,  -1/)

 julim = greg2jul (year,month,day,hour) ; returns      (0)  2433283
                                        ; (1)  2436935 (2)  2440588
                                        ; (3)  2444436 (4)  2447893
                                        ; (5)  2451545 (6)  2634531

 hour  = (/  0,  3,  6,  9,  12,  15,  18/)
 juldm = greg2jul (year,month,day,hour)  ; returns         (0) 2433282.5
                                         ; (1) 2436934.625 (2) 2440587.75
                                         ; (3) 2444435.875 (4) 2447893
                                         ; (5) 2451545.125 (6) 2634531.25



   Example 2

   Time in the form of "days since 1900-1-1 00:00:0.0" is desired.
   ut_calendar and ut_inv_calendar are appropriate for handling time in
   these units.
     base_julian = greg2jul(1900,1,1,0)    ;  ==>  2415020.5

     new_julian  = greg2jul(1993,1,1,0) - base_julian

   Example 3

   Construct julian day function:
undef("newJulian")
function newJulian (yr,mo,dy,hr, yrBase,moBase,dyBase,hrBase)
begin
  return(greg2jul(yr,mo,dy,hr) - greg2jul(yrBase,moBase,dyBase,hrBase))
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

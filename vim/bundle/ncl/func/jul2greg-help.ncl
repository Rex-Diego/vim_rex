THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/jul2greg.shtml
THE_TITLE:jul2greg
   NCL Home > Documentation > Functions > Date routines

jul2greg

   Converts a Julian day to a Gregorian date.

Prototype

        function jul2greg (
                julian  : double or integer
        )

        return_val [see return section] :  integer

Arguments

   julian

   A mult-dimensional double or integer array. The array type determines
   the form of the return value. See the return value section for details.

Return value

   The structure of the return value is dependent upon the type of julian.
   If julian is a double, then a dimsizes (julian) x 4 array is returned
   where element 0 is the year, 1 is the month, 2 is the day, and 3 is the
   hour. If julian is an integer, then a dimsizes(julian) x 3 array is
   returned, where element 0 is the year, 1 is the month, and 2 is the
   day. The type is integer in both cases.

Description

   Converts a Julian day to a Gregorian date. A Julian day is defined as
   the number of days since January 1, 4713 B.C. A Julian day begins at
   noon Universal Time [UT: 12Z] of the given date (Fliegel & Van
   Flandern, (1968), A Machine Algorithm for Processing Calendar Dates,
   Communications of the ACM 11 No. 10, p657)

   In V6.1.0. this function was upgraded to recognize missing values.

See Also

   greg2jul, day_of_year, days_in_month, day_of_week, monthday,
   isleapyear, ut_calendar, ut_inv_calendar

Examples

   Example 1

 i = jul2greg(2415020 )   ; ==> i(0)=1899, i(1)=12, i(2)=31

 j = jul2greg(2415020.5)  ; ==> j(0)=1900, j(1)=1, j(2)=1, j(3)=0
 j = jul2greg(2415020.75) ; ==> j(0)=1900, j(1)=1, j(2)=1, j(3)=6
 j = jul2greg(2415021.  ) ; ==> j(0)=1900, j(1)=1, j(2)=1, j(3)=12
 j = jul2greg(2415021.25) ; ==> j(0)=1900, j(1)=1, j(2)=1, j(3)=18

 year  = (/1950,1960,1970,1980,1990,2000,2500/)
 month = (/   1,   1,   1,   7,   1,   1,  12/)
 day   = (/   1,   1,   1,  15,   1,   1,  31/)
 hour  = (/  -1,  -1,  -1,  -1,  -1,  -1,  -1/)

 ymd = jul2greg(julim)

; returns
; (0,0)1950  (0,1)1  (0,2)1
; (1,0)1960  (1,1)1  (1,2)1
; (2,0)1970  (2,1)1  (2,2)1
; (3,0)1980  (3,1)7  (3,2)15
; (4,0)1990  (4,1)1  (4,2)1
; (5,0)2000  (5,1)1  (5,2)1
; (6,0)2500  (6,1)12 (6,2)31


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

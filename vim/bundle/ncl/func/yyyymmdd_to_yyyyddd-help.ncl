THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/yyyymmdd_to_yyyyddd.shtml
THE_TITLE:yyyymmdd_to_yyyyddd
   NCL Home > Documentation > Functions > Date routines

yyyymmdd_to_yyyyddd

   Given concatenated year-month-day_of_month (yyyymmdd) create a
   one-dimensional array containing concatenated year and day_of_year
   [yyyyddd] values.

   [new.gif] Available in version 5.1.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function yyyymmdd_to_yyyyddd (
                yyyymmdd [*] : integer
        )

Arguments

   yyyymmdd

   A scalar or one-dimensional array specifying the date.

Return value

   A one dimensional array of type integer containing values of the form
   yyyyddd.

Description

   The return integer is constructed via
[ yyyy*1000 + day_of_year(yyyy, mm, dd) ]

See Also

   List of "date" and "calendar" functions

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

               ; all have the form 'yyyymmdd'
      date     = (/ 20030101, 20030201, 20030301 \
                  , 20040301, 20041231           \    ; leap year
                  , 20050301, 20051231/)
      yyyyddd  = yyyymmdd_to_yyyyddd( date )
      print(date+"   "+yyyyddd)

   The above yields:
          date
        yyyymmdd   yyyyddd
(0)     20030101   2003001
(1)     20030201   2003032
(2)     20030301   2003060       ; non-leap year
(3)     20040301   2004061       ; note March 1 is one day later
(4)     20041231   2004366       ; last day of a leap year
(5)     20050301   2005060       ; non-leap year
(6)     20051231   2005365       ; last day of non-leap year


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/monthly_total_to_daily_mean.shtml
THE_TITLE:monthly_total_to_daily_mean
   NCL Home > Documentation > Functions > Array query

monthly_total_to_daily_mean

   Convert monthly total values [eg, precipitation] to "per day" values.

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function monthly_total_to_daily_mean (
                yyyymm [*] : numeric,
                x          : numeric,
                opt    [1] : integer
        )

Arguments

   yyyymm

   Year-month dates [eg 198401,198402,...]. This must be the same size as
   the "time" dimension of x.
   x

   An array containing monthly values. Typically, this is monthly
   precipitation totals. The "time" dimension must be the leftmost
   dimension if there are multiple dimensions.
   opt

   Currently, not used. Set to zero [0].

Return value

   Returns an array the same size as x. All values have been divided by
   the number of days in a month.

Description

   Typical usage is that an array of monthly precipitation totals (eg, mm)
   are input. Each value is divided by the number of days in the month to
   return mm/day. Leap year Februaries use 29 days.

See Also

Examples

   Example 1

   An array of monthly precipitation totals [mm] is to be converted to
   mm/day. Typically, the array takes the form prc(time),
   prc(time,stations) or prc(time,lat,lon).
           prc_day = monthly_total_to_daily_mean(yyyymm, prc, 0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

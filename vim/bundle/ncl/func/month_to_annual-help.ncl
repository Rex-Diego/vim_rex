THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/month_to_annual.shtml
THE_TITLE:month_to_annual
   NCL Home > Documentation > Functions > Array query

month_to_annual

   Converts monthly values to annual values.

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function month_to_annual (
                x       : numeric,
                opt [1] : integer
        )

Arguments

   x

   An array containing monthly values. The "time" dimension must be the
   leftmost dimension if there are multiple dimensions. Ideally, the size
   of the "time" dimension is evenly divisable by 12.
   opt

   option
      opt=0 compute the unweighted sum of 12 values.
      opt=1 divide the unweighted sum by 12 to get the annual mean value(s)..

Return value

   Returns an array with the "time" dimension is decimated by a factor of
   12. If any month is missing (_FillValue) for an individual year a
   missing value is returned.

Description

   Typical usage is that an array of monthly precipitation totals (eg, mm)
   or monthly mean temperatures are input. For precipitation, generally
   opt=0, and the sum of the 12 values is returned. For temperature,
   generally opt=1, and the (unweighted) annual average is returned. All
   months must be present for an annual vale to be computed; else, an
   _FillValue for that year.

See Also

   month_to_annual_weighted

Examples

   Example 1

   A one dimensional array of monthly precipitation totals [mm] is to be
   converted to annual total. If prc(time) and the size of time is 240
   monthly values then 20 (=240/12) values (years) will be returned.
        prc_annual_total = month_to_annual(prc, 0)  ; prc_annual_total(20)

   If the array contains, say, monthly mean temperatures (tmp), then
        tmp_annual_mean = month_to_annual(tmp, 1)   ; tmp_annual_mean(20)

   Example 2

   A multi-dimensional array of monthly precipitation totals [mm] is to be
   converted to annual total. If prc(time,lat,lon) and the size of time is
   1200 monthly values then 100 (=120/12) values (years) will be returned.
        PRC = month_to_annual(prc, 0)  ; PRC(100,nlat,mlon)

   If the array contains, say, monthly mean temperatures
   [tmp(time,lev,lat,lon)], then
        TMP = month_to_annual(tmp, 1)  ; TMP(100,klev,nlat,mlon))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

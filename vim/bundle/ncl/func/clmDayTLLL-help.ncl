THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/clmDayTLLL.shtml
THE_TITLE:clmDayTLLL
   NCL Home > Documentation > Functions > Climatology

clmDayTLLL

   Calculates long term daily means (daily climatology) from daily data.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function clmDayTLLL (
                x [*][*][*][*] : float or double,
                yyyyddd    [*] : integer
        )

        return_val [366][*][*][*] :  typeof(x)

Arguments

   x

   A four-dimensional array (time, lev, lat, lon). The dimensions must be
   named.
   yyyyddd

   A one-dimensional array (same size as the "time" dimension of x)
   containing values of the form yyyy*1000 + Day_of_Year where yyyy is a
   year [eg: 1993] and ddd is the sequential day of the current year [eg:
   Jan01=>1, Jan31=>31, etc.

Return value

   A climatological time series where the leftmost dimension refers to the
   sequential day of the year.

Description

   Calculate the mean annual cycle from daily data. The return array will
   give the raw climatology at each grid point

       x(time,lev,lat,lon)  <==== input dimension order
       x!0 = "time"     <==== time is in days
       x!1 = "lev"
       x!2 = "lat"
       x!3 = "lon"

non-Leap  yyyyddd
       1905001 =>  Jan  1, 1905
       1905032 =>  Feb  1, 1905
       1905059 =>  Feb 28, 1905
       1905060 =>  Mar  1, 1905
       1905365 =>  Dec 31, 1905

Leap      yyyyddd
       1908001 =>  Jan  1, 1908
       1908032 =>  Feb  1, 1908
       1908059 =>  Feb 28, 1908
       1908060 =>  Feb 29, 1908
       1908061 =>  Mar  1, 1908
       1908366 =>  Dec 31, 1908

See Also

   smthClmDayTLL, calcDayAnomTLL, clmMon2clmDay, clmMonTLL, clmMonTLLL,
   clmMonLLLT, clmMonLLT

Examples

   Example 1

   Compute the long term daily means. The input is daily heights spanning
   1990-1999. Here, the values are packed as type short. The time
   coordinate is paresable by ut_calendar.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
   :
   :
   diri    = "./"                             ; input directory
   fili    = "HGT.nc"                         ; input file
   f       = addfile (diri+fili , "r")
;***********************************************************
; Read time and create required yyyyddd
;***********************************************************
   time    = f->time                          ; time:units = "hours since 1-1-1
00:00:0.0"
   TIME    = ut_calendar(time, 0)          ; type float
   year    = floattointeger( TIME(:,0) )
   month   = floattointeger( TIME(:,1) )
   day     = floattointeger( TIME(:,2) )
   ddd     = day_of_year(year, month, day)
   yyyyddd = year*1000 + ddd                                  ; needed for input
;***********************************************************
; Read data: short2flt
;***********************************************************
   hgt     =  short2flt( f->hgt )    ; convert to float
   printVarSummary( hgt )
;***********************************************************
; Compute daily climatology: raw and then 'smoothed'
;***********************************************************
   hClmDay    = clmDayTLLL(hgt, yyyyddd)     ; daily climatology at each grid po
int
   printVarSummary(hClmDay)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/clmDayTLL.shtml
THE_TITLE:clmDayTLL
   NCL Home > Documentation > Functions > Climatology

clmDayTLL

   Calculates long term daily means (daily climatology) from daily data.

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function clmDayTLL (
                x [*][*][*] : float or double,
                yyyyddd [*] : integer
        )

        return_val [366][*][*] :  typeof(x)

Arguments

   x

   A three-dimensional array (time, lat, lon). The dimensions must be
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

       x(time,lat,lon)  <==== input dimension order
       x!0 = "time"     <==== time is in days
       x!1 = "lat"
       x!2 = "lon"

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

   smthClmDayTLL, clmMonTLL, clmMonTLLL, clmMonLLLT, clmMonLLT

Examples

   Example 1

   Compute the long term daily means. The input is daily 500 hPa heights
   spanning 1990-1999. The values are packed as type short and the time is
   in units "hours since 1-1-1 00:00:0".
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
   hgt     =  short2flt( f->hgt(:,0,:,:) )    ; convert to float
   printVarSummary( hgt )
;***********************************************************
; Compute daily climatology: raw and then 'smoothed'
;***********************************************************
   hClmDay    = clmDayTLL(hgt, yyyyddd)     ; daily climatology at each grid poi
nt
   printVarSummary(hClmDay)


   The (edited) output yields
Variable: hgt
Type: float
Dimensions and sizes:   [time | 3652] x [lat | 73] x [lon | 144]
Coordinates:
            time: [17435256..17522880]
            lat: [90..-90]
            lon: [ 0..357.5]
Number Of Attributes: 16
  _FillValue :  1e+20
  level :       500
  long_name :   mean Daily Geopotential height

   The climatology
Variable: hClmDay
Type: float
Total Size: 15389568 bytes
            3847392 values
Number of Dimensions: 3
Dimensions and sizes:   [year_day | 366] x [lat | 73] x [lon | 144]
Coordinates:
            year_day: [1..366]
            lat: [90..-90]
            lon: [ 0..357.5]
Number Of Attributes: 4
  long_name :   Daily Climatology: mean Daily Geopotential height
  units :       m
  information : Raw daily averages across all years
  smoothing :   None


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/clmMon2clmDay.shtml
THE_TITLE:clmMon2clmDay
   NCL Home > Documentation > Functions > Climatology

clmMon2clmDay

   Create a daily climatology from a monthly climatology.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function clmMon2clmDay (
                xClmMon      : float or double,
                retOrder [1] : integer,
                opt      [1] : integer
        )

Arguments

   xClmMon

   An array of up to four dimensions which contains a monthly climatology.
   The leftmost dimension size must be 12.
   retOrder

   An integer vale of 0 or 1. If retOrder=0 then the returned array will
   have the leftmost dimension as size 365; retOrder=1 the returned array
   will have the rightmost dimension as size 365.
   opt

   Currently, not used, set to zero [ 0 ].

Return value

   An array of the same rank as the original containing daily values.

Description

   Monthly values are assigned to the day of the year corresponding to
   middle of each month. Linear interpolation is used to assign the
   values.

   The mid-month values are:
      midMon = (/ 15.5, 45  , 74.5,105  ,135.5,166  \   ; Jan -> June
                ,196.5,227.5,258  ,288.5,319  ,349.5/)  ; July-> December

See Also

   clmDayTLL, smthClmDayTLL, clmMonTLL, clmMonTLLL, clmMonLLLT, clmMonLLT

Examples

   Example 1

   Given a monthly climatological array, xMon(12,lat,lon), generate a
   daily climatologcal arrays xDay(365,lat,lon) and zDay(lat,lon,365).
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

     xDay = clmMon2clmDay(xMon, 0, 0)
     zDay = clmMon2clmDay(xMon, 1, 0)

     printVarSummary(xDay)
     printVarSummary(zDay)

   Setting retOrder=0 yields
     Variable: xDay
     Type: float
     Total Size: 11960320 bytes
                 2990080 values
     Number of Dimensions: 3
     Dimensions and sizes:   [day | 365] x [lat | 64] x [lon | 128]
     Coordinates:
                 day: [1..365]
                 lat: [-87.8638..87.8638]
                 lon: [ 0..357.1875]
     Number Of Attributes: 2
       info :        NCL: monClm2dayClm

   Setting retOrder=1 yields


     Variable: zDay
     Type: float
     Total Size: 11960320 bytes
                 2990080 values
     Number of Dimensions: 3
     Dimensions and sizes:   [lat | 64] x [lon | 128] x [day | 365]
     Coordinates:
                 lat: [-87.8638..87.8638]
                 lon: [ 0..357.1875]
                 day: [1..365]
     Number Of Attributes: 2
       info :        NCL: monClm2dayClm


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

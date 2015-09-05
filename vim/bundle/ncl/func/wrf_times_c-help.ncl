THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_contributed/wrf_times_c.shtml
THE_TITLE:wrf_times_c
   NCL Home > Documentation > Functions > WRF

wrf_times_c

   Converts WRF variable "Times" which is of type character to user
   specified numeric units.

   [new.gif] Available in version 4.3.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"
        function wrf_times_c (
                Times [*][*] : character,
                opt          : integer
        )

Arguments

   Times

   WRF variable containing the time. It must be a character variable of
   size: Times(Time, DateStrLen)
   opt

   Integer which specifies the units of the returned variable. Currently,
   there are four options:
     * opt=0 returns units of "hours since" initial time on the current
       file (type "double")
     * opt=1 returns units of "hours since 1901-01-01 00:00:00" (type
       "double")
     * opt=2 returns units of "yyyymmddhhmnss" (type "double")
     * opt=3 returns units of "yyyymmddhh" (type "integer")

Return value

   A one dimensional array containing numeric values corresponding to
   those of the "Times" character variable.

Description

   Convert the WRF variable "Times" which is of type character to units
   specified by the user.

See Also

   WRF functions/procedures, date functions

Examples

   Example 1

   Read the character "Times" variable from a netCDF file. Convert to
   different units as specified by opt.
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"

  f     = addfile ("wrfout_d01_000000.nc" , "r")

  Times = f->Times                    ; Times(Time, DateStrLen)    (type charact
er)

  Time_s = chartostring( Times )      ; string
  Time_0 = wrf_times_c( Times, 0 )      ; "hours since" initial time on file   (
double)
  Time_1 = wrf_times_c( Times, 1 )      ; "hours since 1901-01-01 00:00:00"    (
double)
  Time_2 = wrf_times_c( Times, 2 )      ; yyyymmddhhmnss                       (
double)
  Time_3 = wrf_times_c( Times, 3 )      ; yyyymmddhh                           (
integer)

   The above will create variables with the following contents.
            Time_s        Time_0   Time_1       Time_2            Time_3
      ____________________________________________________________________
(0)   2001-06-11_12:00:00    0     880476   20010611120000d    2001061112
(1)   2001-06-11_13:00:00    1     880477   20010611130000d    2001061113
(2)   2001-06-11_14:00:00    2     880478   20010611140000d    2001061114
(3)   2001-06-11_15:00:00    3     880479   20010611150000d    2001061115
(4)   2001-06-11_16:00:00    4     880480   20010611160000d    2001061116
(5)   2001-06-11_17:00:00    5     880481   20010611170000d    2001061117
(6)   2001-06-11_18:00:00    6     880482   20010611180000d    2001061118
(7)   2001-06-11_19:00:00    7     880483   20010611190000d    2001061119
(8)   2001-06-11_20:00:00    8     880484   20010611200000d    2001061120
(9)   2001-06-11_21:00:00    9     880485   20010611210000d    2001061121
(10)  2001-06-11_22:00:00   10     880486   20010611220000d    2001061122
(11)  2001-06-11_23:00:00   11     880487   20010611230000d    2001061123
(12)  2001-06-12_00:00:00   12     880488   20010612000000d    2001061200
(13)  2001-06-12_01:00:00   13     880489   20010612010000d    2001061201
(14)  2001-06-12_02:00:00   14     880490   20010612020000d    2001061202
(15)  2001-06-12_03:00:00   15     880491   20010612030000d    2001061203
(16)  2001-06-12_04:00:00   16     880492   20010612040000d    2001061204
(17)  2001-06-12_05:00:00   17     880493   20010612050000d    2001061205
(18)  2001-06-12_06:00:00   18     880494   20010612060000d    2001061206
(19)  2001-06-12_07:00:00   19     880495   20010612070000d    2001061207
(20)  2001-06-12_08:00:00   20     880496   20010612080000d    2001061208
(21)  2001-06-12_09:00:00   21     880497   20010612090000d    2001061209
(22)  2001-06-12_10:00:00   22     880498   20010612100000d    2001061210
(23)  2001-06-12_11:00:00   23     880499   20010612110000d    2001061211
(24)  2001-06-12_12:00:00   24     880500   20010612120000d    2001061212

   Example 2

   Read the variable "U" from the above file. Note that there is no
   coordinate variable associated with the named dimensions/inforef>
   "Time".
     u = f->U             ;  U(Time, bottom_top, south_north, west_east_stag)

     u&Time = Time_0      ; assign coordinate values to Time
     printVarSummary (u)

   The result will be:
Variable: u
Type: float
Total Size: 19901700 bytes
            4975425 values
Number of Dimensions: 4
Dimensions and sizes:   [Time | 25] x [bottom_top | 27] x [south_north | 81] x [
west_east_stag | 91]
Coordinates:
            Time: [   0..  24]
[SNIP]

   Other assignments would yield:
     u&Time = Time_1       Coordinates: Time: [880476 ... 880500]
     u&Time = Time_2       Coordinates: Time: [20010611120000d ... 2001061212000
0d]
     u&Time = Time_3       Coordinates: Time: [2001061112 ... 2001061212]

   Note that the "Time_s" variables can not be assigned as a coordinate
   variable because it is not a monotonically {in/de}creasing numerical
   array.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

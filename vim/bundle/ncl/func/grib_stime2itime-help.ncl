THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/grib_stime2itime.shtml
THE_TITLE:grib_stime2itime
   NCL Home > Documentation > Functions > Date routines

grib_stime2itime

   Converts grib initial_time (string) to time (integer).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function grib_stime2itime (
                stime [*] : string
        )

        return_val [dimsizes(stime)] :  integer

Arguments

   stime

   An array of strings.

Return value

   An integer array of the same dimensionality as stime is returned. In
   addition, the attributes "long_name" and "units" will be set, and the
   return value will be made a coordinate variable. (That is, dimension
   "0" will be given the same name as the variable itself.)

Description

   The function grib_stime2itime converts grib initial_time (string) to
   time (integer). The return values will be of the form YYYYMMDDHH.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_user_getvar.shtml
THE_TITLE:wrf_user_getvar
   NCL Home > Documentation > Functions > WRF, File IO

wrf_user_getvar

   Extracts data from ARW WRF model output, and does basic diagnostics
   calculations.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_user_getvar (
                file_handle  : file or list [list added in V6.0.0],
                variable     : string,
                time         : integer
        )

        return_val  :  numeric

Arguments

   file_handle

   Reference to an input netCDF file opened with addfile, or, as of
   V6.0.0, can be a list of NetCDF files opened with addfiles.
   variable

   Variable to retrieve. This can be either a variable in the ARW WRF
   output file(s), or a diagnostics - a limited number of diagnostics are
   available, see description below.
   time

   Time in file to retrieve. A value of -1 will retrieve all times in the
   file(s).

Return value

   Data of requested field.

Description

   This function extracts data from the ARW WRF file, and, if available,
   calculates the requested diagnostic.

   For WRF variable names and their definitions, you can easily check them
   by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Available diagnostics (some diagnostics - marked in red below - are
   only available since version 6.1.0):
  avo                absolute vorticity [10-5 s-1]
  eth                Equivalent PotentialTtemperature [K]
  cape_2d            Returns 2D fields mcape/mcin/lcl/lfc
  cape_3d            Returns 3D fields cape and cin
  dbz                Reflectivity [dBZ]
  mdbz               Maximum reflectivity [dBZ]
  geopt/geopotential Full model geopotential [m2 s-2]
  helicity           Storm Relative Helicity [m-2/s-2]
  lat                latitude
  lon                longitude
  p/pres             Full model pressure [Pa]
  pressure           Full model pressure [hPa]
  pvo                potential vorticity [PVU]
  pw                 Precipitable Water
  rh2                2m Relative Humidity [%]
  rh                 Relative Humidity [%]
  slp                Sea level pressure [hPa]
  ter                Model terrain height [m]
  td2                2m dew point temperature [C]
  td                 Dew point temperature [C]
  tc                 Temperature [C]
  th/theta           Potential temperature [K]
  tk                 Temperature [K]
  times              Times in file (return strings - recommended)
  Times              Times in file (return characters)
  updraft_helicity   Updraft helicity [m-2/s-2]
  ua                 U component of wind on mass points
  va                 V component of wind on mass points
  wa                 W component of wind on mass points
  uvmet10            10m U and V components of wind rotated to earth coordinates
  uvmet              U and V components of wind rotated to earth coordinates
  z/height           Full model height [m]

   wrf_user_getvar is modifiable by the user, if you want to add your own
   diagnostics. To add your own diagnostics:
     * Copy the file "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
       to your own directory.
     * Edit this file with any UNIX editor and look for the lines:
undef("wrf_user_getvar")
function wrf_user_getvar( file_handle, varin[*]:string, time:integer )

       Before the final lines in this function:
  return(var)

end

       Add these lines, replacing newvar as appropriate:
  if( variable .eq. "newvar" ) then
    . . . fill in code here . . .
  end if

     * To use the new version of this function, you can do one of two
       things:
         1. Copy your modified script over
            "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl" and use
            the new "wrf_user_getvar" with your new entry:
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
xxx = wrf_usr_getvar(f,"XXX",0)

         2. Remove all but the modified "wrf_user_getvar" function from
            your copy, rename the function ("wrf_user_getvar2"), and
            rename the file ("my_new_script.ncl"). You will need to load
            the above script and your new script to use the new function:
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "my_new_script.ncl"
xxx = wrf_usr_getvar2(f,"XXX",0)

   wrf_user_getvar is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_getvar, wrf_user_ij_to_ll, wrf_user_intrp2d, wrf_user_intrp3d,
   wrf_user_list_times, wrf_user_ll_to_ij, wrf_user_unstagger

   See the full list of WRF functions.

Examples

   Example 1

   Get variables from a single WRF ARW file:

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  slp = wrf_user_getvar(a,"slp",time)  ; slp
  tc2 = wrf_user_getvar(a,"T2",time)   ; T2 in Kelvin
  u10 = wrf_user_getvar(a,"U10",time)  ; u at 10 m
  v10 = wrf_user_getvar(a,"V10",time)  ; v at 10 m

  ua  = wrf_user_getvar(a,"ua",time)   ; u on mass points
  va  = wrf_user_getvar(a,"va",time)   ; v on mass points

  avo = wrf_user_getvar(a,"avo",-1)    ; calculate avo for all times in file

   Example 2

   As of NCL V6.0.0, you can get a variable from a list of WRF ARW NetCDF
   files:

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  files = systemfunc("ls -1 wrfout_d01_2000*") + ".nc"
  a = addfiles(files,"r")

  slp = wrf_user_getvar(a,"slp",-1)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

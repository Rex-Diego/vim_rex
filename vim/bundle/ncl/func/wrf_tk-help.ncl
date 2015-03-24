THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_tk.shtml
THE_TITLE:wrf_tk
   NCL Home > Documentation > Functions > WRF

wrf_tk

   Calculates temperature in [K] from ARW WRF model output.

Prototype

        function wrf_tk (
                P      : numeric,
                THETA  : numeric
        )

        return_val [dimsizes(P)] :  float or double

Arguments

   P

   Full pressure (perturbation + base state pressure). The rightmost
   dimensions are bottom_top x south_north x west_east. Units must be
   [Pa].
   THETA

   Potential temperature (i.e, perturbation + reference temperature) with
   the same dimension structure as P. Units must be [K].

Return value

   Temperature in [K]. The multi-dimensional array has the same size as P.
   The type will be double if P or THETA are double, and float otherwise.

Description

   This function returns temperature in [K]. The return variable will
   contain two attributes:

     return_val@description = "Temperature"
     return_val@units = "K"

   As of version 5.1.0, the return variable will contain the same named
   dimensions (if any) of THETA. Otherwise, the rightmost two dimensions
   will be named "south_north" and "west_east".

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_rh, wrf_user_getvar

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily
   check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1

   Read and process a 4d array. The arguments are variables from WRF data.

   Note that if your netCDF file doesn't have a ".nc" suffix, you must
   include it in the call to addfile so it knows what kind of file to
   open. The addfile call below will cause NCL to look for both a file
   called "wrfout_d01_2000-01-24_12:00:00.nc" and
   "wrfout_d01_2000-01-24_12:00:00".

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  P  = a->P                     ; perturbation
  Pb = a->PB                    ; base state pressure
  P  = P + Pb                   ; total pressure

  T = a->T                  ; perturbation potential temperature (theta+t0)
  T = T + 300.

  TK = wrf_tk (P, T)

  printVarSummary(TK)

   Example 2

   A case with multiple data files such as in ensemble forecasting.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

  fname = "wrfout_d01_2007-05-03_00:00:00"
  flist = systemfunc("ls ENS_*/"+fname)
  print(flist)


   The output yields:
  Variable: flist
  Type: string
  Total Size: 12 bytes
              3 values
  Number of Dimensions: 1
  Dimensions and sizes:   [3]
  Coordinates:
  (0)     ENS_1/wrfout_d01_2007-05-03_00:00:00
  (1)     ENS_2/wrfout_d01_2007-05-03_00:00:00
  (2)     ENS_3/wrfout_d01_2007-05-03_00:00:00

  f     = addfiles(flist+".nc","r")
  THETA = addfiles_GetVar(f,flist+".nc","T")
  P     = addfiles_GetVar(f,flist+".nc","P")
  PB    = addfiles_GetVar(f,flist+".nc","PB")
  THETA = THETA + 300.
  P     = P + PB

  TK = wrf_tk(P, THETA)
  printVarSummary (TK)

   The output yields:
  Variable: TK
  Type: float
  Total Size: 3021372 bytes
              755343 values
  Number of Dimensions: 4
  Dimensions and sizes:   [Time | 3] x [bottom_top | 41] x [south_north | 69] x
[west_east | 89] ; in NCL 5.1.0
  Coordinates:
  Number Of Attributes: 2
    units :       K
    description : Temperature

   Example 3

   The function wrf_user_getvar, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to calculate many diagnostics in one step.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  tk = wrf_user_getvar(a,"tk",time)  ; calculate tk

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

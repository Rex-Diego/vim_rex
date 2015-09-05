THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_interp_1d.shtml
THE_TITLE:wrf_interp_1d
   NCL Home > Documentation > Functions > WRF, Interpolation

wrf_interp_1d

   Linearly interpolates a one-dimensional variable in the vertical.

Prototype

        function wrf_interp_1d (
                v_in   : numeric,
                z_in   : numeric,
                z_out  : numeric
        )

        return_val [dimsizes(z_out)] :  float or double

Arguments

   v_in

   One-dimensional array to interpolate in the vertical. This array's
   rightmost dimension is nz.
   z_in

   One-dimensional array representing the vertical structure
   (height/pressure) of the v_in array. This array has the same
   dimensionality as v_in.
   z_out

   An array with constant height to interpolate to. Must be of the same
   type (height/pressure) as z_in.

Return value

   The return array will be the same dimensionality as z_out. The return
   type will be double of any of the input is double, and float otherwise.

Description

   Linear interpolation in the vertical. Vertical indices can increase or
   decrease with height.

   If v_in has attributes "description" or "units", they will be returned
   with the output variable. The "description" attribute will be set to "
   " if v_in doesn't contain this attribute.

   As of version 5.1.0, the return variable will contain the same named
   dimensions (if any) of Qv. Otherwise, the rightmost two dimensions will
   be named "south_north" and "west_east".

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_interp_2d_xy, wrf_interp_3d_z, wrf_user_intrp3d, wrf_user_getvar

   See the full list of WRF functions.

Examples

   Example 1

    a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
    time = 0

  ; Temperature
    t = a->T(time,:,:,:)          ; perturbation potential temperature (theta-30
0)
    theta = t + 300.              ; potential temperature
    p  = a->P(time,:,:,:)
    pb = a->PB(time,:,:,:)
    pf = p + pb                    ; full pressure
    tk = wrf_tk (pf, theta)        ; temperature in Kelvin

  ; Height in the model
    ph   = a->PH(time,:,:,:)        ; perturbation geopotential
    phb  = a->PHB(time,:,:,:)       ; base-state geopotential
    tmp  = (ph+phb)/9.81            ; On full (w) levels
    dimv = dimsizes(tmp)
    z = 0.5*(tmp(0:dimv(0)-2,:,:)+tmp(1:dimv(0)-1,:,:))    ; On half (mass) leve
ls
    z@description = "height"
    z@units = "m"

    lat = a->XLAT(time,:,:)        ; latitude
    lon = a->XLONG(time,:,:)        ; longitude

  ; Radiosonde observation
    radiosonde = asciiread("raob_OUN.txt",(/2,39/),"float")
    z_raob = radiosonde(0,:)    ; height in radiosonde
    z_raob@_FillValue = -999.99 ; missing value

  ; Station information (OUN - Norman, OK)
    olat = 35.2
    olon = -97.4

  ; Find the closest point to the radiosonde site in WRF grids
    obsij = wrf_latlon_to_ij(lat,lon,olat,olon)
    obsi = obsij(0)
    obsj = obsij(1)

    tin = tk(:,obsi,obsj)
    zin = z(:,obsi,obsj)

  ; Interpolation
    t_wrf = wrf_interp_1d (tin,zin,z_raob)
    t_wrf@_FillValue = -999.99
    print(t_wrf)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sindex_yrmo.shtml
THE_TITLE:sindex_yrmo
   NCL Home > Documentation > Functions > General applied math

sindex_yrmo

   Calculates the Southern Oscillation Index given two series of
   year-month values.

Prototype

        function sindex_yrmo (
                slpt [*][*] : numeric,
                slpd [*][*] : numeric,
                iprnt   [1] : integer
        )

        return_val [dimsizes(slpt)] :  float or double

Arguments

   slpt

   A two-dimensional array of monthly data from station/grid point 1.
   Dimensions must be number of years by number of months.
   slpd

   A two-dimensional array of monthly data from station/grid point 2 (must
   have same dimensions as slpt).
   iprnt

   A scalar indicating whether to print information (0 means do not
   print).

Return value

   This function returns a two-dimensional array with the same dimensions
   as slpt and slpd. The output array will be double if slpt or slptd are
   double, and float otherwise.

   The attributes long_name, short_name, and units are returned as well.

Description

   Given two series of year-month values (e.g slp), this function
   calculates an "index" (e.g. Southern Oscillation Index). The overall
   anomaly standard deviation is used to normalize the anomalies.

   If you want to calculate the noise index as well, use snindex_yrmo.

See Also

   snindex_yrmo

Examples

   Note: these code snippets contain examples of both functions
   sindex_yrmo and snindex_yrmo.

   Example 1

begin
  nmos    = 12                         ; number of months
  nyrstrt = 1880                       ; first year of data
  nyrlast = 1997                       ; last year with data
  nyrs    = (nyrlast-nyrstrt+1)        ; total number of years
  xmsg    = -999.9                     ; missing value
  ncol    = nmos+1                     ; number of columns
  iprnt   = 1                          ; print soi out

; ================================>  ; READ THE ASCII FILES
  filet = asciiread ("tahiti.slp",(/nyrs,ncol/), "float")
  filed = asciiread ("darwin.slp",(/nyrs,ncol/), "float")
                                     ; create vector/arrays
  yr   = filet(:,0 )                   ; vector containing the years
  slpt = filet(:,1:)                   ; tahiti slp
  slpd = filed(:,1:)                   ; darwin slp
  slpt@_FillValue = xmsg
  slpd@_FillValue = xmsg

  soi = sindex_yrmo (slpt,slpd,iprnt)
  print("soi@_FillValue=" + soi@_FillValue)
  print(soi@long_name)
  print(soi@short_name)
  print(soi@units)

  xoi_noise = new ( (/nyrs,nmos/), float  )
  xoi = snindex_yrmo(slpt,slpd,iprnt,xoi_noise)
  print(xoi@long_name)
  print(xoi@short_name)
  print(xoi@units)
end

   Example 2

   Assume slp is dimensioned time x lat x lon and that the "time"
   dimension spans full years (i.e. for 50 years there are 12*50=600 time
   steps). Further assume the two grid points be at (lat1,lon1) and
   (lat2,lon2). Then:

   ntim = dimsizes(time)
   nyrs = ntim/12
   nmos = 12

   index = sindex_yrmo( onedtond(slp(:,{lat1},{lon1}), (/nyrs,nmos/))   \
                      , onedtond(slp(:,{lat2},{lon2}), (/nyrs,nmos/)), 0)
   index@long_name = "my favorite index"
   index!0    = "time"
   index&time = time

   Example 3

   Same as example 2, but calculate signal and noise:

   noise = new ( (/nyrs,nmos/), typeof(slp) )
   index = snindex_yrmo( onedtond(slp(:,{lat1},{lon1}), (/nyrs,nmos/))   \
                       , onedtond(slp(:,{lat2},{lon2}), (/nyrs,nmos/)), 0\
                       , noise)

   index@long_name = "my favorite index"
   index!0    = "time"
   index&time = time

   noise@long_name = "stuff that obscures my favorite index"
   noise!0    = "time"
   noise&time = time


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

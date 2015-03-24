THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/bin_sum.shtml
THE_TITLE:bin_sum
   NCL Home > Documentation > Functions > Lat/Lon functions

bin_sum

   Calculates binned sums and counts over multiple invocations of the
   procedure.

Prototype

        procedure bin_sum (
                gbin [*][*] : numeric ,
                gknt [*][*] : integer ,
                glon    [*] : numeric ,
                glat    [*] : numeric ,
                zlon    [*] : numeric ,
                zlat    [*] : numeric ,
                z       [*] : numeric
        )

Arguments

   gbin

   User supplied array which will contain the summed quantities. This must
   be type "float" or "double" and it is the user's responsibility to
   initialize the array elements to 0.0
   gknt

   User supplied array which will contain the integer counts. This must
   conform to gbin. It is the user's responsibility to initialize the
   array elements to integer zero.
   glon

   Longitudes of gbin and gknt. These are reuired to be equally spaced.
   glat

   Latitudes of gbin and gknt. These must be equally spaced but they do
   not need to be the same spacing as glon.
   zlon

   Longitudes of the observational data (z).
   zlat

   Latitudes of the observational data (z).
   z

   Values of the observed data.

Description

   This procedure sums values z contained within the rectilinear array
   defined by the input grid. This takes advantage of the fact the
   latitude and longitude grid spacing is required to be constant but, as
   noted in the argument description, the spacing in the latitude and
   longitude directions need not be equal. The appropriate grid point
   subscripts are determined via a simple algotithm.

   This procedure was specifically added to facilitate spanning multiple
   files in an efficient manner.

   It is the user's responsibility to perform the averaging operation when
   all files have been read. The prime purpose of the function is
   efficiency when .

See Also

   bin_avg, triple2grid, triple2grid2d, poisson_grid_fill

Examples

   Example 1

   There are 133 MODIS files for a particular day. Each contains a "swath"
   of data. Sum the contributions of each swath. Then average the results.
   The ndtooned function creates the one-dimensional arrays expected by
   the bin_sum procedure.
  nlat  = 72
  mlon  = 144
  lat   = latGlobeFo(nlat,"lat","latitude","degrees_north")
  lon   = lonGlobeFo(mlon,"lon","longitude","degrees_east")

;*****************************************************************
; Variables to hold binned quantities
;*****************************************************************
  gbin  = new ( (/nlat,mlon/), float )
  gknt  = new ( (/nlat,mlon/), integer)

  gbin  = 0.0                      ; initialization
  gknt  = 0

;*****************************************************************
  diri = "./"
  fili = systemfunc("cd "+diri+" ; ls MODIS*005.nc")
  nfil = dimsizes( fili )

;*****************************************************************
; Loop over the files
;*****************************************************************
  tStrt = systemfunc("date")         ; time the loop (wall clock)

  vNam = "WATER_VAPOR"

  do nf=0,nfil-1
     print(nf+"   "+fili(nf))
     f       = addfile(diri+fili(nf), "r")
                                     ; read data
     x       = f->$vNam$
     lat2d   = short2flt( f->Latitude )
     lon2d   = short2flt( f->Longitude)

     bin_sum(gbin,gknt,glon,glat   \
            ,ndtooned(lon2d), ndtooned(lat2d),ndtooned(x) )

     delete(lat2d)        ; may change for the next file
     delete(lon2d)
     delete(  x  )
  end do

  wallClockElapseTime(tStrt, "Main File Loop", 0)
;*****************************************************************
; User nust perform averaging
;*****************************************************************
                                    ; avoid division by 0
  gknt     = where(gknt.eq.0 , gknt@_FillValue, gknt)

  gbin     = gbin/gknt

  gbin!0   = "lat"
  gbin!1   = "lon"
  gbin&lat =  lat
  gbin&lon =  lon

  copy_VarCoords(gbin, gknt)        ; copy coords

  if (isfilevaratt(f, vNam, "long_name")) then
      gbin@long_name = "BINNED: "+vNam
      gknt@long_name = "BINNED COUNT: "+vNam
  end if

  if (isfilevaratt(f, vNam, "units")) then
      gbin@units     = f->$vNam$@units
  end if

  printVarSummary(gbin)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

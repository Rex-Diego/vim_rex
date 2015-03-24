THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/region_ind.shtml
THE_TITLE:region_ind
   NCL Home > Documentation > Functions > Array query, Lat/Lon functions

region_ind

   Returns the indices (subscripts) of two-dimensional latitude/longitude
   arrays that span user specified latitude/longitude boundaries.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function region_ind (
                lat2d [*][*] : numeric,
                lon2d [*][*] : numeric,
                latS     [1] : numeric,
                latN     [1] : numeric,
                lonW     [1] : numeric,
                lonE     [1] : numeric
        )

        return_val  :  (4)  [integer or long]

Arguments

   lat2d

   A two-dimensional array that contains latitudes.
   lon2d

   A two-dimensional array that contains longitudes.
   latS

   Southern boundary
   latN

   Northern boundary
   lonW

   Western boundary
   lonE

   Eastern boundary

Return value

   A one dimensional array of length 4 containing index subscripts which
   span the region of interest.

   As of version 6.0.0, this can be of type integer or long.

Description

   Finds the first and last indices (subscripts) of two-dimensional
   lat2d/lon2d arrays containing the region of interest.

   Note: This function may not be appropriate for all curvilinear grids.

See Also

   ind,ind_resolve

Examples

   Example 1

   Find the indices (subscripts) which span a user specified region of
   interest.
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
       ;
       ;
  f     = addfile("NARRmonhr-b_221_20021201_2100_000.grb" , "r")

  glon2d =  f->gridlon_221
  glat2d =  f->gridlat_221

  printMinMax(glat2d, True)
  printMinMax(glon2d, True)

  latS   = 30                      ; California [*rough*]
  latN   = 43
  lonW   = -125
  lonE   = -113

  ji = region_ind (glat2d,glon2d, latS, latN, lonW, lonE)

  jStrt = ji(0)      ; lat start
  jLast = ji(1)      ; lat last
  iStrt = ji(2)      ; lon start
  iLast = ji(3)      ; lon last

  LAT2D = glat2d(jStrt:jLast,iStrt:iLast)
  LON2D = glon2d(jStrt:jLast,iStrt:iLast)

  printMinMax(LAT2D, True)
  printMinMax(LON2D, True)

                      ; read data just for the region of interest
  x     = f->LHTFL_221_SFC_113(:,jStrt:jLast,iStrt:iLast)


   The (edited) output
(0)     glat2d: min=   0.898   max= 85.334
(0)     glon2d: min=-179.998   max=179.992

(0)     LAT2D : min=  28.680   max=  44.247
(0)     LON2D : min=-128.941   max=-111.976

   Example 2

   The following is from a user question:

   Say I've got a 2-D array (lat/lon) that has a blob of data in the
   middle surrounded by missing values. Is there an NCL function that will
   automatically crop or trim that array to the edges of the data, thereby
   getting rid of the surrounding cells of missing data?

   Another user responded as follows:

   Although it won't eliminate every missing value, this simple function
   should crop the array to the smallest rectangular region that includes
   all of the non-missing data:
   undef("crop2D")
   function crop2D(x[*][*]:numeric)
   local i
   begin
     i = ind_resolve(ind(.not.ismissing(ndtooned(x))),dimsizes(x))
     x_crop = x( min(i(:,0)):max(i(:,0)), min(i(:,1)):max(i(:,1)) )
     return(x_crop)
   end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

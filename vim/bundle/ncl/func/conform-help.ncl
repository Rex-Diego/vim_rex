THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/conform.shtml
THE_TITLE:conform
   NCL Home > Documentation > Functions > Array manipulators

conform

   Expands an array or scalar so that it conforms to the shape of the
   given variable.

Prototype

        function conform (
                x     ,
                r     ,
                ndim  : integer
        )

        return_val [dimsizes(x)] :  typeof(r)

Arguments

   x

   An array of any dimensionality.
   r

   A scalar or an array whose dimensions must be a subset of any of the
   dimensions of x.
   ndim

   An array of dimension indexes to indicate which dimensions of x match
   the dimensions in r. Dimension numbering starts at the left and must be
   increasing. The leftmost dimension index is 0, the next dimension index
   is 1, and so on. If r is a scalar, then ndim can have the special value
   of -1 (see below).

Description

   Note: it may be preferable to use the conform_dims function. This
   function takes as its first argument the dimension sizes of the new
   array you want to conform to, rather than the array itself.

   This function will create a new variable that has the same
   dimensionality as x and the same type as r. The values of r will be
   copied to all of the other dimensions.

   If r is a scalar and ndims is -1, then the scalar value will be copied
   to all elements of a new array of the same size as x.

   One use of this function is to create a new (and often temporary)
   variable so that it can be used for something like multiplication
   between two variables.

   The conform function is designed to merge values from two pre-existing
   arrays. It can not be used to duplicate an array multiple times. Use
   the conform_dims function, or else use an (inefficient) loop. For
   example, if you have an array that you want to create K copies of and
   put in a new variable, then you can do:

  xCopy = conform_dims((/K,N,M/), x, (/1,2/))

   or use NCL's new and typeof functions:
    xCopy = new ( (/K,N,M/), typeof(x))
    do k=0,K-1
       xCopy(k,:,:) = x
    end do

   This function was updated in NCL version 5.1.0 to allow strings as
   types for the first two input arguments.

See Also

   conform_dims, reshape, reshape_ind

Examples

   Example 1

   If you have a 3D array x with sizes ntim x nlat x mlon and an array t
   of length ntim, then the following line:
    tConform = conform (x,t,0)

   will yield an array tConform that is dimensioned ntim x nlat x mlon
   where the contents of t are propagated to all dimensions of x.

   Example 2

   Assume you have a 4D array x with named dimensions "time", "lev", "lat"
   and "lon" and dimensioned ntim x klvl x nlat x mlon. Assume you also
   have a 2D array dp of size ntim x klvl, and that you want to reorder x
   to be ntim x nlat x nlon x klev.

   You can use conform to work on the reordered grid, in which the ndim
   arguments refer to the reordered grid:

    dpC = conform (x(time|:,lat|:,lon|:,lev|:), dp, (/0,3/))

   The dpC array will be dimensioned ntim x nlat x mlon x klvl.

   Example 3

   Assume T is a 4D array with dimensions ntim x klvl x nlat x mlon and dp
   is an array of length klvl. If you want to compute the column pressure
   weighted mean temperature at all times, then use:
  dpC = conform(T, dp, 1)  ; => (ntim,klvl,nlat,mlon)
  T_wgtAve = dim_sum(T*dpC)/dim_sum(dpC)

   Example 4

   The conform function can easily be used for integration when combined
   with other functions like dim_sum. Remember that any values that match
   the _FillValue attribute will be omitted from the sum.

   For example, if you have an array q dimensioned nt x ny x nx x nz and
   an array dz of length nz, then use:
  qInt = dim_sum(q*conform(q,dz,3))  ; qInt(nt,ny,nx)

   If you have an array x dimensioned ntim x nlev x nlat x nlon and an
   array dp of length lev, and you want to use dimension reordering:
  xLev = x(time|:,lat|:,lon|:,lev|:)   ; reorder so lev is rightmost
  xInt = dim_sum( xLev*conform(xLev, dp, 3 )) ; xInt(ntim,nlat,mlon)
  delete (xLev)                        ; only needed on a temporary basis

   Example 5

   If x is dimensioned ntim x nlat x nlon, and w is of length nlat and
   contains gaussian weights or the cosine of the latitude, then to
   perform a weighted average, use:
  sw   = sum(w)                                 ; sum all weights
  xTmp = x(time|:,lon|:,lat|:)                  ; temporary array
  xHov = dim_sum(xTmp, conform(xTmp,w,2) )/sw   ; xHov(ntim,mlon)
  delete (xTmp)

   If lat and lon are coordinate arrays associated with x, then coordinate
   subscripting can be used to select a subset of the data.

   For example, assume the region defined by 90E-270E and 30N-60N is of
   interest:
  latS = 30.    ; for clarity put ranges in variables
  latN = 60.    ; this also facilitates possible future changes
  lonE = 90.
  lonW = 270.

  sw   = sum(w({latS:latN}))            ; sum only weights appropriate
                                        ; for the range being used

  xTmp = x(time|:,{lon|lonE:lonW},{lat|latS:latN})
  xHov = dim_sum(xTmp, conform(xTmp,w({latS:latN}),2))/sw  ; xHov(ntim,mlon)

   Example 6

   Assume you have two grids grid1 and grid2 dimensioned ntim x nlat x
   nlon, where ntim is the number of different grids. To get a pattern
   correlation based on gaussian weights or cosine-of-latitude, where
   wgt(nlat) is the weight for each latitude, use the escorc function:
   wNew = ndtooned( conform(grid1, wgt, 2) )

   r = new ( ntim, typeof(grid1) )

   do nt=0,ntim-1
      r(nt) = escorc(ndtooned(grid1(nt,:,:))*wNew,ndtooned(grid2(nt,:,:))*wNew)
   end do

   Example 7

   Assume x is dimensioned ntim x klev x nlat mlon, and that s is a
   scalar. Then the statement:
   xsALL = conform(x, s, -1)

   will create an array xsAll dimensioned ntim x klev x nlat x mlon with
   every element set to s.

   Example 8

   Compute the weighted areal average iat each time and level for T(Time,
   bottom_top, south_north, west_east) using the simple cosine of the
   latitude, here, XLAT(Time, south_north, west_east). The example is WRF
   data.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

    f    = addfile("wrfout_d01_000000.nc", "r")
    T = f->T                           ; (25, 27, 81, 90)
    clat = f->XLAT(0,:,:)                      ; (81, 90)
    cwgt = cos(0.01745329*clat)        ; (81, 90)

    dimT = dimsizes(T)
    ntim = dimT(0)
    klev = dimT(1)

    wsum = sum(cwgt)
    Twgt = new ( (/ntim,klev/) , typeof(T), getVarFillValue(T))

    do nt=0,ntim-1
      do kl=0,klev-1
         Twgt(nt,kl) = sum(T(nt,kl,:,:)*cwgt)/wsum
      end do
    end do
    copy_VarMeta(T, Twgt)
    print(Twgt)

   The above produces

Variable: Twgt
Type: float
Total Size: 2700 bytes
            675 values
Number of Dimensions: 2
Dimensions and sizes:   [Time | 25] x [bottom_top | 27]
Coordinates:
Number Of Attributes: 6
  stagger :
  units :       K
  description : perturbation potential temperature (theta-t0)
  MemoryOrder : XYZ
  FieldType :   104
  _FillValue :  -999
(0,0)   -6.996241
(0,1)   -4.767268
(0,2)   -2.842787
(0,3)   -1.192483
(0,4)   0.229194
(0,5)   1.300664
(0,6)   2.470911
(0,7)   4.1338
(0,8)   6.054388
(0,9)   8.339536
(0,10)  11.13617
(0,11)  13.89123
(0,12)  16.63777
(0,13)  19.96977
(0,14)  22.83082
(0,15)  25.32654
(0,16)  27.35651
(0,17)  29.55136
(0,18)  31.52806
(0,19)  36.67001
(0,20)  49.73418
(0,21)  68.90263
(0,22)  87.66518
(0,23)  106.7193
(0,24)  130.8514
(0,25)  158.7196
(0,26)  192.2489
(1,0)   -6.356514
(1,1)   -4.663289
(1,2)   -2.846265
(1,3)   -1.206751
[SNIP]

   Example 9

   Compute the global weighted areal average temperature at each time and
   level a POP grid. Then compute the same for user specified regions. POP
   files come with the area of each grid cell.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

    f     = addfile("TEMP.nc", "r")
    t     = f->TEMP                     ; (time, z_t, nlat, nlon)
    tarea = f->TAREA                    ; (nlat, nlon)

    dimt = dimsizes(t)
    ntim = dimt(0)
    kz   = dimt(1)

; Global averages at each time and depth

    wsum = sum(tarea)
    twg  = new ( (/ntim,kz/) , typeof(t), getVarFillValue(t))

    do nt=0,ntim-1
      do k=0,kz-1
         twg(nt,k) = sum(t(nt,k,:,:)*tarea)/wsum
      end do
    end do
    copy_VarMeta(t, twg)
    twg@long_name = "Global Avg: "+t@long_name

    print(twg)          ; [time] x [z_t]

; Regional averages

    regmsk = f->REGION_MASK       ; (nlat, nlon)

    region = (/ 1, 2, 3, 6 /)     ; specify desired
    nreg   = dimsizes(region)
    twr  = new ( (/ntim,kz,nreg/) , typeof(t), getVarFillValue(t))

    do nr=0,nreg-1
       treg  = mask(t    , regmsk.ne.region(nr), False)
       areg  = mask(tarea, regmsk.ne.region(nr), False)
       wsum  = sum(areg)
       if (.not.ismissing(wsum) .and. wsum.gt.0.0) then
           do nt=0,ntim-1
             do k=0,kz-1
                twr(nt,k,nr) = sum(treg(nt,k,:,:)*areg)/wsum
             end do
           end do
       end if
    end do

    copy_VarMeta(t(:,:,0,0), twr(:,:,0))
    twr!2 = "region"
    twr&region = region

    print(twr)             ; [time] x [z_t] x [region]



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

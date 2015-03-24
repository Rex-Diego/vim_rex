THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/grid2triple.shtml
THE_TITLE:grid2triple
   NCL Home > Documentation > Functions > Array manipulators

grid2triple

   Converts a two-dimensional grid with one-dimensional coordinate
   variables to an array where each grid value is associated with its
   coordinates.

Prototype

        function grid2triple (
                x    [*] : numeric,
                y    [*] : numeric,
                z [*][*] : numeric
        )

        return_val [3][*] :  float or double

Arguments

   x

   Coordinates associated with the right dimension of the variable z. It
   must be the same dimension size (call it mx) as the right dimension of
   z.
   y

   Coordinates associated with the left dimension of the variable z. It
   must be the same dimension size (call it ny) as the left dimension of
   z.
   z

   Two-dimensional array of size ny x mx containing the data values.
   Missing values (i.e. z@_FillValue) may be present in z, but they are
   ignored.

Return value

   If any argument is "double" the return type will be "double"; otherwise
   a "float" is returned.

Description

   The maximum size of the returned array will be 3 x ld where ld <=
   ny*mx. If no missing values are encountered in z, then ld=ny*mx. If
   missing values are encountered in z, they are not returned and hence ld
   will be equal to ny*mx minus the number of missing values found in z.
   The return array will be double if any of the input arrays are double,
   and float otherwise.

   Assuming D represents the return array, then if no missing values are
   present:

     D(0,0) = x(0)  ,   D(1,0) = y(0)   ,   D(2,0) = z(0,0)
     D(0,1) = x(1)  ,   D(1,1) = y(1)   ,   D(2,1) = z(0,1)
     D(0,2) = x(2)  ,   D(1,2) = y(2)   ,   D(2,2) = z(0,2)
                              etc.

   This function is useful for preparing gridded input for some of the
   interpolation routines that recognize missing values, such as cssgrid,
   natgrid, dsgrid2, etc.

   For more robust regridding, see the ESMF regridding examples, which
   show how to regrid data from and to rectilinear, curvilinear, or
   unstructured grids. Available in version 6.1.0 and later.

See Also

   ESMF_regrid, triple2grid, triple2grid2d

Examples

   Example 1

   Assume lon (size mx) and lat (size ny) are one-dimensional arrays
   containing the coordinates of a two-dimensional grid T dimensioned ny x
   mx. Further, assume T has 50 missing values (T@_FillValue) present.

   Assume you want to Interpolate T to a new grid with no missing values
   present. The new grid will have output grid points (LAT,LON) as
   described by the cssgrid documentation.

    d    = grid2triple (lon,lat,T)   ; d(3,ld) , ld = ny*mx - 50
    Tnew = cssgrid (d(1,:), d(0,:), d(2,:), LAT,LON)

   If it is desired to interpolate the original grid to a new grid, but
   retain the missing values, then use the linint2 function.

   Example 2

   Same as example 1, but assume you want to interpolate to the same
   lat/lon grid and fill-in the missing values:
   d    = grid2triple (lon,lat,T)   ; d(3,ld) , ld = NY*MX - 50
   Tnew = cssgrid (d(1,:), d(0,:), d(2,:), lat,lon)

   At this point, values of Tnew may be slightly different from the input
   values at original grid locations that had non-missing data. Now you
   can use the functions ndtooned, ind and onedtond to overwrite the
   interpolated values with the non-missing original values:
   T1D    = ndtooned(T)                ; original grid
   Tnew1D = ndtooned(Tnew)             ; interpolated grid
   indx   = ind(.not.ismissing(T1D))   ; index all non-msg values of T
   Tnew1D(indx) = T1D(indx)            ; force original non-msg values back
   Tnew   = onedtond(Tnew1D, dimsizes(T))  ; back to 2D

   An alternative approach uses the mask function and tricks with
   _FillValue:
   Tnew = mask (Tnew, ismissing(T),True) ; mask only values missing
                                         ; in original array (T)
   Tnew@FillValue = 0.0                  ; set all missing to zero
   delete (Tnew@_FillValue)

   T@_FillValue = 0.0                    ; set original msg to 0.0
   delete (T@_FillValue)

   Tnew = Tnew + T                       ; addition identity

   Example 3

   Consider x(time,N,M); xtbin(M) and ytbin(N) and it is desired to bin
   all the time steps.
  ntim = dimsizes(x&time)

  GBIN  = new ( (/N,M/), double,   1d20 )
  GKNT  = new ( (/N,M/), integer, -999 )

  GBIN  = 0.0                      ; initialization
  GKNT  = 0


  NM   = N*M
  DAT3 = new( (/3,ntim*NM/), typeof(xt))
  ntStrt = 0
  ntLast = NM-1
  do nt=0,ntim-1
     dat3 = grid2triple(xt, yt, data(nt,:,:) )

     DAT3(0,ntStrt:ntLast) = dat3(0,:)
     DAT3(1,ntStrt:ntLast) = dat3(1,:)
     DAT3(2,ntStrt:ntLast) = dat3(2,:)

     ntStrt = ntStrt+NM
     ntLast = ntLast+NM
  end do

  bin_sum(GBIN,GKNT,xtbin,ytbin,DAT3(0,:),DAT3(1,:),DAT3(2,:) )
  delete( [/ DAT3, dat3 /] )         ; no longer needed
                                     ; avoid division by 0.0
  GKNT = where(GKNT.eq.0 , GKNT@_FillValue, GKNT)
  GBIN = GBIN/GKNT



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

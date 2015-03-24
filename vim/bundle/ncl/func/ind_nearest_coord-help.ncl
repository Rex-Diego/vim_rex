THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/ind_nearest_coord.shtml
THE_TITLE:ind_nearest_coord
   NCL Home > Documentation > Functions > Array query

ind_nearest_coord

   Determine indices of locations closest to a coordinate array.

   [new.gif] Available in version 4.3.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function ind_nearest_coord (
                z      [*] : numeric,
                zcoord [*] : numeric,
                iopt   [1] : integer
        )

Arguments

   z

   A one-dimensional (1D) numeric array containing locations of
   observations. The locations may be random.
   zcoord

   A one-dimensional (1D) numeric array containing monotonically
   increasing or decreasing values.
   iopt

   An integer argument. Currently, not used. Set to zero.

Return value

   For each z location return the index of zcoord corresponding to the
   minimum distance.

Description

   The index corresponding the minimum absolute distance of each z to the
   zcoord coordinate array is determined.

See Also

   local_min_1d, local_max_1d, minind, maxind

Examples

   Example 1: Given a set of random latitudes, determine the indices of
   the nearest coordinate variable.
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

            ; coordinate array
            ; monotonically increasing but decreasing coordinate are acceptable
  lat = (/ -59.99, -57.95, -55.91, -53.87, -51.83, -49.79, \
           -47.76, -45.73, -43.70, -41.69, -39.64, -37.62, \
           -35.59, -33.57, -31.55, -29.54, -27.53, -25.52, \
           -23.51, -21.50, -19.50, -17.50, -15.50, -13.50, \
           -11.50,  -9.50,  -7.53,  -5.70,  -4.08,  -2.72, \
            -1.60,  -0.65,   0.21,   1.10,   2.13,   3.37, \
             4.86,   6.60,   8.51,  10.50,  12.50,  14.50, \
            16.50,  18.50,  20.51,  22.51,  24.51,  26.53, \
            28.53,  30.55,  32.57,  34.59,  36.60,  38.62, \
            40.65,  42.68,  44.71,  46.75,  48.78,  50.82, \
            52.85,  54.89,  56.93,  58.97                  /)

            ; random latitudes
  rlat = (/ -1.5, 45., -70, 25.2, 62., -42.1 /)

  i_rlat = ind_nearest_coord (rlat, lat, 0)

  print("i="+i_rlat+"  rlat="+rlat+"  lat(i)="+lat(i_rlat))

   The results are:

(0)     i=30  rlat=-1.5  lat(i)= -1.6
(1)     i=56  rlat=45    lat(i)= 44.71
(2)     i=0   rlat=-70   lat(i)=-59.99            <= set to nearest coord
(3)     i=46  rlat=25.2  lat(i)= 24.51
(4)     i=63  rlat=62    lat(i)= 58.97            <= set to nearest coord

(5)     i=9   rlat=-42.1 lat(i)=-41.69

   Example 2: Let x(time,lev,lat,lon). Each dimension is a coordinate
   variable. These coordinate variables may be monotonically increasing or
   decreasing.
  rlat = (/ -1.5,  45.0, -70  , 25.2,  62. , -42.1 /)
  rlon = (/ 37.9, 172.2,  92.3,292.8, 345.7,  17.3 /)
  jlat = ind_nearest_coord (rlat, lat, 0)
  ilon = ind_nearest_coord (rlon, lon, 0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

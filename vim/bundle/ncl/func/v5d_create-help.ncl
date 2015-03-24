THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/v5d_create.shtml
THE_TITLE:v5d_create
   NCL Home > Documentation > Functions > File IO

v5d_create

   Creates a Vis5D+ format file.

Prototype

        procedure v5d_create (
                fname     [1] : string,
                numtimes  [*] : integer,
                numvars   [*] : integer,
                nr        [*] : integer,
                nc        [*] : integer,
                nl        [*] : integer,
                varname   [*] : string,
                timestamp [*] : integer,
                datestamp [*] : integer,
                compress      : integer,
                projection    : integer,
                proj_args [*] : numeric,
                vertical      : integer,
                vert_args [*] : numeric
        )

Arguments

   fname

   The name of the Vis5D+ format file to create

   numtimes

   Number of timesteps (at least 1)

   numvars

   Number of variables (at least 1)

   nr

   Number of rows in all 3-D grids (at least 2)

   nc

   Number of columns in all 3-D grids (at least 2)

   varname

   Array of variable names:
    varname(0) = name of first variable
    varname(1) = name of second variable
    ...
    varname(numvars-1) = name of last variable

   timestamp

   Array of time labels for the timesteps in HHMMSS format:
    timestamp(0) = time of first timestep
    timestamp(1) = time of second timestep
    ...
    timestamp(numtimes-1) = time of last timestep

   datestamp

   Array of date labels for the timesteps in YYDDD format
    datestamp(0) = date of first timestep
    datestamp(1) = date of second timestep
    ...
    datestamp(numtimes-1) = date of last timestep

   nl

   Number of levels in the 3-D grids per variable:
    nl(0) = number of levels for first variable
    nl(1) = number of levels for second variable
    ...
    nl(numvars-1) = number of levels for last variable

   compress

   Compression mode (1, 2 or 4 bytes per grid point)

   projection

   Indicates type of map projection:
    0 = linear, rectangular, generic units
    1 = linear, rectangular, cylindrical-equidistant
    2 = Lambert Conformal
    3 = Stereographic
    4 = Rotated

   proj_args

   Projection arguments:
    if projection = 0 then
        proj_args(0) = North boundary of 3-D box
        proj_args(1) = West boundary of 3-D box
        proj_args(2) = Increment between rows
        proj_args(3) = Increment between columns

    else if projection = 1 then

        proj_args(0) = North Latitude bound of 3-D box
        proj_args(1) = West Longitude bound of 3-D box
        proj_args(2) = Increment between rows in degrees
        proj_args(3) = Increment between cols in degrees

    else if projection = 2 then

        proj_args(0) = Standard Latitude 1
        proj_args(1) = Standard Latitude 2
        proj_args(2) = Row of North/South pole
        proj_args(3) = Column of North/South pole
        proj_args(4) = Longitude parallel to columns
        proj_args(5) = Increment between columns in km

    else if projection = 3 then

        proj_args(0) = Latitude of center (degrees)
        proj_args(1) = Longitude of center (degrees)
        proj_args(2) = Row of center of projection
        proj_args(3) = Column of center of projection
        proj_args(4) = Spacing between columns at center

    else if projection = 4 then

        proj_args(0) = North boundary on rotated sphere
        proj_args(1) = West boundary on rotated sphere
        proj_args(2) = Increment between rows
        proj_args(3) = Increment between columns
        proj_args(4) = Earth Latitude corresponding to (0,0)
        proj_args(5) = Earth Longitude corresponding to (0,0)
        proj_args(6) = Rotation angle

    endif

   vertical

   Indicates type of vertical coordinate system:
    0 = equally spaced levels in generic units
    1 = equally spaced levels in km
    2 = unequally spaced levels in km
    3 = unequally spaced levels in mb

   vert_args

   Vertical coordinate system arguments:
    if vertical = 0 then

        vert_args(0)   = height of bottom level
        vert_args(1)   = spacing between levels

    else if vertical = 1 then

        vert_args(0)   = height of bottom level in km
        vert_args(1)   = spacing between levels in km

    else if vertical = 2 then

        vert_args(0)   = height (km) of grid level 1 (bottom)
        vert_args(1)   = height (km) of grid level 2
        ...
        vert_args(N-1) = height (km) of grid level N (top)
        where N is the maximum value in the nl array.

    else if vertical = 3 then

        vert_args(0)   = pressure (mb) of grid level 1 (bottom)
        vert_args(1)   = pressure (mb) of grid level 2
        ...
        vert_args(N-1) = pressure (mb) of grid level N (top)
        where N is the maximum value in the nl array.

    endif

Description

   v5d_create()
   creates a file in the Vis5D+ format, named fname, for writing 3-D
   gridded data.

   The v5d_create()
   function allow you to control how the gridded data is compressed. The
   default is for grid values to be linearly scaled to one byte integers.
   This works very well for most datasets, since the scaling factors are
   chosen independently for each combination of time step, variable and
   vertical level. However, the compress argument of the v5d_create()
   function lets you pick whether grid point values are scaled to 1-byte
   integers, scaled to 2-byte integers, or left as 4-byte floating point
   values (no compression). It is recommended that you try compression to
   1-byte integers first, and only use 2 or 4 bytes if you have precision
   problems at 1-byte.

   The product of the number of rows, columns, levels, timesteps, and
   variables is the total number of data points. In the example below: 30
   * 40 * 20 * 5 * 1 = 120,000. A real dataset may be much larger.

   The data must be a 3-D array of grid values where the number of values
   to write is equal to nr * nc * nl(var), ordered as:
     data[row + nr * (col + nc * lev)]

   where row increases from North to South, col(umn) increases from West
   to East, and lev(el) increases from bottom to top.

   You may specify any map projection, vertical coordinate system, and a
   different number of grid levels for each physical variable. To specify
   a map projection, you must set the value of projection to 0, 1, 2 or 3
   to indicate which projection, then specify the projection-dependent
   parameters in the proj_args array. Specifying the vertical coordinate
   system is done similarly. For more information, see the Vis5D+
   documentation regarding map projections and vertical coordinate
   systems.

   It is sometimes useful to specify a different number of grid levels for
   each variable. For example, suppose most of your variables have 30 grid
   levels but some variables have fewer grid levels, perhaps only one.
   With the v5d_create()
   function you can specify how many grid levels are present for each
   physical variable with the nl array parameter (you can also specify a
   different number of grid levels with the v5d_setLowLev() function). Be
   aware that the amount of data passed to the v5d_write() call will
   depend on which variable you're writing. For example, if your grid has
   nc columns and nr rows, then the number of values in the data array
   passed to v5d_write() for variable V must equal nc * nr * nl(V).

   For further information on Vis5D+ and file formats, see documentation
   at the Vis5D website.

See Also

   v5d_write, v5d_write_var, v5d_close, v5d_setLowLev, and v5d_setUnits.

Examples


  Assignment        Comments

  numtimes = 5      ; 5 time steps
  numvars = 1       ; 1 physical variable
  nr = 30           ; 30 rows in each 3-D grid
  nc = 40           ; 40 columns in each 3-D grid
  nl = 20           ; 20 levels in each 3-D grid

  myData = new((/nr, nc, nl/), "float")    ; data placeholder
  ;; populate data

  ;; times: 2:00:00pm through 3:00:00pm, 15min. increments
  timestamp = (/140000, 141500, 143000, 144500, 146000/)

  ;; date: YYDDD -- 1994, 36th day
  datestamp = (/94036, 94036, 94036, 94036, 94036/)

  compress = 1      ; 1 byte per grid

  northlat = 60.0   ; Northern boundary of box is at 30 degrees latitude
  latinc = 1.0      ; There is 1 degree of latitude between each of the 30 rows
  westlon = 100.0   ; Western boundary of 3-D box is at 100 degrees longitude
  loninc = 0.5      ; 0.5 degree of longitude between each of the 40 columns

  projection = 1    ; linear, rectangular, cylindrical-equidistant
  proj_args = (/northlat, westlon, latinc, loninc/)

  bottomhgt = 0.0   ; Bottom of box is at 0km (sea level)
  hgtinc = 1.0      ; 1 km between each of the 20 grid levels (top at 19.0km)

  vert = 1          ; equally spaced levels, km
  vert_args = (/bottomhgt, hgtinc/)

  v5d_create("UVdata.v5d", numtimes, numvars, nr, nc, nl, (/"myData"/), timestam
p,
           datestamp, compress, proj, proj_args, vert, vert_args)

      [fill the 3-D grid, from NW bottom corner: grid(0, 0, 0)
       to the SE upper corner: grid(nr -1, nc -1, nl - 1)]

  v5d_write(numtimes, 1, myData)

  v5d_close()



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

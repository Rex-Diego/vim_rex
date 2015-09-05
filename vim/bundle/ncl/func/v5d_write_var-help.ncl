THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/v5d_write_var.shtml
THE_TITLE:v5d_write_var
   NCL Home > Documentation > Functions > File IO

v5d_write_var

   Writes a single 3-dimensional gridded variable to a Vis5D+ format file.

Prototype

        procedure v5d_write_var (
                data [*][*][*] : float
        )

Arguments

   data

   A 3-dimensional float array of gridded data values.

Description

   v5d_write_var()
   writes data to a file in the Vis5D+ format. The data must be a 3-D
   array of grid values where the number of values to write is equal to nr
   * nc * nl(var), ordered as:
     data[row + nr * (col + nc * lev)]

   where row increases from North to South, col(umn) increases from West
   to East, and lev(el) increases from bottom to top.

   The data is written in a compressed format. See the documentation for
   v5d_create for a discussion of how to best utilize compression settings
   for your data.

   For further information on Vis5D+ and file formats, see documentation
   at the Vis5D website.

See Also

   v5d_create, v5d_write, v5d_close, v5d_setLowLev, v5d_setUnits

Examples


  Assignment        Comments

  numtimes = 5      ; 5 time steps
  numvars = 1       ; 1 physical variable
  nr = 30           ; 30 rows in each 3-D grid
  nc = 40           ; 40 columns in each 3-D grid
  nl = 20           ; 20 levels in each 3-D grid

  ...
  initialData = new((/nl, nc, nr/), "float")
  v5d_create(..., numvars, nr, nc, nl, (/"initialData"/) ...)
  ...
  v5d_write(i, 1, initialData)
  ...

  moreData = new((/nl, nc, nr/), "float")

;; [fill the 3-D grid, from NW bottom corner: grid(0, 0, 0)
;;  to the SE upper corner: grid(nr -1, nc -1, nl - 1)]

  v5d_write_var(moreData)
  v5d_close()


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

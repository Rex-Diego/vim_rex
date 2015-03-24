THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/v5d_setLowLev.shtml
THE_TITLE:v5d_setLowLev
   NCL Home > Documentation > Functions > File IO

v5d_setLowLev

   Sets the lowest vertical offset, in grid level, for each 3-dimensional
   gridded variable in a Vis5D+ format file.

Prototype

        procedure v5d_setLowLev (
                lowLev [*] : integer
        )

Arguments

   lowLev

   An array of integers of size numvars

lowLev(1) = offset for first variable
lowLev(2) = offset for second variable
...
lowLev(numvars-1) = offset for last variable

Description

   v5d_setLowLev()
   sets a lowest vertical offset, in grid level, for each data variable in
   a 3-D gridded dataset.

   By default, the bottom-most grid level of each variable is displayed at
   the bottom of the 3-D box; each grid extends upward for however many
   levels are present. Sometimes, however, the bottom-most grid level of a
   particular variable is best positioned higher up in the grid. An
   example of this might be a combined ocean/atmosphere dataset. There may
   be a total of 18 grid levels, the bottom 8 grid levels being ocean data
   and the top 10 grid levels being atmospheric data. In this case, the
   bottom of the atmospheric data is best offset, or shifted upward, by 8
   grid levels.

   Elaborating on the ocean/atmosphere example, suppose we have two ocean
   variables named S (salinity) and T[o] (ocean temperature), and two
   atmosphere variables named P (pressure) and T[a] (atmospheric
   temperature). Further suppose there are 8 layers of ocean data and 10
   layers of atmospheric data. Below is a summary showing how the
   v5d_setLowLev()
   function can address this situation:

varnum  varname(varnum)     nl(varnum)  lowlev(varnum)
  1            S                 8            0
  2            To                8            0
  3            P                10            8
  4            Ta               10            8

   v5d_setLowLev()
   may be called at any point between v5d_create and v5d_write().

   For further information on Vis5D+ and file formats, see documentation
   at the Vis5D website.

See Also

   v5d_create, v5d_write, v5d_write_var, v5d_close, and v5d_setUnits.

Examples


  Assignment        Comments

  numvars = 1       ; 1 physical variables
  lowLevels = new(/3, 4, 8/)
  ...
  v5d_create(...)
  v5d_setLowLev(lowLevels)

  v5d_write(...)
  v5d_close()



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

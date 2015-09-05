THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filedimdef.shtml
THE_TITLE:filedimdef
   NCL Home > Documentation > Functions > File IO

filedimdef

   Defines dimension names, dimension sizes, unlimited dimensions on a
   supported file.

Prototype

        procedure filedimdef (
                thefile       [1] : file,
                dim_names     [*] : string,
                dim_sizes     [*] : integer or long,
                dim_unlimited [*] : logical
        )

Arguments

   thefile

   The reference to the file that you want to write the dimensions to.
   This reference must be created by the addfile function.
   dim_names

   An array of dimension names you want to write to thefile.
   dim_sizes

   An array of dimension sizes of the dimensions you want to write to
   thefile.

   As of version 6.0.0, this can be of type long, allowing dimension sizes
   greater than or equal to 2 gigabytes (GB) on 64-bit systems.
   dim_unlimited

   An array of logical values indicating whether the corresponding
   dimensions are unlimited in size.

   Note that netCDF only allows one unlimited dimension, and it must be
   the leftmost dimension of every variable you write to the file.

Description

   The filedimdef procedure is used to pre-define dimensions in a file.
   The supported file must have been opened as either read/write ("w") or
   create ("c").

   The fourth argument allows the dimension to be defined as unlimited.
   Currently, netCDF files only allow one dimension to be unlimited, and
   this dimension must be the leftmost dimension of your variable.
   Unlimited dimensions can grow while normal dimensions can not. A
   typical use of unlimited dimensions is to create a data from multiple
   input files. For unlimited dimensions the size value is ignored.
   Unlimited dimensions have a size of 0 until a variable with the
   unlimited dimension name is assigned to the file.

   Using this procedure is much more efficient than writing a variable's
   dimensions one at a time. See an example of how to use this function
   and other functions for efficient writing of netCDF files.

See Also

   fileattdef, filevarattdef, filevardef, filedimdef

Examples

   Write dimensions "lon", "lat", "lev, and "time" to a netCDF file, with
   "time" being an unlimited dimension:
  ncf = addfile("myfile.nc","c")
;
; Define dimensions.
;
  nlon =  64
  nlat = 128
  nlev =  10
  ntim =  -1

  dim_names = (/ "lon",  "lat",  "lev", "time" /)
  dim_sizes = (/ nlon ,  nlat ,  nlev ,  ntim  /)
  dimUnlim = (/ False , False,  False ,  True  /)
  filedimdef( ncf, dim_names, dim_sizes, dimUnlim )

   "ncdump myfile.nc" produces the following output:
netcdf myfile {
dimensions:
        lon = 64 ;
        lat = 128 ;
        lev = 10 ;
        time = UNLIMITED ; // (0 currently)
}


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

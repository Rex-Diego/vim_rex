THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filechunkdimdef.shtml
THE_TITLE:filechunkdimdef
   NCL Home > Documentation > Functions > File IO

filechunkdimdef

   Defines chunking dimension names, dimension sizes, unlimited dimensions
   on a supported file.

Prototype

        procedure filechunkdimdef (
                thefile       [1] : file,
                dim_names     [*] : string,
                dim_sizes     [*] : integer or long,
                dim_unlimited [*] : logical
        )

Arguments

   thefile

   The reference to the file that you want to write to with chunking. This
   reference must be created by the addfile function.
   dim_names

   An array of chunking dimension names you want to write to thefile.
   dim_sizes

   An array of dimension sizes of the chunking dimensions you want to use
   thefile.

   As of version 6.0.0, this can be of type long, allowing dimension sizes
   greater than or equal to 2 gigabytes (GB) on 64-bit systems. But it is
   usually a fraction of the dimension size, such as half, quauter, etc.
   dim_unlimited

   This parameter does not apply for chunking, but we keep it here to make
   it has same argument-list as filedimdef.

   If there is unlimited dimension, it will be a good practice to set the
   leftmost chunking dimension to 1 (if it is a multi-dimension variable),
   as it is hard to predict how big this dimension will be.

Description

   The filechunkdimdef procedure is used to pre-define chunking dimensions
   in a file. The supported file must have been opened as either
   read/write ("w") or create ("c").

   Using this procedure is not to save writing time, but to save reading
   time, if later the variable is frequently partially read.

See Also

   filedimdef, filevarchunkdef

Examples

   Write dimensions "lon", "lat", "lev, and "time" to a netCDF file, with
   "time" being an unlimited dimension, then use chunk options to write
   variables in chunking.
  setfileoption("nc", "Format",  "NetCDF4Classic")

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

  mtim = 1
  mlat = nlat/2
  mlon = nlon/2
  mlev = nlev/2
  chunkSizes = (/ mtim, mlev, mlat, mlon /)
  dimUnlim(0) = False
  filechunkdimdef(fout,dimNames,chunkSizes,dimUnlim)

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

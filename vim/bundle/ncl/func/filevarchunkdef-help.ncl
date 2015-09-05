THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filevarchunkdef.shtml
THE_TITLE:filevarchunkdef
   NCL Home > Documentation > Functions > File IO

filevarchunkdef

   Defines a list of variable names, variable var_types, and variable
   dimension names for a supported file.

Prototype

        procedure filevarchunkdef (
                thefile         [1] : file,
                var_name        [1] : string,
                chunk_dim_sizes [*] : integer/long
        )

Arguments

   thefile

   The reference to the file that you want to define the variables in.
   This reference must be created by the addfile function.
   var_name

   Variable name on the file which will be written in chunking.
   chunk_dim_sizes

   An array of integer (or long) for each dimension.

Description

   This procedure defines the chunk size for a variable. The chunking
   dimension size must be less than variables dimension size. In practice,
   it will be half, quarter, etc. of the dimension sizes.

See Also

   filechunkdimdef, filedimdef, filevardef

Examples

   Example 1

   Write one 2D array and two 3D arrays (with dimension names "lev",
   "lat", and "lon") to a netCDF file called "myfile.nc":
  setfileoption("nc", "Format",  "NetCDF4Classic")
  f = addfile("myfile.nc","c")
  filedimdef(f,(/"lev","lat","lon"/),(/10,73,144/),(/False,False,False/))
  var_names2D = (/ "PS" /)
  var_names3D = (/ "T", "Q" /)
  varvar_types2D = (/ "float" /)
  varvar_types3D = (/ "float", "float" /)
  filevardef( f, var_names2D, varvar_types2D, (/  "lat", "lon" /) )
  filevardef( f, var_names3D, varvar_types3D, (/  "lev", "lat", "lon" /) )

  chunkSizes = (/5,37,72/)
  filevarchunkdef(f, "T", chunkSizes)

   "ncdump -h myfile.nc" produces the following output:
    netcdf myfile {
    dimensions:
            lev = 10 ;
            lat = 73 ;
            lon = 144 ;
    variables:
            float PS(lat, lon) ;
            float T(lev, lat, lon) ;
            float Q(lev, lat, lon) ;
    }


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

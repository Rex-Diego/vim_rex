THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filevarcompressleveldef.shtml
THE_TITLE:filevarcompressleveldef
   NCL Home > Documentation > Functions > File IO

filevarcompressleveldef

   Defines a list of variable names, variable var_types, and variable
   dimension names for a supported file.

Prototype

        procedure filevarcompressleveldef (
                thefile       [1] : file,
                var_name      [1] : string,
                compressLevel [1] : integer
        )

Arguments

   thefile

   The reference to the file that you want to define the variables in.
   This reference must be created by the addfile function.
   var_name

   Variable name on the file to be compressed.
   compressLevel

   An integer (1 - 9) to define the compress level.

Description

   This procedure defines the compress level for a variable.

Examples

   Example

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

 ;Define the chunking size
  chunkSizes = (/5,37,72/)
  filevarchunkdef(f, "T", chunkSizes)

 ;Define the compress level
  filevarcompressleveldef(f, "T", 3)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

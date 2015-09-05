THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filevardef.shtml
THE_TITLE:filevardef
   NCL Home > Documentation > Functions > File IO

filevardef

   Defines a list of variable names, variable types, and variable
   dimension names for a supported file.

Prototype

        procedure filevardef (
                thefile   [1] : file,
                var_names [*] : string,
                var_types [*] : string,
                dim_names [*] : string
        )

Arguments

   thefile

   The reference to the file that you want to define the variables in.
   This reference must be created by the addfile function.
   var_names

   An array of variable names that will appear on the file.
   var_types

   An array of types for each var_names.
   dim_names

   The set of dimensions which apply to all names in var_names .

Description

   This procedure defines one or more variables in a netCDF or HDF file to
   be created. var_names can contain multiple names of variables and
   var_types must contain a type for each variable name in var_names. All
   variables will be defined with the set of dimension names in dim_names.
   The dimensions must be in the order desired. The dimensions must also
   have been defined already either with the procedure filedimdef or by
   normal variable assignment.

See Also

   fileattdef, filedimdef, filevarattdef

Examples

   Example 1

   Write one 2D array and two 3D arrays (with dimension names "lev",
   "lat", and "lon") to a netCDF file called "myfile.nc":
  f = addfile("myfile.nc","c")
  filedimdef(f,(/"lev","lat","lon"/),(/10,73,144/),(/False,False,False/))
  var_names2D = (/ "PS" /)
  var_names3D = (/ "T", "Q" /)
  varvar_types2D = (/ "float" /)
  varvar_types3D = (/ "float", "float" /)
  filevardef( f, var_names2D, varvar_types2D, (/  "lat", "lon" /) )
  filevardef( f, var_names3D, varvar_types3D, (/  "lev", "lat", "lon" /) )

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

   Example 2

   Write float and integer scalars "c" and "i" to a netCDF file. NCL uses
   the reserved dimension name "ncl_scalar" to identify a scalar value.
    f = addfile("test.nc","c")

    filevardef(f, (/"c","i"/), (/"float","integer"/),"ncl_scalar")
    i    = 2
    c    = 3.14
    f->c = c        ; or f->c = 3.14
    f->i = i        ; or f->i = 2

   "ncdump test.nc" produces the following output:
    netcdf test {
    variables:
            float c ;
            int i ;
    data:

     c = 3.14 ;

     i = 2 ;
    }

   Note: it is not actually necessary to use filevardef to define a scalar
   on a file. You can also do it with :
    f    = addfile("test.nc","c")
    c    = 5
    c!0  = "ncl_scalar"
    f->c = c

   If "c" contains lots of attributes, then you may want to use a more
   efficient method for writing the scalar to a file:
   filevardef(f, "c", typeof(c), "ncl_scalar")
   filevarattdef(f,"c", c)   ; Copies c's attributes to a file.
   f->c =  (/c/)             ; "(/" and "/)" prevent the (re)writing of
                             ; c's attributes.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

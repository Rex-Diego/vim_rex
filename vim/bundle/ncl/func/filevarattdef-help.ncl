THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filevarattdef.shtml
THE_TITLE:filevarattdef
   NCL Home > Documentation > Functions > File IO

filevarattdef

   Copies attributes from an input variable to one or more variables on a
   supported file.

Prototype

        procedure filevarattdef (
                thefile [1] : file,
                varnames    : string,
                variable
        )

Arguments

   thefile

   The reference to the file that you want to write the variable
   attributes to. This reference must be created by the addfile function.
   varnames

   A list of file variable names to which you want to copy attributes.
   variable

   A variable, of any type, which contains one or more attributes to
   assign to the file variables listed in varnames.

Description

   This procedure copies attributes from the input variable to the output
   file variables, named by varnames. The variables in varnames must
   already be defined either through the procedure filevardef or through
   normal assignment.

See Also

   filedimdef, fileattdef, filevardef

Examples

   Write variables "gw" and "lat" to a netCDF file (with named dimension
   "lat"), and attach some attributes:
  ncf = addfile("myfile.nc","c")
;
; Define variable attributes.
;
  filedimdef(ncf , "lat", 73 , False)
  filevardef( ncf, "lat", "float", "lat" )
  latAtt=0
  latAtt@units     = "degrees_north"
  latAtt@long_name = "latitude"
  filevarattdef( ncf, "lat", latAtt )

  filevardef( ncf, "gw", "float", "lat" )
  gwAtt=0
  gwAtt@long_name  = "gauss weights"
  filevarattdef( ncf, "gw", gwAtt )

   "ncdump myfile.nc" produces the following output:
netcdf myfile {
dimensions:
        lat = 73 ;
variables:
        float lat(lat) ;
                lat:long_name = "latitude" ;
                lat:units = "degrees_north" ;
        float gw(lat) ;
                gw:long_name = "gauss weights" ;
data:

 lat = [snip ... all values]

 gw  = [snip ... all values]
}


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

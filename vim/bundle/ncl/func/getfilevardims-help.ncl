THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/getfilevardims.shtml
THE_TITLE:getfilevardims
   NCL Home > Documentation > Functions > File IO

getfilevardims

   Returns all dimension names associated with a variable on a supported
   file.

Prototype

        function getfilevardims (
                thefile [1] : file,
                varname [1] : string
        )

        return_val [*] :  string

Arguments

   thefile

   A reference to a file created from a call to addfile or addfiles. Thus,
   the file referenced must be one in the supported file format list.
   varname

   Single string name of variable.

Return value

   Returns a one dimensional array of dimension names for a file variable.
   getfilevardims returns a missing value if no dimension names exist or
   the variable is not defined.

Description

   Accesses dimension names of a user specified variable in a supported
   file format.

Examples

   Consider a netCDF file where "ncdump -h Tstorm.nc" yields:
netcdf Tstorm {
dimensions:
        timestep = 64 ;
        lat = 33 ;
        lon = 36 ;
        timelen = 20 ;
variables:
        float t(timestep, lat, lon) ;
                t:_FillValue = -9999.f ;
        int timestep(timestep) ;
        float lat(lat) ;
        float lon(lon) ;
        char reftime(timelen) ;
                reftime:units = "text_time" ;
                reftime:long_name = "reference time" ;
}

   To retrieve the dimension names of the variable "t" on the file, you
   can use the following code snippet:
   f     = addfile ("$NCARG_ROOT/lib/ncarg/data/cdf/Tstorm.cdf" , "r")
   dNames= getfilevardims(f,"t")
   print (dNames)

   This produces the output:
Variable: dNames
Type: string
Total Size: 12 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
(0)     timestep
(1)     lat
(2)     lon

   Note: you can also accomplish the above with the following code
   snippet:
   f     = addfile ("$NCARG_ROOT/lib/ncarg/data/cdf/Tstorm.cdf" , "r")
   dNames= getvardims(f->t)
   print (dNames)

   This is more inefficient, however, because the reference "f->t" causes
   the variable "t" to be read off the file. In using "getfilevardims",
   only the dimension names are read off the file.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

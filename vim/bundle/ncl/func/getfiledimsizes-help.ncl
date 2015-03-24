THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/getfiledimsizes.shtml
THE_TITLE:getfiledimsizes
   NCL Home > Documentation > Functions > File IO

getfiledimsizes

   Returns a list of dimension sizes of the given file variable.

Prototype

        function getfiledimsizes (
                thefile [1] : file
        )

        return_val [*] :  integer or long

Arguments

   thefile

   reference to a file opened with addfile.

Description

   Returns a list of dimension sizes for a file variable.

   As of version 6.0.0, this function will return type "long" if any of
   the individual file dimension sizes is greater than or equal to 2 GB.

See Also

   getvardims, getfiledimsizes, getfilevardimsizes, getfilevardims,
   getvardims, getfilevartypes, addfile

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

   To retrieve the sizes of named dimensions in the file, you can use the
   following code snippet:
   f      = addfile ("$NCARG_ROOT/lib/ncarg/data/cdf/Tstorm.cdf" , "r")
   dSizes = getfiledimsizes(f)
   print (dSizes)

   This produces the output:
Variable: dSizes
Type: integer
Total Size: 16 bytes
            4 values
Number of Dimensions: 1
Dimensions and sizes:   [4]
Coordinates:
(0)     64
(1)     33
(2)     36
(3)     20

   Also, if the associated dimension names are desired:
   dNames = getvardims(f)
   print(dSizes+"   "+dNames)

   would result in
(0)     64   timestep
(1)     33   lat
(2)     36   lon
(3)     20   timelen


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

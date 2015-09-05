THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isunlimited.shtml
THE_TITLE:isunlimited
   NCL Home > Documentation > Functions > Metadata routines

isunlimited

   Returns True if the given dimension name is defined as unlimited on the
   given file.

Prototype

        function isunlimited (
                thefile  [1] : file,
                dim_name [1] : string
        )

        return_val [dimsizes] :  logical

Arguments

   thefile

   Reference to a file opened with addfile or addfiles.
   dim_name

   Named dimension to check for being set to unlimited.

Description

   For the named dim_name dimension, isunlimited returns True if dim_name
   is defined as an unlimited dimension on the file thefile, and False
   otherwise. If thefile is not a valid file, or if dim_name is not a
   named dimension on the file, then a value of False is returned.

   An unlimited dimension is sometimes known as a record dimension. A
   variable with an unlimited dimension can grow to any length along that
   dimension. The unlimited dimension index is like a record number in
   conventional record-oriented files. A file can have at most one
   unlimited dimension (this may change in the future).

Examples

   Consider a netCDF file where "ncdump -h sstdata_netcdf.nc" yields:
netcdf sstdata_netcdf {
dimensions:
    longitude = 181 ;
    latitude = 91 ;
    time = UNLIMITED ; // (12 currently)
variables:
    float sst(time, latitude, longitude) ;
        sst:valid_range = -1.8f, 35.f ;
        sst:units = "deg_C" ;
        sst:_FillValue = -999.f ;
    float time(time) ;
        time:valid_range = 1.f, 12.f ;
        time:units = "Month" ;
        time:long_name = "Time" ;
    float lat(latitude) ;
        lat:units = "degrees_north" ;
        lat:long_name = "Latitude" ;
    float lon(longitude) ;
        lon:units = "degrees_east" ;
        lon:long_name = "Longitude" ;
}

   To determine if the named dimension time in the file is unlimited, you
   can use the following code snippet:
   f      = addfile ("$NCARG_ROOT/lib/ncarg/data/cdf/sstdata_netcdf.nc" , "r")
   if (isunlimited(f, "time"))
       ... ; True
   else
       ... ; False
   end if



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

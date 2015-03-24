THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filevardimsizes.shtml
THE_TITLE:filevardimsizes
   NCL Home > Documentation > Functions > File IO

filevardimsizes

   Returns the dimension sizes of variable on a supported file.

Prototype

        function filevardimsizes (
                thefile [1] : file,
                varname [1] : string
        )

        return_val [*] :  integer or long

Arguments

   thefile

   reference to a file. It is created using addfile or addfiles. Thus, it
   must be a supported file format.
   varname

   string name of variable whose dimension sizes are desired

Return value

   Returns a one dimensional array of dimension sizes for a file variable.
   In versions 5.x or earlier, this function always returns an integer
   array. In versions 6.0.0 or later, this function may return a long
   array. See below.

Description

   This function works just like dimsizes, but for file variables. This
   function should be used rather than dimsizes when the variable is in a
   file. The dimsizes function is very inefficient to use on file
   variables because it reads in the entire variable. The filevardimsizes
   function should be used exclusively when querying the dimensionality of
   variables in files.

   As of version 6.0.0, this function will return type "long" if the
   product of the dimension sizes is greater than or equal to 2 GB.

   Note: This function is exactly the same as getfilevardimsizes. It is
   kept under this name for historical purposes.

See Also

   dimsizes, getfilevardimsizes, isfilevardim

Examples

   Example 1 Consider a netCDF file where "ncdump -h Tstorm.nc" yields:
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

  a    = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/Tstorm.cdf","r")

  dimt = filevardimsizes(a,"t")
  print(dimt)

   This produces the following output:
Variable: dimt
Type: integer
Total Size: 12 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:

(0)     64
(1)     33
(2)     36


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

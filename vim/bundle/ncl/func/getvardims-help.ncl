THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/getvardims.shtml
THE_TITLE:getvardims
   NCL Home > Documentation > Functions > Metadata routines

getvardims

   Returns a list of dimension names for the given variable.

Prototype

        function getvardims (
                var
        )

        return_val [*] :  string

Arguments

   var

   Any NCL variable.

Description

   This function returns a list of dimension names for a given NCL
   variable. If a dimension is not named, then this function returns the
   default missing value for a string for that dimension.

See Also

   getfiledimsizes, getfilevardimsizes, getfilevardims, getvardims,
   getfilevartypes, getvaratts,getfilevardims addfile

Examples

   Example 1

   The following script:
  w = (/(/ (/1.,2.,3/), (/4.,5.,6./) /), (/ (/6.,5.,4/), (/3.,2.,1./) /)/)
  w!0 = "z"
  w!1 = "y"
  w!2 = "x"
  dimNames = getvardims(w)
  print(dimNames)

   will result the following output:
Variable: dimNames
Type: string
Total Size: 12 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
Number Of Attributes: 1
  _FillValue :  missing

(0)     z
(1)     y
(2)     x

   Example 2

   Assume you have a netCDF file where "ncdump -h 0360-01.nc" yields:
  netcdf 0360-01 {
  dimensions:
    time = UNLIMITED ; // (1 currently)
    nlon = 320 ;
    nlat = 384 ;
    z_t = 40 ;
    z_w = 40 ;
    tracers = 2 ;
    nchar = 80 ;
    d2 = 2 ;
    [SNIP]

   To retrieve the dimension names from the file, you can use the
   following code snippet. In the following, the reference to the file
   (here, f) is also a variable.
  f     = addfile ("0360-01.nc" , "r")
  dNames= getvardims(f)
  dSizes= getfiledimsizes(f)
  print (dNames+"   "+dSizes)

   This produces the output:
   time       1
   nlon     320
   nlat     384
   z_t       40
   z_w       40
   tracers    2
   nchar     80
   d2         2

   Example 3

   Retrieve the dimension names of a variable and use these returned names
   to reorder (reshape) the variable. Note from Example 1 that getvardims
   returns a variable of type "string". To use these "string" names for
   reordering, a variable string reference must be used. This is
   accomplished by enclosing a string with dollar signs ($).
   dims = getvardims(x)    ; dimension names
   rank = dimsizes(dims)
   if (rank.eq.3) then
       xNew = dim_rmvmean_Wrap($dims(1)$|:,$dims(2)$|:,$dims(0)$|:)
   end if

   if (rank.eq.4) then
       xNew = dim_rmvmean_Wrap($dims(1)$|:,$dims(2)$|:,$dims(3)$|:,$dims(0)$|:)
   end if

   printVarSummary(xNew)




   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

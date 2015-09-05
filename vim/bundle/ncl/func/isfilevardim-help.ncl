THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isfilevardim.shtml
THE_TITLE:isfilevardim
   NCL Home > Documentation > Functions > File IO

isfilevardim

   Checks if file variable dimensions are defined for a file variable.

Prototype

        function isfilevardim (
                thefile [1] : file,
                varname [1] : string,
                dimnames    : string
        )

        return_val [dimsizes(dimnames)] :  logical

Arguments

   thefile

   reference to a file. It is created using addfile. Thus, it must be a
   supported file format.
   varname

   a single string variable name.
   dimnames

   an array of any dimensionality containing strings.

Return value

   The output of isfilevardim is a logical array with the same dimensions
   as the dimnames parameter.

Description

   For each element in the dimnames parameter, isfilevardim returns True
   if the element is a dimension of the file variable varname in the file
   thefile and False if not. If the parameter thefile is not a valid file
   or varname isn't a defined file variable, then a single missing value
   is returned.

See Also

   getfilevardims, getvardims

Examples

   Example 1

   Check to see if the variable "TEMP" has dimension names time, level,
   lev, latitude, lat, longitude, lon associated with it.

    f        = addfile ("foo.nc" , "r")     ; create a file reference
                                            ; list of dimension names
    dimNames = (/"time","level","lev","latitude","lat","longitude","lon"/)

    tf       = isfilevardim(f, "TEMP", dimNames)    ; ==> tf(7)

    print(tf)   ; each element will be True or False


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

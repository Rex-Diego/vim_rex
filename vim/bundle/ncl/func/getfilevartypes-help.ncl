THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/getfilevartypes.shtml
THE_TITLE:getfilevartypes
   NCL Home > Documentation > Functions > File IO

getfilevartypes

   Returns the types of the named variables stored in the given supported
   file.

Prototype

        function getfilevartypes (
                thefile [1] : file,
                var         : string
        )

        return_val [*] :  string

Arguments

   thefile

   Reference to a file. It is created using addfile or addfiles. Thus, it
   must be a supported file format.
   var

   A list of variable names in file referenced by thefile.

Description

   Given a file referenced by thefile, this function returns the type of
   each variable name listed. A missing value is returned for any variable
   name that doesn't exist in the file.

See Also

   typeof, short2flt, byte2flt

Examples

   Example 1

   Open a netCDF file, retrieve all the variables names, and returns the
   type of each variable.

  f = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/Ustorm.cdf","r")

  varNames = getfilevarnames(f)           ; all variable names
  varTypes = getfilevartypes(f,varNames)  ; each variable type

  print("Type of '" + varNames + "' is " + varTypes)


   The above will produce the following output:
(0)     Type of 'reftime' is character
(1)     Type of 'lon' is float
(2)     Type of 'lat' is float
(3)     Type of 'timestep' is integer
(4)     Type of 'u' is float

   Example 2

   Open a netCDF file and determine the type of a specified variable. If
   it is of type "float" or "double" then read directly. If it is of type
   "short" or "byte" use short2flt or byte2flt functions to unpack the
   data.
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

  f = addfile("foo.nc", "r")

  varType = getfilevartypes(f,"SST")

  if (varType.eq."float" .or. varType.eq."double") then
      sst = f->SST
  end if

  if (varType.eq."short") then
      sst = short2flt(f->SST )
  end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

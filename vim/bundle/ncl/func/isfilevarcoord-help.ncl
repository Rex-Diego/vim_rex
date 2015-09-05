THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isfilevarcoord.shtml
THE_TITLE:isfilevarcoord
   NCL Home > Documentation > Functions > File IO

isfilevarcoord

   Checks if a coordinate variable is defined in a file.

Prototype

        function isfilevarcoord (
                thefile   [1] : file,
                varname   [1] : string,
                coordname [1] : string
        )

        return_val [1] :  logical

Arguments

   thefile

   reference to a file. It is created using addfile. Thus it must be a
   supported file format.
   varname

   name of file variable
   coordname

   name of coordinate variable

Description

   If a given dimension has a coordinate variable this function will
   return True. If the variable or dimension name do not exist then this
   function returns a missing value. It returns False only when no
   coordinate variable exists for the variable.

See Also

   iscoord

Examples

   Example 1

    f = addfile ("foo.nc" , "r")     ; create a file reference

; check to see if the variable "TEMP" has a coordinate array named "lev"

    print( isfilevarcoord) f, "TEMP", "lev") )


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

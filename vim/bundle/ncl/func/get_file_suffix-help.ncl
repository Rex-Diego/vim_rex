THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/get_file_suffix.shtml
THE_TITLE:get_file_suffix
   NCL Home > Documentation > Functions > String manipulation

get_file_suffix

   Extract the suffix associated with a file name.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function get_file_suffix (
                fileName [1] : string,
                opt      [1] : integer
        )

Arguments

   fileName

   Name of the file.
   opt

   option: =0 return the rightmost file suffix; =1 return all suffix
   portions

Return value

   A string specifying the suffix. Returned as an attribute is the name of
   the file without the returned suffix.

Description

   Extracts one or more suffix associated with a file name. Also, return
   the name of the file without the extracted suffix as and attribute
   named fBase

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   s   = "x.nc"
   sfx = get_file_suffix(s,0)     ; sfx = ".nc"

   s   = "x_apple.1958-1999.nc"
   sfx = get_file_suffix(s,0)     ; sfx = ".nc"

   s   = "x_apple.1958-1999.nc"
   sfx = get_file_suffix(s,1)     ; sfx = ".1958-1999.nc"

   s   = "x_apple.1958-1999.nc.gz"
   sfx = get_file_suffix(s,0)     ; sfx = ".gz"

   Example 2

   Check to see if a file has a ".gz" suffix. If so, Use the system to
   invoke gzip to un-zip the file.

   fName  = "sample.1958-2005.nc.gz"
   suffix = get_file_suffix(fName, 0)  ; ".gz"
   if (suffix.eq.".gz") then
       system("gzip -d "+fName)
       fileName = suffix@fBase            ; sample.1958-2005.nc
   else
       fileName = fName
   end if
   f = addfile(fileName, "r")


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/oneDtostring.shtml
THE_TITLE:oneDtostring
   NCL Home > Documentation > Functions > String manipulation

oneDtostring

   Converts a 1-dimensional array to a single string.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function oneDtostring (
                x
        )

        return_val [1] :  string

Arguments

   x

   An array of any type.

Return value

   A single scalar string is returned.

Description

   This function takes an array of values, delimits them with commas, and
   returns this whole thing as a single string.

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
begin
   maxYrs      = (/1960,1969,1980,1989/)
   yrString    = oneDtostring (maxYrs)
   print(yrString)
end

   This short script yields:
Variable: yrString Type: string Total Size: 4 bytes 1 values Number of
Dimensions: 1 Dimensions and sizes: [1] Coordinates: Number Of
Attributes: 1 _FillValue : missing
(0) 1960,1969,1980,1989


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

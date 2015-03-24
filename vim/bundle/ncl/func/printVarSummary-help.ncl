THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/printVarSummary.shtml
THE_TITLE:printVarSummary
   NCL Home > Documentation > Functions > Printing

printVarSummary

   Prints a summary of a variable's information.

Prototype

        procedure printVarSummary (
                data
        )

Arguments

   data

   A variable of any type and dimensionality.

Description

   The printVarSummary procedure displays the information associated with
   a variable. The information includes type, attributes, dimensions
   sizes, named dimensions (if present), and a summary of coordinate data
   (if present).

   printVarSummary is often used in scripts to minimize printed output,
   because it does not print out individual values like the print
   procedure.

   As of version 6.0.0, when applied to a file type variable,
   printVarSummary prints only a short summary of the contents of the
   file, listing the number of global attributes, dimensions, and
   variables. To see the complete contents of the file, use the print
   procedure.

   Note: if you want to print information about a variable on a file, do
   not use this procedure, as it will copy the whole variable into memory.
   Instead, use printFileVarSummary.

See Also

   print, printFileVarSummary

Examples

   Example 1

   Assume "T2m.nc" is a netCDF file with a variable called T, and that T
   has attributes and some coordinate variables called time, lat, and lon.
   Then:
  f = addfile ("T2m.nc", "r")
  T = f->T
  printVarSummary (T)

   would yield the following output:
Variable: T
Type: float
Total Size: 72192 bytes
            18048 values
Number of Dimensions: 3
Dimensions and sizes:   [time | 1] x [lat | 94] x [lon | 192]
Coordinates:
            time: [197901..197901]
            lat: [-88.54195..88.54195]
            lon: [ 0..358.125]
Number Of Attributes: 4
  units :       K
  short_name :  T2m
  long_name :   Temperature (2m)
  _FillValue :  1e+36

   Example 2

   To print a short summary of the contents of the file opened in Example
   1, call:
  printVarSummary (f)

   which yields:
Variable: f
Type: file
File path: ~/data/T2m.nc
Number of global attributes: 0
Number of dimensions: 3
Number of variables: 5

   For more detail, including dimension names and sizes, attribute names
   and values, and complete information about each variable, use the print
   procedure.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

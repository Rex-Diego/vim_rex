THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/addfiles_GetVar.shtml
THE_TITLE:addfiles_GetVar
   NCL Home > Documentation > Functions > File IO

addfiles_GetVar

   Creates a reference that spans multiple data files and returns
   metadata. (deprecated: see addfiles)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function addfiles_GetVar (
                f         : list,
                files [*] : string,
                name      : string
        )

        return_val [1] :  list

Arguments

   f

   The list of files returned from addfiles returns (e.g. f_list =
   addfiles (fils+".nc", "r")).
   files

   A one-dimensional array that equal the file names to access.
   name

   A one-dimensional array or scalar value equal to the variable to be
   retrieved from f. Must match the syntax and case sensitivity of the
   variable.

Return value

   An array of any dimensionality or type. This is the variable selected
   by name on files.

Description

   The addfiles in NCL version 5.1.0 (March 2009) was upgraded to return
   meta data. It is faster and more flexible than addfiles_GetVar. It is
   our recommendation to use the upgraded addfiles. Version 5.1.1
   (mid-late May 2009) contains a bugfix and other enhancements.

   A follow-on to addfiles (which by default does not return any metadata)
   that reads in a variable AND returns the appropriate attributes and
   coordinate variables. Assumes that in the case of an addfiles join
   argument, that the leftmost dimension is the coordinate variable that
   must be specially treated.

See Also

   addfiles

Examples

   Example 1: Consider a directory that has multiple netCDF files:
   annual_11.nc, annual_2.nc,..., annual_5.nc. Each file has variables
   with 12 time steps.

     load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

     fils = systemfunc("ls /model/annual*nc")
     f    = addfiles(fils, "r")           ; note the "s" of addfile
     T    = addfiles_GetVar(f,fils,"T")
     printVarSummary(T)

   The output yields:
     Variable: T
     Type: float
     Total Size: 5529600 bytes
                 1382400 values
     Number of Dimensions: 4
     Dimensions and sizes:   [time | 60] x [lev 5] x [lat | 48] x [lon | 96]
     Coordinates:
          time: [2349..4143]
          lev: [850..200]
          lat: [-87.15909..87.15909]
          lon: [ 0..356.25]

   Note A: If the file names did not have the .nc extension, then the user
   could indicate that the files are netCDF by appending the extension via
   an NCL statement. The actual names of the files on the disk need not be
   altered.
       fils = systemfunc("ls /model/annual*") +".nc"

   Note B: This approach can be used for any supported format: .nc, .grb,
   .hdf, .hdfeos

   Example 2: Same as Example 1 but with the "join" option specified.
     load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

     fils = systemfunc("ls /model/annual*")
     f    = addfiles(fils, "r")           ; note the "s" of addfile

     ListSetType (f, "join")

     T    = addfiles_GetVar(f,fils,"T")
     printVarSummary(T)

   The output yields:
     Variable: T
     Type: float
     Total Size: 5529600 bytes
                 1382400 values
     Number of Dimensions: 5
     Dimensions and sizes:   [case | 5] x [time | 12] x [lev | 5] x [lat | 48] x
 [lon

     | 96]
     Coordinates:
                 case: [0..4]
                 time: [2349..2683]
                 lev: [850000..200]
                 lat: [-87.15909..87.15909]
                 lon: [ 0..356.25]

     Number Of Attributes: 3
       missing_value :       1e+36
       units :
       long_name :   temperature


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

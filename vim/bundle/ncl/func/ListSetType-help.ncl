THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ListSetType.shtml
THE_TITLE:ListSetType
   NCL Home > Documentation > Functions > File IO

ListSetType

   Specifies the manner in which a variable of type list is to be
   implemented.

Prototype

        procedure ListSetType (
                f       : list,
                option  : string
        )

Arguments

   f

   One-dimensional variable created by the addfiles function.
   option

   Single string that specifies whether the files should be concatenated
   (option="cat") or joined (option="join"). The default is "cat". Note:
   The "join" option requires that all dimensions be the same sizes.

Description

   ListSetType specifies how the variable of type list will be accessed.

See Also

   ListGetType,addfiles

Examples

   Example 1

   Read in a series of netCDF files (here, 5 files each with 12 time
   steps), and read into memory the four dimensional variable
   T(ntim,klvl,nlat,mlon) where ntim=12, klvl=5, nlat=48, mlon=96:
  diri = "/fs/cgd/data0/casguest/CLASS/"   ; input directory
  fils = systemfunc ("ls "+diri+"ann*.nc") ; file paths

  f    = addfiles (fils, "r")

  ListSetType (f, "cat")        ; concatenate (default)
  T    = f[:]->T                ; read T from all files

  printVarSummary (T)

   The printVarSummary procedure yields:
   Variable: T
   Type: float
   Total Size: 5529600 bytes
               1382400 values
   Number of Dimensions: 4
   Dimensions and sizes:   [60] x [5] x [48] x [96]
   Coordinates:

   The size of the time dimension is now 60 (=5*12) while the other
   dimensions remain the same. Note also, that no metadata has been
   copied.

   Example 2

   Here we use the "join" option ("cat" is the default). This adds an
   extra dimension. As noted in the documentation, the "join" option
   requires that all dimensions be the same sizes. Here,
   T(ntim,klvl,nlat,mlon) => T(12,5,48,96) on each file.
  diri = "/fs/cgd/data0/casguest/CLASS/"   ; input directory
  fils = systemfunc ("ls "+diri+"ann*.nc") ; file paths

  f    = addfiles (fils, "r")

  ListSetType (f, "join")       ; join
  T    = f[:]->T                ; read T from all files
  printVarSummary (T)

   The printVarSummary procedure yields:
   Variable: T
   Type: float
   Total Size: 5529600 bytes
               1382400 values
   Number of Dimensions: 5
   Dimensions and sizes:   [5] x [12] x [5] x [48] x [96]
   Coordinates:


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

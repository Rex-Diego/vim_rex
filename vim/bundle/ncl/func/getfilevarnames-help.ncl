THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/getfilevarnames.shtml
THE_TITLE:getfilevarnames
   NCL Home > Documentation > Functions > File IO

getfilevarnames

   Returns an array of file variable names in the specified supported
   file.

   [new.gif] Available in version 6.1.1 and later.

Prototype

        function getfilevarnames (
                the_file [1] : file
        )

        return_val [*] :  string

Arguments

   the_file

   "the_file" references to a file. It is created using addfile or
   addfiles. Thus, it must be a supported file format.

Return value

   This function returns an array of strings with each element containing
   the name of a variable. The length of this array is equal to the number
   of variables in the file.

   Start from version 6.1.1, this function will return the variable names
   with group name(s) inserted at the beginning, if a user opens a NetCDF4
   file. If it is at root (group), then a "/" is inserted. See example
   below for more detailes.

Description

   This function is useful when accessing file variables by string name.
   (See Files.)

Examples

   The following example gets all the variables names from a netCDF file
   but it will also work for any file referenced by addfile. The dollar
   sign syntax used in this example is described at "NCL Variables".
    f = addfile ("X.nc" , "r")   ; could also have ccm, grb or hdf suffux
    vNames = getfilevarnames (f) ; get names of all variables on file

    nNames = dimsizes (vNames)   ; number of variables on the file

    print (vNames)               ; print all variable names on file

    do n=0,nNames-1              ; loop thru each variable
       v = f->$vNames(n)$        ; read the varible to memory

       dimv = dimsizes(v)        ; dimension size of the variable
       rank = dimsizes(dimv)     ; rank [ie: number of dimensions]

       [SNIP]

       delete (v)
       delete (rank)
   end do

   When open a NetCDF4 file, the variable names have group name inserted
   at the beginning (If it is a roor (group), then a "/" is inserted (to
   represent root group)).
 fn = "nc4_out_nc4uvt.nc"
 fi = addfile(fn, "r")

 vNames = getfilevarnames(fi) ; get variable names of all groups on file

 print (vNames)               ; print all variable names on file

   The above script produces:

Variable: vNames
Type: string
Total Size: 112 bytes
            14 values
Number of Dimensions: 1
Dimensions and sizes:   [14]
Coordinates:
(0)     /time
(1)     /lev
(2)     /lat
(3)     /lon
(4)     /T
(5)     /U
(6)     /V
(7)     /grp1/time
(8)     /grp1/lev
(9)     /grp1/lat
(10)    /grp1/lon
(11)    /grp1/T
(12)    /grp1/U
(13)    /grp1/V

   Here, one can see that there are T, U, V, and other variables under
   root (group) and group "grp1".


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/addfiles.shtml
THE_TITLE:addfiles
   NCL Home > Documentation > Functions > File IO

addfiles

   Creates a reference that spans multiple data files.

Prototype

        function addfiles (
                file_path [*] : string,
                status        : string
        )

        return_val [1] :  list

Arguments

   file_path

   A one-dimensional array of strings containing the full or relative path
   of the data files to be referenced.
   status

   Single string that specifies whether the files should be opened as
   read-only ("r") , read-write ("w") or create ("c").

Description

   Note 1: As of version 5.1.0, most of the operations available for the
   list of files returned by the addfiles function have been
   reimplemented. Aggregated variables now include coordinate variables
   and attribute metadata. The aggregated dimension can be subscripted
   using integer, vector, or coordinate subscripting. Other features are
   under development.

   Note 2: Version 5.1.1 contains some important bug fixes for the new
   implementation. These include fixes for a problem with non-unity
   strides along the aggregated dimension, for a problem with files
   improperly remaining open for the lifetime of the script, and also for
   a problem where the returned variable in certain cases may have an
   internal tag incorrectly set to indicate a scalar variable, resulting
   in odd behavior. Users of version 5.1.0 are advised not to trust the
   contents of variables read using addfiles and to upgrade as soon as
   possible to 5.1.1.

   GRIB2 backwards incompatibility note: In version 5.2.0, the GRIB2 code
   tables were extensively revised to bring them up-to-date with the
   currently documented state of the parameter tables primarily as defined
   by NCEP. This may cause some backwards incompatibility issues. For more
   information and a work-around, see the "GRIB2 backwards incompatibility
   alert" section in the NCL Reference Manual.

   The addfiles function provides the user with the ability to access data
   spanning multiple files. The function returns a single variable of type
   list containing a list of references to the files pointed to by the
   file_path argument. Files pointed to by the file_path string must be in
   a supported file format and have a supported file extension at the end
   of each file name. The extension is required even though it need not be
   part of the actual filename. The currently supported formats, valid
   status values, and accepted extensions are:

   NetCDF ("r", "w", "c")
          ".nc", ".cdf", ".netcdf"

   GRIB versions 1 and 2 ("r")
          ".gr", ".gr1", ".grb", ".grib", ".grb1", ".grib1", ".gr2",
          "grb2", ".grib2"

          (GRIB2 support available in versions 4.3.0 or later. )

   HDF ("r", "w", "c")
          ".hdf", ".hd"

   HDFEOS ("r")
          ".hdfeos", "he2", "he4"

   HDF5 ("r", "w")
          ".h5"

          (Limited HDF5 support available in versions 6.0.0 or later. )

   HDFEOS5 ("r")
          ".he5"

   CCM ("r")
          ".ccm"

   Shapefile ("r")
          ".shp" (Shapefile), ".mif" (MapInfo), ".gmt" (Generic Mapping
          Tools), ".rt1" (TIGER)

          (Support for Shapefiles and other geospatial vector-data formats
          is available in versions 5.1.1 or later. This may not be
          available on all systems.)

   addfile handles these extensions in a case-insensitive manner: ".grib",
   ".GRIB", and ".Grib" all indicate a GRIB file.

   If the status "c" is set, the file is created if it doesn't exist. If
   it does exist, an error message is printed and the default missing
   value for files is returned. If "w" is set, and the files all exist and
   have permissions that allow for reading and writing, then the files are
   opened for reading and writing. If any of these conditions fail, an
   error message is reported and the default file missing value is
   returned. Similarly, if "r" is set, the files must exist and the user
   must have read permissions on those files. Otherwise, an error message
   is printed and the default missing value is returned. See the ismissing
   function on how to detect the returned missing value in a program.

   The addfiles function differs from the addfile function in several
   ways:
    1. Whereas addfile returns a reference to a single file in a variable
       of type file, addfiles returns a variable of type list that
       contains references, each of type file, to multiple files. This
       combination of the list and file types forms a specialized list
       type. It provides a means of obtaining the aggregated contents of
       variables that span the complete list of files.
    2. It is not yet possible to use the file list type variable as input
       to the "getfilexxxx" suite of functions. However, since each
       element of the list is actually a file type variable, you can input
       a single element of the list as an argument to any of these
       functions, e.g.:
  files = systemfunc("ls *.nc")
  f = addfiles(files,"r")
  dsizes = getfiledimsizes(f[0])

    3. The variables contained in a file opened using the addfile function
       are accessed using syntax such as this:
  T = f->T(:,0:5,:,:)

       In contrast, variables aggregated across multiple files opened
       using the addfiles function are accessed using square brackets to
       reference the file list elements. The syntax look like this:
  T_agg = f[:]->T(:,0:5,:,:)

       Note that integer subscripting can be applied inside the square
       brackets to define a subset of the file list:
  T_agg = f[0:10:2]->T(:,0:5,:,:)

    4. When a regular NCL variable such as T above is created by
       assignment from a regular file type variable, all attributes and
       properly subscripted coordinate variables are assigned to the NCL
       variable along with the actual data. Prior to version 5.1.0, a
       variable such as T_agg above generated by assignment from a file
       list variable contained no attribute or coordinate metadata.
       However, beginning with version 5.1.0, aggregated variables created
       from a file list operation do contain standard metadata. It is no
       longer necessary to use the addfiles_GetVar function for this
       purpose. Also, beginning with version 5.1.0, all forms of
       subscripting (integer, coordinate, and vector) are supported for
       the aggregated (leftmost) dimension with one caveat: the indexes
       comprising a vector subscript must increase or decrease
       monotonically. Unlike normal vector subscripting, vector subscripts
       of the aggregated dimension cannot have repeated elements or
       arbitrary ordering of the elements. The intention is to remove this
       restriction in a future release.
    5. Although files can be opened for writing using addfiles, the
       current implementation does not support writing data using the
       square bracket list syntax described above. You can only write to
       individual file members of the list by assigning a list element to
       a single file variable, e.g.:
  f = addfiles(files,"w")
  f_single = f[0]

       The variable f_single is in every way equivalent to a file variable
       created using addfile. You can modify its contents using any
       operation valid for a file type variable. However, attempts to
       modify the aggregated contents of a file list using syntax such as:
  f[:]->T(:,0,0) = 5.0

       currently produce no result. Modification across the aggregated
       contents using file list type syntax will be implemented in a
       future release.

   The aggregated contents of the file list may be accessed using two
   different options, "cat" (the default) or "join", as specified by the
   ListSetType procedure. The "cat" option causes the elements of the
   existing leftmost dimension in a variable be concatenated together to
   form a dimension whose size is the sum of the sizes of the dimension in
   each file. If the leftmost dimension of the individual variables in
   each file has an associated coordinate variable, an aggregated
   coordinate variable will be created and returned along with the data
   variable. The "join" option results in the creation of a new leftmost
   dimension with one element from each file. In this case the size of the
   new dimension will be equal to the number of files (with valid
   elements) in the list. Since the new dimension is created during the
   aggregation process, no coordinate variable will be returned along with
   the data variable.

   Under what conditions should the "cat" (default) and "join" options be
   used? Generally speaking, if the leftmost dimension of a variable is a
   "record" dimension (say, "time") with successive coordinates in each
   file, then the "cat" option is best. If, however, there is no record
   dimension (e.g. [lev,lat,lon] where the existing dimensions have the
   same size and coordinate values in all files), then the "join" option
   is appropriate.

   Currently, no checking is done in either "join" or "cat" mode to
   determine whether the files are correctly ordered. NCL assumes that the
   string array used as the file_path argument contains the file names in
   the proper order. In "cat" mode, NCL errors are the likely result of
   out-of-order files; this is because the coordinate values of the
   leftmost dimension will form a non-monotonic sequence. In "join" mode,
   NCL will not emit any errors, but the results will not be correct.

   If you use a command like systemfunc ("ls *.nc") to get a list of the
   files to be aggregated, then you need to make sure that the "ls"
   command gives you the files in the correct order. If it does not, one
   possible fix is to rename the files to ensure the correct order.
   Another might be to create a text file containing the names of each
   file, one per line, in the proper order. Then you could use asciiread
   to ingest the filenames into a string array.

   Whether in "join" or "cat" mode, NCL checks the dimensionality (i.e.,
   the number and size of the non-aggregated dimensions) of the subject
   variable in each file as it is being aggregated. The dimensionality of
   the variable in the first file of the aggregation sets the standard. If
   the dimensionality of an identically-named variable in a subsequent
   file does not conform, a warning is issued and its contents will not be
   used as part of the aggregated result.

   Users who aggregate many NetCDF files together in a single call to the
   addfiles function should be aware that there are limits on the number
   of files that can be simultaneously open. Many is, of course, a
   relative term. OPeNDAP-enabled NCL is restricted by the OPeNDAP NetCDF
   client library to 64 open files when accessing files either locally or
   over the network. Otherwise, typical Unix/Linux systems usually allow
   1024 open files, although this value can vary for older or less-common
   sytems, and it can also be tweaked when building the OS kernel. Note
   that the actual number of open files possible may be somewhat less than
   the limit because of file descriptors used internally. However, NCL can
   optionally close files after each access, in effect removing this
   limitation. This is accomplished by invoking the setfileoption
   procedure to set the option SuppressClose to False. This is only an
   issue for NetCDF, because, in general, for other file formats supported
   by NCL, files are closed after each access.

See Also

   addfiles_GetVar, addfile, ListSetType, ListGetType

Examples

   Note: all examples assume NCL version 5.1.0
   Example 1

   Read in a series of netCDF files (here, 5 files each with 12 time
   steps), and read into memory the four dimensional variable
   T(ntim,klvl,nlat,mlon), where ntim=12, klvl=5, nlat=48, mlon=96:
   fils = systemfunc ("ls /model/annual*.nc") ; file paths
   f    = addfiles (fils, "r")

   ListSetType (f, "cat")        ; concatenate (=default)
   T    = f[:]->T                ; read T from all files
   printVarSummary (T)

   The printVarSummary procedure yields:
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
   Number Of Attributes: 2
     units :       K
     long_name :   temperature

   The size of the time dimension is now 60 (=5*12), while the other
   dimensions remain the same.
   Example 2

   The "XXX" files have no record dimension. All records are 5 (levels) x
   48 (latitudes) x 96 (longitudes). Here we use the "join" option. This
   adds an extra dimension.
   diri = "/fs/cgd/data0/casguest/CLASS/"   ; input directory
   fils = systemfunc ("ls "+diri+"XXX*.nc") ; file paths
   f    = addfiles (fils, "r")   ; note the "s" of addfile
   ListSetType (f, "join")
   T    = f[:]->T                ; read T from all files
   printVarSummary (T)

   The printVarSummary procedure yields:
   Variable: T
   Type: float
   Total Size:  460800 bytes
                115200 values
   Number of Dimensions: 5
   Dimensions and sizes:   [ncl_join | 5] x [lev | 5] x [lat | 48] x [lon | 96]
   Coordinates:
            lev: [850000..250.]
            lat: [-87.15909..87.15909]
            lon: [ 0..356.25]
   Number Of Attributes: 2
     units :       K
     long_name :   temperature

   Example 3

   Generally, when there is a record dimension one uses the "cat" option.
   In this example, let's assume the five different runs were made for a
   particular year. Each run was done using, say, different boundary layer
   parameterizations. Here the time variable is the same for each file and
   we want to compare the five different cases. The appropriate choice for
   this case is "join":
   diri = "/fs/cgd/data0/casguest/CLASS/"   ; input directory
   fils = systemfunc ("ls "+diri+"Bound*.nc") ; file paths

   f    = addfiles (fils, "r")   ; note the "s" of addfile

   ListSetType (f, "join")
   T    = f[:]->T                ; read T from all files
   printVarSummary (T)

   The printVarSummary procedure yields:
   Variable: T
   Type: float
   Total Size: 5529600 bytes
               1382400 values
   Number of Dimensions: 5
   Dimensions and sizes:   [ncl_join | 5] x [time | 12] x [lev | 5] x [lat | 48]
 x [lon | 96]
   Coordinates:
            time: [2349..2683]
            lev: [850..250.]
            lat: [-87.15909..87.15909]
            lon: [ 0..356.25]
   Number Of Attributes: 2
     units :       K
     long_name :   temperature

   Example 4

   Read in the same series of netCDF files as in example 1, but access
   only each eighth step of the aggregated time dimension, and latitudes
   between -40 and +40. Since there are 12 timesteps in each file, two
   timesteps will be extracted from the first file, one from the second,
   two from the third, and so forth.
   fils = systemfunc ("ls /model/annual*.nc") ; file paths
   f    = addfiles (fils, "r")

   ListSetType (f, "cat")       ; concatenate (=default)
   T    = f[:]->T(::8,:,{-40:40},:)     ; read T with a stride of 8
   printVarSummary (T)

   The printVarSummary procedure yields:
     Variable: T
     Type: float
     Total Size: 337920 bytes
                 84480 values
     Number of Dimensions: 4
     Dimensions and sizes:   [time | 8] x [lev 5] x [lat | 22] x [lon | 96]
     Coordinates:
          time: [2349..4052]
          lev: [850..200]
          lat: [-38.94342..38.94342]
          lon: [ 0..356.25]
   Number Of Attributes: 2
     units :       K
     long_name :   temperature


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

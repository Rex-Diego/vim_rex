THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/setfileoption.shtml
THE_TITLE:setfileoption
   NCL Home > Documentation > Functions > File IO

setfileoption

   Sets a number of file-format-specific options.

Prototype

        procedure setfileoption (
                format_or_file [1] : string or file,
                option         [1] : string,
                value
        )

Arguments

   format_or_file

   Either a string specifying a file format, or a reference to a file
   opened with addfile or addfiles. If set as a string the value must be
   equal to one of the suffixes accepted by NCL as the indicator of a
   supported format (e.g. "nc", "grb", or "GRIB"), or else "bin" to
   specify an option supported for binary files.
   option

   A case-insensitive string containing the name of an NCL-supported file
   option.
   value

   A scalar value or one-dimensional array containing the desired value(s)
   to be assigned to the option. The type of this argument is dependent on
   the requirements of the option being set.

Description

   This procedure allows the user to set a number of options that are
   dependent on the format of the file accessed. The options have varying
   restrictions concerning when they may be set and the values that are
   acceptable. If the first argument is a string specifying a format, then
   the option setting applies to any file of the specified format when it
   is first opened using addfile or addfiles. If the first argument is the
   string "bin", then the option setting applies to subsequent calls to
   the built-in binary data reading functions or binary data writing
   procedures. Files referenced by existing file variables will not be
   affected. On the other hand, options set using a file variable as the
   first argument affect only the specified file, and may alter NCL's
   treatment of it dynamically.

NetCDF file format options

   DefineMode
          Default value: True

          This option may be set only for files opened for writing. (Prior
          to version 4.3.1, it defaulted to False.) When set True, rather
          than performing each operation atomically, NCL keeps the NetCDF
          library in define mode without closing the file while
          dimensions, attributes, and variables are defined using the
          functions filedimdef, fileattdef, filevardef, and filevarattdef.
          The file remains open in define mode until variable data is read
          or written, the option is set False again, or the file variable
          is deleted. Setting this option True while dimensions, variables
          and attributes are first defined can improve performance
          dramatically for files with large dimensions or many variables
          and attributes. Care should be taken to define all dimensions,
          attributes, and variables before writing actual data to the
          file.

   CompressionLevel
          Default value: -1

          Specify the level of data compression as an integer in the range
          0 through 9. Increasing values indicate greater compression.
          Compression is lossless. There are tradeoffs between the time
          spent compressing the file, versus the amount of compression
          achieved. Informal tests show that compression level 9 results
          in a file only a few percent smaller than a compression level 5
          file, but it requires 4 or 5 times the amount of time to create
          it. (This option is ignored unless the Format option is set to
          "NetCDF4Classic" or "NetCDF4".)

   Format
          Default value: "Classic"

          You may set this option only prior to opening a new NetCDF file
          in "create" mode. The first argument must be a string specifying
          the NetCDF format, such as "nc". This string-valued option
          currently has four valid values, two of which are synonyms.

          A value of "Classic" indicates that a standard NetCDF file
          should be created. Standard NetCDF files are more limited with
          respect to size. Assuming the underlying file system has support
          for large files, the total size can exceed 2 GB, but there are
          severe restrictions regarding the number of large variables and
          the order in which they are written. In general, the standard
          format should be used if and only if it is known that the total
          file size will be less than 2 GB.

          The two synonymous values, "LargeFile" and "64BitOffset",
          indicate that a NetCDF file with support for larger variables
          and a theoretically much larger total size (about 9.22e+18
          bytes) should be created. Each fixed-size variable, or each
          'record' (first dimension) of a variable with an unlimited
          dimension of a 64-bit offset file can have a size of up to 4 GB.

          Again, assuming the underlying file system has support for large
          files, recent versions of NCL can transparently read NetCDF
          files in either the classic or the 64-bit offset format. For
          more detailed information about large file support in NetCDF see
          http://www.unidata.ucar.edu/software/netcdf/docs/netcdf/Large-Fi
          le-Support.html.

          In version 4.3.1 or later, you can specify "NetCDF4Classic" to
          create a file using the NetCDF 4 classic model format. The
          classic model constrains the interface to the constructs
          provided by NetCDF 3 and earlier. However, the underlying file
          format, like that of all NetCDF 4 files, is HDF 5. Files written
          in this format can take advantage of the built-in file
          compression available in HDF 5. Use the CompressionLevel option
          (see above) to enable compression. Also the HDF 5 format removes
          virtually all restrictions on file and individual variable size.

          In version 6.1.0 or later, you can specify "NetCDF4" to create a
          file using the NetCDF 4 model format. The underlying file
          format, like that of all NetCDF 4 files, is HDF 5. Files written
          in this format can take advantage of the NetCDF-4 features, such
          as compression, chunking, etc, and new data types such as
          string, vlen, compound, enum, opaque.

   HeaderReserveSpace
          Default value: 0

          This option may be set only for files opened for writing. This
          integer-valued option may be used to reserve extra space at the
          beginning of a NetCDF file in order to define new dimensions,
          variables, or attributes after variable data has been written.
          It specifies the number of bytes to reserve in the header
          portion of the file in addition to the bytes used for the
          currently defined dimensions, variables, and attributes. Note
          that the space is reserved only when variable data is actually
          written to the file.

   MissingToFillValue
          Default value: True

          This logical-valued option has an effect only when set prior to
          opening an existing NetCDF file in read or write mode. If set to
          True, it causes a "virtual" _FillValue attribute to be created
          for any variable that has the attribute missing_value but not
          _FillValue. The purpose is to more gracefully handle files that
          use the COARDS-compliant missing_value instead of _FillValue to
          indicate missing data. Note that if a variable in a file has
          both a missing_value and a _FillValue, or if it has neither, the
          option does nothing. The virtual _FillValue attribute is not
          actually part of the NetCDF file, but only appears to be from
          within the NCL environment. However, it is propagated upon
          assignment of the variable just like any other attribute. If the
          file is opened for writing and you assign to the attribute, it
          becomes an actual attribute. Therefore to make it a permanent
          part of a file you could simply execute a statement such as:

f->v@_FillValue = f->v@_FillValue

          Unfortunately, there is no simple way within NCL to tell whether
          a particular instance of a _FillValue attribute (where there is
          also a missing_value attribute with the same value) is virtual
          or actual. However note that executing the statement above is a
          harmless no-op if the variable's _FillValue attribute actually
          exists in the file.

   PreFill
          Default value: True

          This logical-valued option may be set only for files opened for
          writing. If set False, NCL alters the standard behavior of the
          NetCDF library such that variable element locations in the file
          are not "pre-filled" with the missing (fill) value associated
          with the variable. This can noticeably improve performance when
          writing large datasets. However, if you set this option False,
          you are responsible for ensuring that all the elements of the
          variables you have defined are assigned a valid value.

   SuppressClose
          Default value: True

          This logical-valued option may be set for any NetCDF file.
          (Before version 4.3.1, it defaulted to False.) When set to False
          NCL opens a file each time an operation involving reading or
          writing data occurs and closes it again when the operation is
          complete. This helps ensure the file's integrity but may result
          in loss of performance. When this option is set to True, NCL
          will only only close the file when the user invokes 'delete' on
          the file object variable, the option is set False again, or when
          NCL exits. Note that when set to True, if NCL quits unexpectedly
          there is a small possibility that a file open for writing may
          corrupted. The DefineMode option also keeps the file open, but
          only until the first operation that requires leaving define mode
          is completed. SuppressClose and DefineMode may be used together
          in files open for writing.

          Users who invoke the addfiles function to open many files in an
          aggregated list should be aware that there are limits on the
          number of files that can be simultaneously open. Many is, of
          course, a relative term. OPeNDAP-enabled NCL is restricted by
          the OPeNDAP NetCDF client library to 64 open files when
          accessing NetCDF files either locally or over the network.
          Otherwise, typical Unix/Linux systems usually allow 1024 open
          files, although this value can vary for older or less-common
          sytems, and it can also be tweaked when building the OS kernel.
          The actual number of open files possible may be somewhat less
          than the limit because of file descriptors used internally. In
          cases where these values might be exceeded, setting this option
          to False removes the limitation on the number of files in an
          aggregated list.

   Shuffle
          Default value: 1

          This option has two valid (integer) values: 1, and 0, where 1
          means turning HDF5 (compression) shuffle filter on, and 0 means
          off. Turning the shuffle filter on can improve the compression
          ratio for integer data.

          This option has an effect only when writing full model NetCDF4
          compressed files. When writing NetCDF4 classic model file using
          the Standard file structure (see the FileStructure option) the
          shuffle filter is always on, regardless of the setting of this
          option. This option can only be set after the file has been
          created.

GRIB file format options

   DefaultNCEPPTable
          Default value: "Operational"

          This option applies only to GRIB1-formatted files.

          This string-valued option has two valid values: "Operational" or
          "Reanalysis". It specifies whether to default to the use of the
          NCEP operational parameter table
          (http://www.ncl.ucar.edu/Document/Manuals/Ref_Manual/ncep_opn.ht
          m) or the NCEP reanalysis parameter table
          (http://www.ncl.ucar.edu/Document/Manuals/Ref_Manual/ncep_reanal
          .htm). The option only applies in cases where NCL, on its own,
          cannot definitively determine which of these tables to use
          because of historical ambiguities in NCEP usage.

   InitialTimeCoordinateType
          Default value: "Numeric"

          This option applies to GRIB1- and GRIB2-formatted files.

          This string-valued option has two valid values: "Numeric" or
          "String". A value of "Numeric" makes the initial time
          coordinates conform to a COARDS-compliant numeric time in hours
          since 1800-01-01 (00.00).

          Prior to version 4.2.0.a034, this option defaulted to "String".
          NCL used an array of strings to represent the coordinate values
          of an initial time dimension. This representation proved to be
          problematic, both because it did not conform to standard CF and
          COARDS conventions, and because it was difficult to use in a
          context where numerical properties such as monotonicity were
          usually expected. The "String" default was originally retained
          for backwards compatibility, but because of the problems
          described above, it was decided to make the default "Numeric".

          By setting this option to "String", you can maintain backwards
          compatibility with versions before 4.3.0. If this option is set
          after adding a GRIB file, any initial time dimensions in the
          file will immediately be updated to reflect the new option
          value.

          Note: in NCL's representation of GRIB1 and GRIB2 files, the
          initial time dimension is distinguished from the forecast time
          dimension, whose coordinate values are numerical offsets from a
          particular initial time.

   SingleElementDimensions
          Default value: "None"

          This option applies to GRIB1- and GRIB2-formatted files.

          This string-valued option allows the user to specify that
          variables with only a single initial time, forecast time, level,
          ensemble or probability value, usually handled as attributes, be
          treated as containing single element dimensions. A value of
          "None" means that no single-element dimensions will appear in
          NCL's representation of the GRIB file. Conversely, if the option
          is given the value "All", then all possible dimensions will be
          created for each variable. Otherwise, the desired single element
          dimensions may be specified individually. The valid choices are
          "Initial_time", "Forecast_time", "Level", "Ensemble", and
          "Probability". Since this option can take an array of values,
          you can specify more than one of these dimension types as the
          option value. However, the options "None" and "All" override the
          individual dimension specifications.

          Note that dimensions are not created if the variable does not
          have an actual value associated with the dimension type,
          regardless of the value given to this option. For example,
          variables that are not part of an ensemble forecast will never
          have an ensemble dimension, and variables whose level type (e.g.
          Tropopause) does not have a numerical value will never have a
          level dimension. In the case of level types, it may depend on
          who wrote the record: files written by some centers may give no
          value for certain level types where others may use the numerical
          value 0. The intent of this option is to make it easier to
          concatenate conforming variables from multiple files together.

   TimePeriodSuffix
          Default value: True

          This option applies to GRIB1- and GRIB2-formatted files. A value
          of True indicates that statistically-processed variables such as
          averages and accumulations have a time period and time unit
          added after the suffix indicating the statistical variable type.
          For example, the suffix "_avg3h" represents a 3 hour average.
          These suffixes are required to uniquely characterize otherwise
          identically-named variables that have different periods and/or
          units within the same file. However, when concatenating
          variables from different files using the addfiles function
          differences in these suffixes can prevent individual variables
          from being concatenated into a single composite variable when it
          is actually desireable. Setting this option to False removes the
          time period and units from the variable name leaving only the
          statistical processing type (e.g. "_avg" for an average or
          "_acc" for an accumulation).

   ThinnedGridInterpolation
          Default value: "Cubic" ("Linear" if using bitmask arrays)

          This option applies to GRIB1- and GRIB2-formatted files.

          This string-valued option has two valid values: "Cubic" or
          "Linear". This option may be set for any GRIB file, but only has
          an effect when the GRIB file contains data on a thinned grid.
          Note: up to version 4.2.0.a034 of NCL, the default was "Linear".
          However, the "Cubic" value has been shown to produce better
          results, hence, as of version 4.3.0, it is the default setting.
          The exception is when bitmask arrays are encountered. In this
          case, "Linear" will be the default because "Cubic" interpolation
          cannot be applied in the presence of bitmask arrays.

          The GRIB documentation refers to these grids as "quasi-regular".
          The option controls the interpolation performed in converting
          variable data on the thinned grid to the standard rectangular
          form that is returned by NCL. If this option is modified after
          adding a GRIB file, the values of variables defined on one of
          these thinned grids will be modified.

Binary data file options

   ReadByteOrder
          Default value: "Native"

          This string-valued option has three valid values: "Native",
          "BigEndian", and "LittleEndian". It allows you to read binary
          data files written with either big or little endian byte
          ordering independent of the system on which you are running. It
          affects the contents of variables read using the binary data
          reading functions cbinread, fbindirread, fbinrecread, and
          fbinread, as well as the results of the record counting function
          fbinnumrec. When this option has a value of "Native", these
          functions behave as they always have: they expect the data bytes
          to be ordered according to the conventions of the system on
          which the code is currently executing. However, if the option is
          set to "BigEndian" or "LittleEndian" NCL will expect the input
          data file to be byte-ordered according to the conventions of,
          respectively, a big-endian or a little-endian system. The
          functions will then either byte-swap the data or not, as
          appropriate for the byte ordering of the system executing the
          code, before assigning the the data to the return variable.

   WriteByteOrder
          Default value: "Native"

          This string-valued option has three valid values: "Native",
          "BigEndian", and "LittleEndian". It allows you to write binary
          data files with whatever byte ordering you prefer independent of
          the system on which you are running. It affects the contents of
          files written using the binary data writing procedures
          cbinwrite, fbindirwrite, fbinrecwrite, and fbinwrite. When this
          option has a value of "Native", these procedures behave as they
          always have: they write the data bytes ordered according to the
          conventions of the system on which the code is executing.
          However, if the option is set to "BigEndian" or "LittleEndian"
          NCL will write output data files byte-ordered according to the
          conventions of, respectively, a big-endian or a little-endian
          system. The procedure will either byte-swap the data or not, as
          appropriate for the byte ordering of the system executing the
          code, in order to produce data files with the specified byte
          ordering.

   RecordMarkerSize
          Default value: 4

          Available in version 6.1.1 and later. and later.

          This option can be set to 4 or 8. It indicates the size in bytes
          of the record marker at the beginning and end of Fortran
          sequential files. The following functions recognize this option:
          fbinrecread, fbinrecwrite, fbinnumrec, fbinread, fbinwrite.

Options that can apply to multiple formats

   FileStructure
          Default value: "Standard"

          Available in version 6.1.1 and later. and later.

          This option has two valid string type values: "Advanced", and
          "Standard", where "Advanced" means NCL will use a newer file
          structure with the capability of handling groups and more
          advanced data structures, like compound data types, variable
          length arrays and enumerated types. You can easily recognize use
          of the advanced file structure based on the appearance of the
          output of the print procedure: although the same information is
          conveyed it appears in a noticeably different form.

          The "Standard" file structure is the traditional structure used
          for all NCL supported file formats prior to NetCDF4. On the
          other hand, full model NetCDF4 files always use the "Advanced"
          file structure.

          In version 6.1.1, this option only has an effect for classic
          model NetCDF files (including NetCDF4 classic files). But other
          than the difference in print output, there should be no
          difference in the way classic model NetCDF is read or written,
          regardless of the file structure.

          However, beginning with version 6.2.0, this option will work for
          HDF-EOS5 and shapefiles. Choosing the "Advanced" file structure
          will allow the user to view these file formats using a
          representation closer to the structure implied by the native
          format. Conversely, the "Standard" structure will remain
          available to let you to view the contents as you alway have; in
          other words backwards compatibility is maintained. Eventually
          other supported formats that can make ues of the advanced
          features, including HDF4 and HDFEOS2, may also be enabled to use
          the "Advanced" file structure.

          Support for HDF5 is also anticipated beginning with version
          6.2.0, Like full model NetCDF4, HDF5 will be implemented using
          the "Advanced" file structure only.

   UseNewHLFS
   Default value: False

   NOTE: This option is available beginning with version 6.1.0. However,
   it has been deprecated and may be removed from version 6.2.0 or later.

   This option is basically a synonym for the option FileStructure except
   that it expects a logical value rather than a string. Setting
   UseNewHLFS to True is equivalent to setting FileStructure to
   "Advanced". Likewise, setting it False is equivalent to setting
   FileStructure to "Standard".

See Also

   addfile, addfiles, filedimdef, fileattdef, filevardef, filevarattdef,
   cbinread, fbindirread, fbinrecread, fbinnumrec, fbinread, cbinwrite,
   fbindirwrite, fbinrecwrite, fbinwrite.

Examples

   Example 1

   Set all subsequently opened GRIB files to use cubic interpolation
   whenever data on a thinned (quasi-regular) grid is encountered:
   setfileoption("grb","ThinnedGridInterpolation","cubic")

   Example 2

   Open a NetCDF file in create mode and set DefineMode True. Define some
   dimensions and a variable and some attributes, then turn DefineMode
   off.
   f = addfile("test.nc","c")
   setfileoption(f,"DefineMode",True)
   filedimdef(f,(/"lat","lon"/), (/100,150/), (/False,False/))
   filevardef(f,"PSfc","float",(/"lat","lon"/))
   atts = 1.0
   atts@_FillValue = -999.0
   atts@long_name = "Surface Pressure"
   filevarattdef(f,"PSfc",atts)
   setfileoption(f,"DefineMode",False) ; (not really necessary)
   ; assign data only to file variable ; would automatically suspend define mode

   f->Psfc = (/ datavar(0,:,:) /)

   Example 3

   Set up the binary data reading functions to expect files written with
   little-endian byte ordering, and the binary data writing procedures to
   produce big-endian files, regardless of the system on which NCL is
   running. Produce a big-endian file from a little-endian file containing
   float data.
   setfileoption("bin","ReadByteOrder","LittleEndian")
   setfileoption("bin","WriteByteOrder","BigEndian")

   v = cbinread("data.littleEndian.bin",-1,"float")
   cbinwrite("data.bigEndian.bin",v)

   Example 4

   In order to write large variables (>2GB) to a NetCDF file you have to
   set the NetCDF Format option to LargeFile or to NetCDF4Classic.
   setfileoption("nc","Format","LargeFile")

   or
   setfileoption("nc","Format","NetCDF4Classic")

   It might be asked "Why cannot NCL set this option internally when asked
   to write a big variable." The answer is that the NetCDF library
   requires that this decision must be made when the file is first
   created, before there is any knowledge of the size of variables that
   will be written. It is possible that eventually the largefile format
   will be the default NetCDF format, but so far the recommendation from
   Unidata is to maintain backwards compatibility where possible for
   applications that can only deal with the original small file format of
   NetCDF.

   Example 5

   Users can set the NetCDF Format option to NetCDF4 to use the full
   NetCDF-4 features:
   setfileoption("nc","Format","NetCDF4")

   By set this option, users can write a NetCDF-4 file, which is different
   to classic NetCDF file, as it uses HDF5 underlying. With this option,
   there is no size limitation to both files and variables. User can also
   write new data types (string, vlen, compound, enum, opaque), and use
   new features such as compression and chunking.

   Example 6

   Force GRIB files with a single time step, to have an explicit 'time'
   dimension.
   setfileoption("grb","SingleElementDimensions","Initial_time") ; initial_time0
_hours

   There are numerous options. Please read the description above.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

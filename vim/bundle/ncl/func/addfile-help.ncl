THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/addfile.shtml
THE_TITLE:addfile
   NCL Home > Documentation > Functions > File IO

addfile

   Opens a data file that is (or is to be) written in a supported file
   format.

Prototype

        function addfile (
                file_path [1] : string,
                status    [1] : string
        )

        return_val [1] :  file

Arguments

   file_path

   The full or relative path of the data file to load.
   status

   Specifies whether the file should be opened as a read only file or as a
   read-write file.

Description

   GRIB2 backwards incompatibility note: in version 5.2.0, the GRIB2 code
   tables were extensively revised to bring them up-to-date with the
   currently documented state of the parameter tables primarily as defined
   by NCEP. This may cause some backwards incompatibility issues. For more
   information and a work-around, see the "GRIB2 backwards incompatibility
   alert" section in the NCL Reference Manual.

   The addfile function returns a file variable reference to the file
   specified by the file_path argument. The file_path string must contain
   the full or relative path of a file with data in a supported format as
   well as an extension (a suffix consisting of the final characters
   following the last dot) that indicates the expected format. The
   extension is required even though it need not be part of the actual
   filename. The currently supported formats, valid status values, and
   accepted extensions are:

   NetCDF ("r", "w", "c")
          ".nc", ".cdf", ".netcdf"

   GRIB versions 1 and 2 ("r")
          ".gr", ".gr1", ".grb", ".grib", ".grb1", ".grib1", ".gr2",
          "grb2", ".grib2"

          (GRIB2 support available in versions 4.3.0 or later. )

   HDF-4 ("r", "w", "c")
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
          is available in versions 5.1.1 or later. Shapefile support may
          not be available on all systems.)

   addfile handles these extensions in a case-insensitive manner: ".grib",
   ".GRIB", and ".Grib" all indicate a GRIB file.

   The status parameter can be either "r" for read-only, "w" for
   read-write or "c" for create. When "c" is set, assuming the user has
   permissions to write in the specified directory and the format is
   writable, the file is created if it does not exist. If it does exist,
   an error message is printed and the default missing value for files is
   returned. When "w" is set, if the file exists, is in a writable format,
   and has permissions allowing read/write access, the file is opened for
   reading and writing. If any of these conditions fail, an error message
   is reported and the default file missing value is returned. Similarly,
   when "r" is set, if the file exists and has permissions allowing read
   access, the file is opened for reading; otherwise an error message is
   printed and the default missing value is returned. See the ismissing
   function on how to detect the returned missing value in a program.

   Use addfiles to reference multiple data files.

   There are several functions available for querying what's on the file:

     * getvaratts - return a list of global attributes on the file
     * getfiledimsizes - return a list of dimension sizes
     * getfilevaratts - return a list of attributes associated with a
       given variable on the file
     * getfilevardims - return a list of dimension names associated with a
       given variable on the file
     * getfilevardimsizes - return a list of dimension sizes associated
       with a given variable on the file
     * getfilevarnames - return a list of variable names on the file
     * getfilevartypes - return a list of variable types for the given
       variable(s) on the file

See Also

   addfiles, getvaratts, getfiledimsizes, getfilevaratts, getfilevardims,
   getfilevardimsizes, getfilevarnames, getfilevartypes, isfile,
   isfilepresent, isfilevar, isfilevaratt, isfilevarcoord

Examples

   Example 1

   Open a netCDF file called "ex01B1_uv300.hs.nc" as read-only and print
   its contents:
  a = addfile("ex01B1_uv300.hs.nc","r")
  print(a)

   Example 2

   Open a GRIB 2 file called "fh.0000_tl.press_gr.awp218" and print its
   contents:
  a = addfile("fh.0000_tl.press_gr.awp218.grb","r")
  print(a)

   Note that the file name itself contains no extension indicating the
   format, but that the extension ".grb" is added to the file_path
   argument. Also note, in the case of GRIB, that you do not need to
   indicate whether the file is GRIB 1 or GRIB 2. NCL treats all the
   acceptable GRIB extensions as meaning the same thing. The GRIB version
   is determined internally.

   Example 3

   Read in a CCM History Tape (.ccm) and write its contents to a netCDF
   (.nc) file:
begin
  fname  = "01-11"                       ; file name
  ccmf   = addfile(fname+".ccm","r")     ; open CCM for reading
  system ("rm "+fname+".nc")             ; remove any pre-existing file
  ncdf   = addfile(fname+".nc","c")      ; create new netCDF file

  att_names = getvaratts(ccmf)           ; get CCM file's global attributes
  if(.not.all(ismissing(att_names))) then
    do i = 0,dimsizes(att_names)-1
      print("copy_fileatts: global attributes->" + att_names(i))
      ncdf@$att_names(i)$ = ccmf@$att_names(i)$     ; copy CCM file's global att
ributes
    end do
  end if

  names = getfilevarnames(ccmf)       ; get CCM file's variable names and print
them
  print (names)
;
; loop over variables and copy to netCDF file
;
  do i=0, dimsizes(names)-1
    print("writing ncdf: i,name="+ i+ "   "+ names(i))
    ncdf->$names(i)$ = ccmf->$names(i)$
  end do

  print (ncdf)      ; print overview of contents of netCDF file
end

   Example 4

   Here's an example that shows how to access a file being served by an
   OPeNDAP server, and to test if your version of NCL has OPeNDAP
   capability built into it:
begin
; The URL is so long, break it into two pieces.
  url      = "http://www.cdc.noaa.gov/cgi-bin/nph-nc/Datasets/"
  filename = "ncep.reanalysis.dailyavgs/pressure/air.1948.nc"

  exists = isfilepresent(url+filename)
  if(.not.exists) then
    print("OPeNDAP test unsuccessful.")
    print("Either the file doesn't exist, or NCL does")
    print("not have OPeNDAP cabilities on this system.")
  else
    f = addfile(url + filename,"r")
    variables = getfilevarnames(f)
    print(variables)     ; should be (/"air","time","lon","lat","level"/)
  end if
end

   Example 5

   Change values and meta data of a variable using the "w" status option.

  a = addfile("foo.nc","w")

  t = a->TEMP               ; degC
  t = t + 273.15            ; change values
  t@units = "degK"          ; update appropriate attribute

  a->TEMP = t               ; overwrite

   Example 6

   addfile can modify a variable in a netCDF file, and/or add new
   variables to it. The script below reads u,v from a file; changes their
   values; updates the units attribute; creates a new variable (spd) adds
   attributes; and, finally, writes them out.

  f = addfile("foo.nc","w")

  u = f->U                          ; units  m/s
  v = f->V

  u = 3.2808399 * u                 ; change values (m/s to ft/s)
  v = 3.2808399 * v

  u@units = "ft/s"                  ; update attribute
  v@units = "ft/s"
                                    ; create new variable
  spd = sqrt(u^2 + v^2)

  spd@long_name  = "Wind Speed"
  spd@short_name = "Speed"
  spd@units      = "ft/s"

  f->U = u                          ; write to file (overwrite)
  f->V = v
                                    ; define appropriate information
  filevardef(f, "SPD", typeof(u), getvardims(u))
  f->SPD = spd                      ; write new variable



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isfilepresent.shtml
THE_TITLE:isfilepresent
   NCL Home > Documentation > Functions > File IO

isfilepresent

   Checks if a file exists.

Prototype

        function isfilepresent (
                file_path  : string
        )

        return_val [dimsizes(file_path)] :  logical

Arguments

   file_path

   A scalar string or a multi-dimensional array of strings containing the
   full or relative path to data files (Unix pathname string) for which to
   check presence on the filesystem.

Return value

   The output of isfilepresent is a logical variable with the same
   dimension sizes as the input.

Description

   The function isfilepresent returns True for every element of file_path
   that is present on the filesystem, and False if not.

See Also

   isfile

Examples

   Example 1

   The following code will determine if a HDF file named test.hdf exists:
  if (isfilepresent("test.hdf"))
    f = addfile ("test.hdf", "r")
  end if

   Example 2

   The following code will determine if each of a group of files exists:
; specify data directory and get a list of all nc files in the directory
  datadir = getenv("NCARG_ROOT") + "/lib/ncarg/data/cdf/"
  ncdf    = systemfunc("cd "+datadir; "ls *.nc")

; list of files to check
  fils = (/ "bogus.nc" , "ex01B1_uv300.hs.nc", "foo.nc", "sst30e_netcdf.nc"/)

; Which of "fils" is present
  fils_tf  = isfilepresent(datadir+fils)

  print (fils_tf)

   Output:
Variable: fils_tf
Type: logical
Total Size: 16 bytes
            4 values
Number of Dimensions: 1
Dimensions and sizes:   [4]
Coordinates:
(0)     False
(1)     True
(2)     False
(3)     True

   Example 3

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


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

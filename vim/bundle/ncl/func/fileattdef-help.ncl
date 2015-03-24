THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fileattdef.shtml
THE_TITLE:fileattdef
   NCL Home > Documentation > Functions > File IO

fileattdef

   Defines global (file) attributes associated with a supported file.

Prototype

        procedure fileattdef (
                thefile [1] : file,
                variable
        )

Arguments

   thefile

   The reference to the file that you want to write the attributes to.
   This reference must be created by the addfile function.
   variable

   A variable of any type whose attributes will be copied to thefile as
   global attributes

Description

   Given a reference to a file, fileattdef is used to define attributes
   applicable to the file as a whole. These are sometimes known as global
   file attributes. Using this procedure is much more efficient than
   writing a file's attributes one at a time.

See Also

   filedimdef, filevarattdef, filevardef, fileattdef

Examples

   Write several global attributes to the file "myfile.nc":
  ncf = addfile("myfile.nc","c")
;
;
; For a nicer looking netCDF, create a "new line" character.
; This is not necessary.
;
  nl = integertochar(10)  ; newline character
;
; Define global attributes.
;
; globalAtt can be of any type. Here logical is used by convention.
;
  globalAtt             = True

  globalAtt@history     = nl+\
      systemfunc("date") + ": ncl < TQ_NCEP2nc.ncl"

  globalAtt@sigma_level = nl+\
      "Pressure at a grid point (lon(i),lat(j),lev(k)) is computed    "+nl+\
      "using the formula:                                             "+nl+\
      "           p(i,j,k) = B(k)*PS(i,j)                             "+nl+\
      "where B and PS are contained in the variables whose names      "+nl+\
      "are given respectively by the attributes B_var and PS_var      "+nl+\
      "of the vertical coordinate variable.                             "

  globalAtt@center      = ps@center
  globalAtt@model       = ps@model
  globalAtt@title       = "T, Q, and PS from NCEP/NCAR reanalysis data"
  globalAtt@source      = "NCEP/NCAR reanalysis data"
  globalAtt@Conventions = "CF"
  fileattdef( ncf, globalAtt )

   "ncdump myfile.nc" produces the following output:
netcdf myfile {

// global attributes:
                :Conventions = "CF" ;
                :source = "NCEP/NCAR reanalysis data" ;
                :title = "T, Q, and PS from NCEP/NCAR reanalysis data" ;
                :sigma_level = "\n",
    "Pressure at a grid point (lon(i),lat(j),lev(k)) is computed    \n",
    "using the formula:                                             \n",
    "           p(i,j,k) = B(k)*PS(i,j)                             \n",
    "where B and PS are contained in the variables whose names      \n",
    "are given respectively by the attributes B_var and PS_var      \n",
    "of the vertical coordinate variable.                             " ;
                :history = "\n",
    "Sun Feb 23 10:23:28 MST 2003: ncl < TQ_NCEP2nc.ncl" ;
}


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

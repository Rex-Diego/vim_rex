THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isfilevar.shtml
THE_TITLE:isfilevar
   NCL Home > Documentation > Functions > File IO

isfilevar

   Checks if specified file variables are defined in a file.

Prototype

        function isfilevar (
                thefile [1] : file,
                varnames    : string
        )

        return_val [dimsizes(varnames)] :  logical

Arguments

   thefile

   reference to a file. It is created using addfile. Thus it must be a
   supported file format.
   varnames

   an array of strings of any dimension

Return value

   The output is a logical array with the same dimensions as the varnames
   parameter.

Description

   For each element in the varnames parameter, isfilevar returns True if
   the variable is present on the file referenced by thefile and False if
   not. If the parameter thefile is not a valid file, then a single
   missing value is returned.

See Also

   isvar

Examples

   Example 1: If a variable named X resides in the file referenced by f,
   read it to memory using:
  f = addfile ("dummy.hdf", "r")
  if (isfilevar(f, "X")) then
    x = f->X
  end if

   Example 2: Loop through a series of possible variable names and read
   the first occurrence of that variable name. Use the NCL break keyword
   to exit the loop. The '$' character is used to allow string
   substitution in the variable name:

  rotaName = (/"ANGLE", "angle", "UTAN", "utan", "ROTA", "rota" /)
  do i=0,dimsizes(rotaName)-1
    if (isfilevar(f,rotaName(i))) then
      rot = ndtooned(f->$rotaName(i)$)
      break           ; exit from do loop
    end if
  end do


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

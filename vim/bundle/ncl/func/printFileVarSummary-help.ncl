THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/printFileVarSummary.shtml
THE_TITLE:printFileVarSummary
   NCL Home > Documentation > Functions > Printing

printFileVarSummary

   Prints a summary of a file variable's information.

Prototype

        procedure printFileVarSummary (
                file    [1] : file,
                varname [1] : string
        )

Arguments

   file

   A reference to a file that was opened with either addfile or addfiles.
   varname

   The name of a variable on the file.

Description

   The printFileVarSummary procedure displays the information associated
   with a file variable. The information includes type, attributes,
   dimensions sizes, named dimensions (if present), and a summary of
   coordinate data (if present).

   printFileVarSummary does not print out individual values like the print
   procedure.

See Also

   print, printVarSummary

Examples

   Example 1

   This example opens a netCDF file and prints information about every
   variable on the file. This gives you slightly more verbose output than
   just using print(f):
  f = addfile ("$NCARG_ROOT/lib/ncarg/data/cdf/meccatemp.cdf", "r")
  varnames = getfilevarnames(f)
  if(.not.any(ismissing(varnames))) then
    do i=0,dimsizes(varnames)-1
      printFileVarSummary (f,varnames(i))
    end do
  end if

   Note: you can get the same results using printVarSummary(f->varname),
   but this will actually cause the data to be read from the file, which
   is an unnecessary step.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

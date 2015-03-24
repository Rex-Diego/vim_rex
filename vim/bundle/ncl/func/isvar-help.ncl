THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isvar.shtml
THE_TITLE:isvar
   NCL Home > Documentation > Functions > Variable query

isvar

   Returns True for every element of the input that is a defined variable.

Prototype

        function isvar (
                varnames  : string
        )

        return_val [dimsizes(varnames)] :  logical

Arguments

   varnames

   An array of strings of any dimensionality.

Description

   For each element in the varnames list, isvar returns True if the
   element is a defined variable and False otherwise. The output of isvar
   is a logical array with the same dimensions as varnames.

See Also

   isdefined

Examples

   In the NCL script below, isvars will be equal to (/True, False, True/):
    x      = 1.5
    title  = "Temperature"
    isvars = isvar((/"x","z","title"/))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

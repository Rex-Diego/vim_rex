THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isdefined.shtml
THE_TITLE:isdefined
   NCL Home > Documentation > Functions > Variable query

isdefined

   Returns True for every element of the input that is a defined keyword,
   variable, or function/procedure name.

Prototype

        function isdefined (
                idn_names  : string
        )

        return_val [dimsizes(idn_names)] :  logical

Arguments

   idn_names

   An array of strings of any dimensionality.

Description

   For each element in the idn_names list, isdefined returns True if the
   element is a defined keyword, variable or function/procedure name, and
   False otherwise. The output of isdefined is a logical array with the
   same dimensions as idn_names.

See Also

   isvar

Examples

   In the NCL script below, isd will be equal to (/True, False, True/):
    x     = 1.5
    title = "Temperature"
    isd   = isdefined((/"x","z","title"/))

   Example 2

   Since the above example was checking for existing variables, you could
   have used isvar as well. In the example below, however, isdefined is
   used to check for additional things that isvar can't handle, like
   keywords and function/procedure names:
  print(isdefined("if"))        ; True
  print(isdefined("elseif"))    ; False (bummer, NCL needs an elseif!)
  print(isdefined("isdefined")) ; True
  print(isdefined("begin"))     ; True


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

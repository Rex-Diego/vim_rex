THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/default_fillvalue.shtml
THE_TITLE:default_fillvalue
   NCL Home > Documentation > Functions > Metadata routines

default_fillvalue

   Returns the default missing value for the given variable type.

   [new.gif] Available in version 6.0.0 and later.

Prototype

        function default_fillvalue (
                var_type [1] : string
        )

        return_val [1] :  var_type

Arguments

   var_type

   The variable type (as a string) whose default missing value you want to
   return.

Description

   The default_fillvalue function returns the default missing value
   associated with the given variable type. The type of the return value
   will be the same type of the variable requested.

See Also

   set_default_fillvalue, ismissing

Examples

   Returns the default missing values for short, integer, float, double,
   and string:
  smsg = default_fillvalue("short")
  imsg = default_fillvalue("integer")
  fmsg = default_fillvalue("float")
  dmsg = default_fillvalue("double")
  strmsg = default_fillvalue("string")


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

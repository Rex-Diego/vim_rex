THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/set_default_fillvalue.shtml
THE_TITLE:set_default_fillvalue
   NCL Home > Documentation > Functions > Metadata routines

set_default_fillvalue

   Sets the default missing value for the given variable type.

   [new.gif] Available in version 6.0.0 and later.

Prototype

        procedure set_default_fillvalue (
                type [1] : string,
                value
        )

Arguments

   type

   Either a string indicating the variable type whose default missing
   value you want to change, or the special keyword "all" indicating you
   want to do something special to all the default missing values (see
   below).
   value

   Either the scalar value representing a missing value you want to set,
   or the a string value for the "all" special behavior you want to change
   (see below).

Description

   set_default_fillvalue allows you to change the default missing value
   for a particular variable type.

   You can use a type of "all" to control the behavior of all default
   missing values. See the examples below.

See Also

   default_fillvalue, ismissing

Examples

   Example 1 Set the default missing values for various types:
  set_default_fillvalue("ubyte",   -1B)
  set_default_fillvalue("short",   -99s)
  set_default_fillvalue("integer", -999)
  set_default_fillvalue("float",   1.e20)
  set_default_fillvalue("double",  -99999)
  set_default_fillvalue("int64",   -99999I)
  set_default_fillvalue("string",  "")

   Example 2 Set all the default missing values to their original values
   in earlier versions of NCL:

  set_default_fillvalue("all","ncl_v5")

   Example 3 Set all the default missing values back to their current
   default values:

  set_default_fillvalue("all","default")


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

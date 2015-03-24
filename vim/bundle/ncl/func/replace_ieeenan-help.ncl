THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/replace_ieeenan.shtml
THE_TITLE:replace_ieeenan
   NCL Home > Documentation > Functions > Variable manipulators

replace_ieeenan

   Changes all occurrences of IEEE NaN to a user-specified value.

Prototype

        procedure replace_ieeenan (
                x          : float or double,
                value  [1] : float or double,
                option [1] : integer
        )

Arguments

   x

   An array of any dimensionality and of type float or double.
   value

   The value to use for replacing the NaN values.
   option

   Currently not used. Set to 0.

Description

   This procedure replaces all occurrences of NaN in x with the given
   value value. If value is to become the _FillValue associated with x, it
   is the user's responsibility to set the _FillValue.

   Important note: this function and isnan_ieee use potentially
   non-portable code to determine whether a number is a NaN. Exercise
   caution when using these functions.

See Also

   isnan_ieee

Examples

   Assume the array x has been calculated or has been read from some file.
   Use the isnan_ieee function along with the any function to determine if
   x contains any NaNs. If so, then use the replace_ieeenan procedure to
   change all occurrences of NaN to a user-specified value:

  if (any(isnan_ieee(x))) then
      value = 1.e20
      replace_ieeenan (x, value, 0)
      x@_FillValue = value
  end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/get_ncl_version.shtml
THE_TITLE:get_ncl_version
   NCL Home > Documentation > Functions > System tools

get_ncl_version

   Returns the current NCL version.

Prototype

        function get_ncl_version (
        )

        return_val [1] :  string

Return value

   Returns a singly dimensioned string containing the version of NCL being
   used.

Description

   This function returns the version number of NCL being used.

Examples

   Example 1

   Print the current NCL version:
  nclv  = get_ncl_version()  ; string
  print(nclv)                ; Or, just print(get_ncl_version())

   A string similar to the following is returned:

   Example 2

   Use NCL's type converters to extract the integer version number.
  nclv_c = stringtochar(nclv)
  nclv_i = stringtointeger( chartostring(nclv_c(8:9)) )

  if (nclv_i.lt.33) then
      print("Want version 4.2.0.a033 or newer")
      exit
  end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

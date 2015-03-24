THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/getvaratts.shtml
THE_TITLE:getvaratts
   NCL Home > Documentation > Functions > Metadata routines

getvaratts

   Returns a list of attribute names for the given variable or file
   pointer.

Prototype

        function getvaratts (
                var
        )

        return_val [*] :  string

Arguments

   var

   Any NCL variable, or a pointer to a file opened with addfile.

Return value

   A string array containing all the names of the attributes attached to
   the variable or file.

Description

   This function returns a list of attribute names for a given NCL
   variable. It can also be used to return the global attributes for a
   file variable opened with addfile.

   If the variable or file pointer has no attributes, then the default
   missing value for the type "string" is returned.

See Also

   getvardims

Examples

   Example 1

  f = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/Tstorm.cdf","r")

  reftime = f->reftime
  lat     = f->lat
  print(getvaratts(reftime))    ; should be (/"units","long_name"/)
  print(getvaratts(lat))        ; should be a missing value

   Example 2

   This example pulls the global attributes off a file and prints out
   their values:
  f = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/uv300.nc","r")

  file_atts = getvaratts(f)

  print(file_atts)

  if(.not.any(ismissing(file_atts))) then
    do i=0,dimsizes(file_atts)-1
      print("Attribute " + file_atts(i) + " = " + f@$file_atts(i)$)
   end do
  end if

   The output will be:

(0)     title
(1)     source
(2)     history
(3)     Conventions
(4)     creation_date
(5)     references
(0)     Attribute title = UV300: January and July
(0)     Attribute source = Climate Analysis Section, NCAR
(0)     Attribute history = Dataset uv300.hs from EZPLOT demo dataset
(0)     Attribute Conventions = None
(0)     Attribute creation_date = Mon Mar 29 09:24:57 MST 1999
(0)     Attribute references =
EZPLOT for Publication Quality Plots
Christian Guillemot
NCAR-TN 414   1995
http://www.cgd.ucar.edu/cas/ezplot/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

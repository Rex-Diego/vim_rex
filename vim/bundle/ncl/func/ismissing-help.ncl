THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ismissing.shtml
THE_TITLE:ismissing
   NCL Home > Documentation > Functions > Metadata routines

ismissing

   Returns True for every element of the input that contains a missing
   value.

Prototype

        function ismissing (
                data
        )

        return_val [dimsizes(data)] :  logical

Arguments

   data

   A variable of any type and dimensionality.

Description

   For each element in data, ismissing returns True if the element is a
   missing value, and False otherwise.

   This is useful for filtering missing values.

See Also

   set_default_fillvalue, default_fillvalue

Examples

   Example 1

   If your data can contain all missing values, you may want to check this
   before doing a calculation on it or trying to plot it:
  if(all(ismissing(data))) then
    print("Your data is all missing. Cannot create plot.")
  else
   plot = gsn_csm_contour(wks,data,res)
  end if

   Example 2

   If you want to print a warning message if your data contains some
   missing values:
  if(any(ismissing(data))) then
    print("Your data contains some missing values. Beware.")
  end if

   Example 3

   Assume you want to calculate the standard deviation of your data, and
   you also want to know how many data points were used to calculate this
   quantity:


   x = stddev(data)
   N = num(.not.ismissing(data))

   Example 4

   The ismissing is often used in conjunction with the ind. The code
   snippet below shows how take all elements of lon_values longitude
   array, and create a new array that has the longitude values followed by
   a "E" or "W" (for "East" or "West"), or "Eq" for the equator:

  lon_labels = new(dimsizes(lon_values),string)

  lonW_index = ind(-180.lt.lon_values.and.lon_values.lt.  0)
  lonE_index = ind(   0.lt.lon_values.and.lon_values.lt.180)

  if(.not.all(ismissing(lonW_index)))
    lon_labels(lonW_index) = fabs(lon(lonW_index)) + "W"  ; west
  end if

  if(.not.all(ismissing(lonE_index)))
    lon_labels(lonE_index) = lon_values(lonE_index) + "E"  ; east
  end if

; Clean up

  delete(lonW_index)
  delete(lonE_index)
  delete(lon0_index)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

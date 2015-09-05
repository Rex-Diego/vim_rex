THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/iscoord.shtml
THE_TITLE:iscoord
   NCL Home > Documentation > Functions > Metadata routines

iscoord

   Returns True for every input string that is a coordinate variables of
   the given variable.

Prototype

        function iscoord (
                var          ,
                coord_names  : string
        )

        return_val  :  logical

Arguments

   var

   A variable of any type and dimensionality.
   coord_names

   An array of strings of any dimensionality.

Description

   For each element in the coord_names list, iscoord returns True if it is
   a coordinate variable of var, and False otherwise. If var is not a
   variable, then a single missing value is returned.

   This function is useful for checking if coordinates are attached to a
   variable before accessing them.

See Also

   isatt, isdim, isdimnamed

Examples

   Example 1

   Assume x is a 3D variable, and that we want to check if it has
   coordinate variables called "lat" and "lon"; if so, print out their
   mins and maxes:
  if(all(iscoord(x,(/"lat","lon"/)))) then
    print("min/max x&lat = " + min(x&lat) + "/" + max(x&lat))
    print("min/max x&lon = " + min(x&lon) + "/" + max(x&lon))
  end if

   Example 2

   Assume Data is a 2D array that you want to copy its data and coordinate
   arrays, if they exist, to a new variable, newData:
  newData = (/Data/)      ; Copy data only, no metadata

  if (.not.ismissing(Data!0) .and. iscoord(Data,Data!0)) then
    newData!0        = Data!0         ; copy the dimension name
    newData&$Data!0$ = Data&$Data!0$  ; copy the coord variables
  end if
  if (.not.ismissing(Data!1) .and. iscoord(Data,Data!1)) then
    newData!1        = Data!1         ; copy the dimension name
    newData&$Data!1$ = Data&$Data!1$  ; copy the coord variables
  end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/maxind.shtml
THE_TITLE:maxind
   NCL Home > Documentation > Functions > Array query

maxind

   Returns the index of the first occurrence of a maximum value.

Prototype

        function maxind (
                arg [*] : numeric
        )

        return_val [1] :  integer or long

Arguments

   arg

   A one-dimensional numeric array.

Description

   This function scans an array for the maximum value and returns the
   index of the first occurrence of it. Missing values are ignored.
   Remember that in NCL, indexing starts at 0, not 1.

   As of version 6.0.0, this function will return a long if on a 64-bit
   system and the index value is >= 2 GB.

See Also

   minind, min, max, ind_resolve, dim_min, dim_max, dim_min_n, dim_max_n

Examples

   Example 1

   x = (/3.,2.,5.,1.,5.,2.,5.,1.,3.,2./)
   i = maxind(x)                           ; Should be 2.

   Example 2

   Find the index of the maximum value in a multi-dimensional array.
;---Create a dummy 2 x 2 x 4 array.
  a = (/(/(/1,2,3,4/), (/5,6,7,8/)/), (/(/9,1,9,8/),(/7,6,1,4/)/)/)

;---Convert to 1D
  a1D      = ndtooned(a)
  dsizes_a = dimsizes(a)

;---Resolve the 1D indices back to their original 3D array.
  indices  = ind_resolve(maxind(a1D),dsizes_a)
  print(indices)

   Example 3

   Find the latitude and longitude location of the maximum value in a two
   dimensional array.
;---X is a two dimensional array dimensioned lat x lon
  dims = dimsizes(X)
  x1d = ndtooned(X)      ; convert 2D array to 1D for use in maxind
  inds = ind_resolve(maxind (x1d), dims)    ; convert 1D array back to 2D
  ilat = inds(0,0)        ; select the latitude index where the X array is at it
s' maximum
  ilon = inds(0,1)        ; select the longitude index where the X array is at i
ts' maximum
  lat_max = X&lat(ilat)   ; insert the latitude index into the lat coordinate va
riable
  lon_max = X&lon(ilon)   ; insert the longitude index into the lon coordinate v
ariable
  print("Maximum value located at "+lat_max+", "+lon_max)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

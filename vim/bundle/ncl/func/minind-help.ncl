THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/minind.shtml
THE_TITLE:minind
   NCL Home > Documentation > Functions > Array query

minind

   Returns the index of the first occurrence of a minimum value.

Prototype

        function minind (
                arg [*] : numeric
        )

        return_val [1] :  integer or long

Arguments

   arg

   A one-dimensional numeric array.

Description

   This function scans an array for the minimum value and returns the
   index of the first occurrence of it. Missing values are ignored.
   Remember that in NCL, indexing starts at 0, not 1.

   As of version 6.0.0, this function will return a long if on a 64-bit
   system and the index value is >= 2 GB.

See Also

   maxind, min, max, ind_resolve, dim_min, dim_max, dim_min_n, dim_max_n

Examples

   Example 1

   x = (/3.,2.,5.,1.,5.,2.,5.,1.,3.,2./)
   i = minind(x)                           ; Should be 3.

   Example 2

   Find the index of the minimum value in a multi-dimensional array.
;---Create a dummy 2 x 2 x 4 array.
  a = (/(/(/1,2,3,4/), (/5,6,7,8/)/), (/(/9,1,9,8/),(/7,6,1,4/)/)/)

;---Convert to 1D
  a1D      = ndtooned(a)
  dsizes_a = dimsizes(a)

;---Resolve the 1D indices back to their original 3D array.
  indices  = ind_resolve(minind(a1D),dsizes_a)
  print(indices)

   Example 3

   Find the latitude and longitude location of the minimum value in a two
   dimensional array.
;---X is a two dimensional array dimensioned lat x lon
  dims = dimsizes(X)
  x1d = ndtooned(X)      ; convert 2D array to 1D for use in minind
  inds = ind_resolve(minind (x1d), dims)    ; convert 1D array back to 2D
  ilat = inds(0,0)        ; select the latitude index where the X array is at it
s' minimum
  ilon = inds(0,1)        ; select the longitude index where the X array is at i
ts' minimum
  lat_min = X&lat(ilat)   ; insert the latitude index into the lat coordinate va
riable
  lon_min = X&lon(ilon)   ; insert the longitude index into the lon coordinate v
ariable
  print("Minimum value located at "+lat_min+", "+lon_min)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

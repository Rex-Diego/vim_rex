THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ndtooned.shtml
THE_TITLE:ndtooned
   NCL Home > Documentation > Functions > Array manipulators

ndtooned

   Converts a multi-dimensional array to a one-dimensional array.

Prototype

        function ndtooned (
                val
        )

        return_val [*] :  typeof(val)

Arguments

   val

   An array of any dimensionality or type.

Description

   This function converts a multi-dimensional array to a one-dimensional
   array that has a length equal to product(dimsizes(val)).

See Also

   onedtond, reshape

Examples

   Example 1

    a = (/(/1,2,3/),(/4,5,6/),(/7,8,9/)/)
    b = ndtooned(a)
    print(b)    ; should be (/1,2,3,4,5,6,7,8,9/)

   Example 2

   Consider x(ntim,nlat,mlon). Here the 'ntim' dumension contains monthly
   data for multiple years. Let's say that you want to create a new arrays
   that contain just January, February, March values.
  nyears = ntim/12

  x1d     = ndtooned(x)
  x4d     = onedtond(x1d,(/nyears,12,nlat,nlon/))

; The above two lines can also be written as one line:
; x4d     = onedtond(ndtooned(x),(/nyears,12,nlat,nlon/))

  x_jfm   = x4d(:,0:2,:,:)  ;  now subscript the second dimension for the desire
d months you want:

   Further, lets say that the January, Feb, December are desired or March,
   July, October, November:

   x_djf  = x4d(:,(/0,1,11/),:,:)
   x_mjon = x4d(:,(/2,6,9,10/),:,:)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/onedtond.shtml
THE_TITLE:onedtond
   NCL Home > Documentation > Functions > Array manipulators

onedtond

   Converts a one-dimensional array to a multi-dimensional array.

Prototype

        function onedtond (
                val   ,
                dims  : integer or long
        )

        return_val [dims] :  typeof(val)

Arguments

   val

   A one-dimensional array of any type.
   dims

   A one-dimensional array of positive values that represent the desired
   output dimensionality.

Description

   This function converts any one-dimensional array to a multi-dimensional
   array. If the product of the output dimension sizes is less than the
   number of elements in the input array, a warning is printed, but the
   output array is filled with as many values from the input as will fit.
   If the product of the output dimension sizes is greater than the input
   size, then the input is repeatedly copied as many times as will fit. If
   the fit is uneven, an error message is printed.

   As of version 6.0.0, this function allows "long" input for the dims
   argument, which potentially allows you to have values greater than or
   equal to 2 gigabytes (GB) on a 64-bit system.

See Also

   ndtooned, reshape

Examples

   Example 1

        a = (/1,2,3,4,5,6,7,8/)
;
; Basic case where input and output have same number of elements
;
        a0 = onedtond(a,(/2,4/))
;
; Case where there are twice the number of elements in the output
; as the input. In this case the values of a are copied twice
;
        a1 = onedtond(a,(/2,8/))

;
; Case where there are half the number of elements in the output
; as the input. In this case only the first four values of a
; are copied to the output.
; The following case generates a WARNING.
;
        a2 = onedtond(a,(/2,2/))

;
; Case where there are more elements in output than input but
; number_output % number_input is not 0
; The following case generates a WARNING.
;
        a3 = onedtond(a,(/2,7/))


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

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/reshape.shtml
THE_TITLE:reshape
   NCL Home > Documentation > Functions > Array manipulators

reshape

   Reshapes a multi-dimensional array to another multi-dimensional array.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function reshape (
                val   ,
                dims  : integer or long
        )

        return_val [dims] :  typeof(val)

Arguments

   val

   A multi-dimensional array of any type.
   dims

   A one-dimensional array of positive values that represent the desired
   output dimensionality.

Description

   This function converts any multi-dimensional array to another
   multi-dimensional array. If the product of the output dimension sizes
   is not equal to the number of elements in the input array, it will exit
   with a fatal error.

   Metadata are not copied, except for the "_FillValue" attribute. To copy
   metadata, use copy_VarMeta.

   Note: a bug was fixed in version 6.1.1 which caused this function to
   only allow numeric types. It will now handle other types, like strings.

See Also

   reshape_ind, conform, conform_dims, ndtooned, onedtond

Examples

   Example 1

    x        = random_uniform(-100,100,(/10,20,30/))
    xreshape = reshape(x,(/200,30/))

   Example 2

   Consider x(ntim,nlat,mlon), where the 'ntim' dumension contains monthly
   data for multiple years, starting in January. Let's say that you want
   to create a new array 'xjfm' that contains just January, February,
   March values.
  nyears = ntim/12

  x4d  = reshape(x,(/nyears,12,nlat,nlon/))
  xjfm = reshape(x4d(:,0:2,:,:),(/nyears*3,nlat,nlon/))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

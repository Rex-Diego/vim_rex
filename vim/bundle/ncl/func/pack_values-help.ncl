THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/pack_values.shtml
THE_TITLE:pack_values
   NCL Home > Documentation > Functions > Type converters

pack_values

   Compress values of type float or double to values of type short or
   byte.

   [new.gif] Available in version 4.2.0.a033 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function pack_values (
                x         : float or double,
                packType  : string,
                opt       : logical
        )

        return_val [dimsizes(x)] :  short or byte

Arguments

   x

   An array of type float or double of any dimensionality.
   packType

   A string which specifies the type of the returned compressed elements.
   Only two values are recognized "short" or "byte".
   opt

   opt=False means the function will determine the mimimum and maximum
   values and, hence, the range, scale_factor and add_offset.

   opt=True means the user wishes to specify the values of certain
   variables used by the algorithm. Only users who are knowledgeable and
   have tested that the specified values are appropriate should use these
   options. No error checking is done. The algorithm uses the specified
   values directly.

   The user may specify:
     * the minimum (opt@min_value) and maximum (opt@max_value) values to
       be used by the function. Thus the user explicitly specifies the
       range. The scale_factor and add_offset are derived using these
       values.
       or
     * the scale_factor (opt@scale_factor) and add_offset (opt@add_offset)
       values to be used by the function.

Return value

   The results are returned in an array of the type specified by packType
   and with the same dimensionality as x. Metadata is preserved.
   Additional attributes, including scale_factor and add_offset, are
   returned.

Description

   A standard "lossy" approach to "packing" data is used NOTE: THE
   ORIGINAL INPUT VALUES CAN NOT BE RECOVERED.
     pMax  = 2^15 - 1      ; packType = "short"
     pMax  = 2^7  - 1      ; packType = "byte"

     xMin  = min(x)
     xMax  = max(x)
     scale_factor = (xMax-xMin)/pMax
     add_offset   = (xMax+xMin)/2

     xPack = (x-add_offset)/scale_factor

   The functions short2flt and byte2flt can be used to unpack the values.

   If a _FillValue attribute is associated with the the input x array then
   a _fillValue will be associated with the returned packed (compressed)
   array. The default for a "short" variable is 32767 and for "byte" is
   127.

See Also

   short2flt, byte2flt inttoshort, inttobyte

Examples

   Example 1

   Compress values of type "float" to type "short". Then unpack the
   values.
      load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
       :
       :
      xFloat   = random_uniform (-500,1000, 10)

      xShort   = pack_values(xFloat, "short", False)
      printVarSummary(xShort)

      xUnpack  = short2flt(xShort)

      print(xFloat+"   "+xShort+"  "+xUnpack)

   The (edited) output yields

Variable: xShort
Type: short
Total Size: 20 bytes
            10 values
Number of Dimensions: 1
Dimensions and sizes:   [10]
Coordinates:
Number Of Attributes: 5
  add_offset         :  231.0105
  scale_factor       :    0.03052273
  vMin_original_data : -269.0587
  vMax_original_data :  731.0798
  vRange             :  1000.138

        xFloat      xShort    xUnpack

        -14.434     -8041     -14.422
        -13.412     -8007     -13.385
        240.081       297     240.076
        -66.905     -9760     -66.891
         29.510     -6601      29.53
       -269.050    -16383    -269.043
        349.317      3876     349.317
        731.080     16383     731.065
        -11.758     -7953     -11.737
         10.120     -7236      10.148


   Example 2

   Using the same xFloat as above but with xFloat(3) set to _FillValue.
  xFloat@_FillValue = 1.e20
  xFloat(3) = xFloat@_FillValue

   The (edited) output yields

Variable: xShort
[snip]
  _FillValue         :  32767    <=== default _FillValue
  add_offset         :  231.0105
  scale_factor       :    0.03052273
  vMin_original_data : -269.0587
  vMax_original_data :  731.0798
  vRange             : 1000.138

        xFloat      xShort    xUnpack

       -14.434      -8041     -14.423
       -13.412      -8007     -13.385
       240.081        297     240.076
         1e+20      32767       32767.    <=== _FillValue
        29.509      -6601      29.530
      -269.059     -16383    -269.043
       349.317       3876     349.317
       731.080      16383     731.065
       -11.758      -7953     -11.737
        10.119      -7236      10.148


   The user may wish to reset the _FillValue attribute and array elements
   to (say) 1.e20 upon return.
      xUnpack@_FillValue = 1.e20      ; all occurrences of _FillValue=32767
                                      ; will be set to 1.e20

   Example 3

   Same as Example 2 but the user specifies the min_value and max_value
   attributes to be used by the algorithm.
      opt = True
      opt@min_value = -2000.
      opt@max_value =  2000.
      xShort   = pack_values(xFloat, "short", opt)

   The (edited) output yields

Variable: xShort
[snip]
  _FillValue          :  32767
  add_offset          :   0
  scale_factor        :    0.122074
  vMin_original_data  : -269.0587
  vMax_original_data  :  731.0798
  vMin_user_specified : -2000           <=== used by algorithm
  vMax_user_specified :  2000           <=== used by algorithm

        xFloat     xShort    xUnpack

        -14.434     -118     -14.423
        -13.412     -109     -13.385
        240.081     1966     240.076
          1e+20    32767       32767.
         29.560      241      29.530
       -269.059    -2204    -269.043
        349.317     2861     349.317
        731.080     5988     731.065
        -11.758      -96     -11.737
         10.119       82      10.148


   Example 4

   Same as Example 2 but the user specifies the scale_factor and
   add_offset attributes to be used by the algorithm.
      opt = True
      opt@scale_factor =  0.1
      opt@add_offset   =  0.0
      xShort   = pack_values(xFloat, "short", opt)

   The (edited) output yields


Variable: xShort
[snip]
  add_offset          :     0          <=== used by algorithm
  scale_factor        :     0.1        <=== used by algorithm
                                       ++++ the following are calculated but not
 used
  vMin_original_data  :  -269.0587
  vMax_original_data  :   731.0798
  vRange              :  1000.138

        xFloat     xShort    xUnpack

       -14.434      -144     -14.4
       -13.412      -134     -13.4
       240.081      2400     240.0
         1e+20     32767     32767.
        29.510       295      29.5
      -269.059     -2690    -269.0
       349.317      3493     349.3
       731.080      7310     731.0
       -11.758      -117     -11.7
        10.120       101      10.1


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

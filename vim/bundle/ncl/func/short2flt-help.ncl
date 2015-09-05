THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/short2flt.shtml
THE_TITLE:short2flt
   NCL Home > Documentation > Functions > Type converters

short2flt

   Converts values of type short to values of type float using the "scale"
   and "offset" attributes (if present).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function short2flt (
                x  : short
        )

        return_val [dimsizes(x)] :  float

Arguments

   x

   An array of type short of any dimensionality.

Return value

   The results are returned in a float array of the same type
   dimensionality as x. Metadata is preserved.

Description

   This function converts short data to float using the "scale" and
   "offset" attributes (if present), and preserves metadata.

   Other attributes similar to "scale" and "offset" will be recognized:

   offset:
          "add_offset", "OFFSET", "Offset", "_offset", "Intercept",
          "intercept"

   scale:
          "SCALE", "Scale", "_scale", "scale_factor", "Scale_factor",
          "Slope" , "slope"

   Note: this function is slightly different than the built-in set of
   conversion functions (like floattointeger and shorttobyte), because it
   requires loading the "contributed.ncl" script and it preserves
   metadata. It has a slightly different naming style than the built-in
   functions, just to set it apart from these other functions.

See Also

   dble2flt, flt2dble, byte2flt, typeof, getfilevartypes

Examples

   Example 1

   The file "air.2m.gauss.1979.nc" contains temperatures at 2 meters. The
   data are store as type "short" with a scale_factor and add_offset:
        short air(time, level, lat, lon) ;
                air:long_name = "Daily Forecast of Air temperature at 2 m" ;
                air:units = "degK" ;
                air:add_offset = 447.65f ;
                air:scale_factor = 0.01f ;
                [SNIP]

   Convert to type "float" as the data are being read:
 load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

begin
  f    = addfile("air.2m.gauss.1979.nc" , "r")
  t2m  = short2flt( f->air )
  printVarSummary(t2m)
end


   The output contains
Variable: t2m
Type: float
Total Size: 26350080 bytes
            6587520 values
Number of Dimensions: 4
Dimensions and sizes:   [time | 365] x [level | 1] x [lat | 94] x [lon | 192]
Coordinates:
            time: [1569072..1577808]
            level: [ 2.. 2]
            lat: [88.542..-88.542]
            lon: [ 0..358.125]
Number Of Attributes: 18
  long_name :   Daily Forecast of Air temperature at 2 m
            [SNIP]

   NOTE 1: it is possible to test a variable's type prior to reading the
   variable to memory. Using the above example:
  f    = addfile("air.2m.gauss.1979.nc" , "r")
  if (getfilevartypes (f,"air").eq."short") then)
      t2m  = short2flt( f->air )
  else
      t2m  = f->air
  end if

   NOTE 2: The above file's time units are "hours since 1800-1-1
   00:00:0.0". Many people find these units rather cumbersome to use. To
   convert to more 'human readable' time units the ut_calendar function
   can be used:
   ymdh = ut_calendar(time, 0)          ; ymdh(:,0:5)
   yyyymmddhh = ut_calendar(time, -3)   ; integer


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

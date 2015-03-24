THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/atan2.shtml
THE_TITLE:atan2
   NCL Home > Documentation > Functions > General applied math

atan2

   Computes the inverse tangent of (y/x) for numeric types.

Prototype

        function atan2 (
                y  : numeric,
                x  : numeric
        )

        return_val [dimsizes(y)] :  float or double

Arguments

   y

   One or more values of any dimension.
   x

   One or more values with the same dimension as y

Return value

   Returns an array dimensioned the same as input arguments x and y, in
   radians. The return type is double if the input is double, and float
   otherwise.

Description

   This function returns the inverse tangent of (y/x) in the range -p <=
   return_val <= p, using the signs of both arguments to determine the
   quadrant of the return value. Missing values are ignored.

See Also

   acos, asin, atan

Examples

   Example 1

   Compute the meteorological wind direction given the zonal (u) and
   meridional (v) wind components. The meteorological direction tells from
   which direction the wind is blowing.
    r2d = 45.0/atan(1.0)     ; conversion factor (radians to degrees)

    u   =  10.0
    v   =  10.0
    dir = atan2(u, v) * r2d + 180   ; ===> dir = 225.0

    u   =  10.0
    v   = -10.0
    dir = atan2(u, v) * r2d + 180   ; ===> dir = 315.0

    u   = -10.0
    v   =  10.0
    dir = atan2(u, v) * r2d + 180   ; ===> dir = 135.0

    u   = -10.0
    v   = -10.0
    dir = atan2(u, v) * r2d + 180   ; ===> dir =  45.0

    u   =  10.0
    v   =   0.0
    dir = atan2(u, v) * r2d + 180   ; ===> dir = 270.0

    u   = -10.0
    v   =   0.0
    dir = atan2(u, v) * r2d + 180   ; ===> dir =  90.0

    u   =   0.0
    v   =  10.0
    dir = atan2(u, v) * r2d + 180   ; ===> dir = 180.0

    u   =   0.0
    v   = -10.0
    dir = atan2(u, v) * r2d + 180   ; ===> dir = 360.0   [same as 0.0]


    u   =   0.0
    v   =   0.0
    dir = atan2(u, v) * r2d + 180   ; ===> dir = 180.0
                                                    [arbitrary]
                                                    [should be undefined]


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

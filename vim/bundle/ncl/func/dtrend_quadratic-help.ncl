THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dtrend_quadratic.shtml
THE_TITLE:dtrend_quadratic
   NCL Home > Documentation > Functions > General applied math

dtrend_quadratic

   Estimates and removes the least squares quadratic trend of the
   rightmost dimension from all grid points.

Prototype

        function dtrend_quadratic (
                y       : numeric,
                option  : integer
        )

        return_val [dimsizes(y)] :  numeric

Arguments

   y

   A multi-dimensional array or scalar value equal to the data to be
   detrended. The dimension from which the trend is calculated needs to be
   the rightmost dimension. This is usually time. Missing values are not
   allowed. Use dtrend_quadratic_msg_n if missing values are present.
   option

   Currently not used (set to 0).

Return value

   An array of the same size as y. Double if y is double, float otherwise.

Description

   Estimates and removes the least squares quadratic trend of the
   rightmost dimension from all grid points. Missing values are not
   allowed.

See Also

   dtrend_quadratic_msg_n, dtrend_msg_n, dtrend_msg, dtrend_n, dtrend

Examples

   Example 1

   y is three-dimensional with dimensions lat, lon, and time. The returned
   array will have the same size. Remember that the mean is also removed.
    yDtrend = dtrend_quadratic(y,0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

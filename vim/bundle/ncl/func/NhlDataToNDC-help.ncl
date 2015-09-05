THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlDataToNDC.shtml
THE_TITLE:NhlDataToNDC
   NCL Home > Documentation > Functions > Type converters

NhlDataToNDC

   Converts data units into normalized device coordinates (NDCs).

Prototype

        procedure NhlDataToNDC (
                plot  [1] : graphic,
                x_in  [*] : float,
                y_in  [*] : float,
                x_out [*] : float,
                y_out [*] : float
        )

Arguments

   plot

   A plot object that can be created by using one of the many gsn plotting
   functions, or by calling the NCL create language construct.
   x_in
   y_in

   One-dimensional arrays of x and y data coordinates. They must be the
   same length. For map plots, x_in corresponds to longitude values, and
   y_in corresponds to latitude values.
   x_out
   y_out

   (output)
   One-dimensional arrays of the same size as x_in and y_in. These will
   contain the x and y NDC output values.

Description

   The NhlDataToNDC procedure uses the built-in transformation mapping
   feature of NCL plot objects to map data coordinates into Normalized
   Device Coordinates (NDCs).

   The NhlDataToNDC procedure maps coordinate pairs from x_in and y_in and
   places the results in the corresponding elements of x_out and y_out
   respectively. Both x_out and y_out can be the same variables as x_in
   and y_in.

   When the data coordinates are outside of the data transformation
   specified in the plot, a missing value is placed in both of the
   corresponding indexes in the output arrays. The missing value chosen is
   either the x_in missing value, y_in missing value, or a system default.

   Note: this procedure is identical to the datatondc procedure, and we
   encourage the use of datatondc instead (saves having to type longer
   names and capital letters).

See Also

   datatondc, ndctodata

Examples

   See the examples for datatondc.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlNDCToData.shtml
THE_TITLE:NhlNDCToData
   NCL Home > Documentation > Functions > Type converters

NhlNDCToData

   Converts normalized device coordinates (NDCs) into data coordinates.

Prototype

        procedure NhlNDCToData (
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

   One-dimensional arrays of x and y NDC coordinates. They must be the
   same length.
   x_out
   y_out

   (output)
   One-dimensional arrays of the same size as x_in and y_in. These will
   contain the x and y data coordinate output values. For map plots, x_out
   corresponds to longitude values, and y_out corresponds to latitude
   values.

Description

   The NhlNDCToData procedure uses the built-in transformation mapping
   feature of NCL plot objects to map NDC coordinates into data
   coordinates.

   The NhlNDCToData procedure maps coordinate pairs from x_in and y_in and
   places the results in the corresponding elements of x_out and y_out,
   respectively. Both x_out and y_out can be the same variables as x_in
   and y_in.

   When the data coordinates are outside the NDC viewport specified in the
   plot, a missing value is placed in both of the corresponding indexes in
   the output arrays. The missing value chosen is either the x_in missing
   value, y_in missing value, or a system default.

   Note: this procedure is identical to the NhlNDCToData procedure, and we
   encourage the use of NhlNDCToData instead (saves having to type longer
   names and capital letters).

See Also

   ndctodata, datatondc

Examples

   See the examples for ndctodata.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

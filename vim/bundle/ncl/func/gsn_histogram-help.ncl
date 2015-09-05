THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_histogram.shtml
THE_TITLE:gsn_histogram
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_histogram

   Draws a histogram plot on the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_histogram (
                wks     : graphic,
                data    : numeric,
                res [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   data

   The data for the histogram. The data must either be one-dimensional for
   a single histogram, or two-dimensional where two histogram fields are
   drawn.
   res

   A variable containing an optional list of resources to apply to the
   histogram, attached as attributes. Set to True if you want the attached
   attributes to be applied, and False if you either don't have any
   resources to set, or you don't want the resources applied.

Return value

   A scalar id of the histogram plot created is returned. In addition,
   several attributes are returned:
     * NumInBins - an array of the number of items in each bin.
     * BinLocs - an array of the values of the bin locations. This will be
       the end points of each bin if you have intervals, or the actual
       values if you have discrete values. Available in version 5.1.0 and
       later.
     * NumMissing - the number of missing values (if any).
     * Percentages - an array of percentages indicating the distribution
       of the bin values (missing values are counted in total)
     * PercentagesNoMissing - an array of percentages indicating the
       distribution of the bin values (missing values are not counted in
       total)

   The following three attributes contain X locations of the bars so you
   can annotate them as necessary. See example 12 on the histogram
   applications page. Available in version 4.3.0 and later.
     * BeginBarLocs - an array indicating the X positions of the beginning
       location of each bar.
     * MidBarLocs - an array indicating the X positions of the mid point
       location of each bar.
     * EndBarLocs - an array indicating the X positions of the end
       location of each bar.

Description

   This function draws a histogram plot. Two histogram fields are drawn if
   data is two-dimensional. If missing values are encountered in data,
   then they are ignored.

   If intervals are desired (instead of discrete values), then the values
   are counted as follows (assume there are n values, and thus n-1 bins):
  value1 <= bin1 <= value2 < bin2 <= value3 ...
       valuen-1 < binn-1 <= valuen

   There are many resources specific to this function. See the
   gsnHistogram resources for a full list.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

   If the user has a multidimensional array, say x(time,lat,lon), and a
   histogram of the entire array is desired, the function ndtooned may be
   used to reshape the array.
       plot=gsn_histogram(wks,ndtooned(x),False)

   Further, if it is desired to plot a histogram for values between 30S
   and 30N latitude:
       plot=gsn_histogram(wks,ndtooned(x(:,{-30:30},:)),False)

See Also

   Special gsn resources

   ndtooned,pdfx

Examples

   For some application examples, see the suite of histogram plot
   examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

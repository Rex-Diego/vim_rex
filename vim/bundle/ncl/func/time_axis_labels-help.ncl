THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/User_contributed/time_axis_labels.shtml
THE_TITLE:time_axis_labels
   NCL Home > Documentation > Functions > Date routines

time_axis_labels

   Sets resources necessary to draw nice tickmark labels using a format of
   date/time on an axis.

   [new.gif] Available in version 5.2.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/time_axis_labels.ncl"

        procedure time_axis_labels (
                time     : numeric,
                resplot  : logical,
                restick  : logical
        )

Arguments

   time

   An array containing the values of time. This variable should have an
   attribute named "units". In other words, this variable holds the values
   of the coordinate axis 'time' along with the units.
   resplot

   This should be the resource list that will be passed to your plotting
   function. It can have any other attributes, as usual, but only the
   tmZZMode, tmZZValues and tmZZLabels are changed inside this procedure
   (where ZZ is one of XB, XT, YL or YR depending on which axis to mark).
   restick

   Special "ttm" resources for the time axis tick formats. If this
   variable is set to True, then its attributes are used to format the
   time axis. See the description section below for more details.

Description

   This procedure modifies the resplot resource list to add the necessary
   "tm" resources for generating nice time labels on the X or Y axis.
   resplot is the resource list you should eventually pass to the plotting
   routine, like gsn_csm_xy or gsn_csm_contour.

   The restick resource list allows you to specify how you want the time
   labels formatted, by attaching special "ttm" attributes. Valid
   attributes for restick are:

   ttmFormat
          A string specifying the format of the tick labels.

          This string is parsed as follows: the '%' acts as the escape
          character. The single character after every '%' is formatted
          according to the rule:

          Y => 4-digit year (e.g., 2007).
          y => 2-digit year (e.g., 07).
          C => CAPITAL month abbreviation (e.g., JUN).
          c => Small month abbreviation (e.g., Jun).
          F => CAPITAL full month (e.g., JUNE).
          f => Small full month (e.g., June).
          N => 2-digit month (e.g., 06).
          n => 1 or 2 digit month (e.g., 6 for June, 12 for December).
          D => 2-digit day (e.g., 04).
          d => 1 or 2 digit day (e.g., 4)
          H => 2-digit hour (e.g., 09).
          h => 1 or 2 digit hour (e.g., 9 or 11).
          M => 2 digit minute (e.g., 08).
          m => 1 or 2 digit minute (e.g., 07 or 56).
          S => 2 digit second (e.g., 02).
          s => 1 or 2 digit second (e.g., 2 or 23).

          Any character at any other place in the format string is drawn
          as is. NOTE: a '%' can be drawn using "%%".

          If ttmFormat is absent, a minimal algorithm exists which tries
          to determine the format string depending on the length and
          values of the date-time.

   ttmAxis
          A string that can have values "XB", "XT", "YL", or "YR"
          depending on which axis is to label. Default is "XB".

   ttmValues
          An Mx6 integer array containing M date-time values where tick
          labels should be marked. The 2nd dimension should contain the
          values of year, month, day, hour, minute and second in this
          order. If this attribute is missing, the script tries to
          determine the axis values for tickmarks from the length of the
          data.

   ttmNumTicks
          Approximate number of tick labels. Used only when ttmValues is
          absent. Default value of this parameter is 4.

   ttmMajorStride
          Number of timesteps desired between major tickmarks. Note that
          this trumps ttmNumTicks, but not ttmValues.

   ttmMinorStride
          Number of timesteps desired between minor tickmarks.

   Side effects:

     * Values of tmZZMode, tmZZValues and tmZZLabels (ZZ = one of XB, XT,
       YL, YR) will be set.
     * resplot will be set to True inside this procedure.

   Acknowledgement:

   This procedure was written by:

     Arindam Chakraborty
     Centre for Atmospheric and Oceanic Sciences (CAOS)
     Indian Institute of Science
     arch at caos.iisc.ernet.in

See Also

   cd_string, ut_string, cd_calendar, cd_inv_calendar

Examples

   For all the following examples, assume:
     * time = the time variable
     * y = the variable to plot
     * resplot@... = general resources variable

   Example 1

  resplot = True
  restick = True
  restick@ttmFormat = "%c%y"
  time_axis_labels(time,resplot,restick) ; call the formatting procedure

  plot = gsn_csm_xy(wks,time,y,resplot) ; will produce bottom x-axis ticks
                                          ; as CccYy (Apr98, May98 etc).

   Example 2

  resplot = True
  restick = True
  restick@ttmFormat = "%N/%Y"
  restick@ttmAxis = "YL"
  time_axis_labels(time,resplot,restick)
  plot = gsn_csm_xy(wks,y,time,resplot) ; will produce left y-axis ticks
                                         ; as NN/YYYY (04/1998, 05/1998 etc).

   Example 3

  resplot = True
  restick = True
  restick@ttmValues = (/(/1998,4,16,0,0,0/), \
                      (/1998,6,16,0,0,0/), \
                      (/1998,8,16,0,0,0/), \
                      (/1998,10,16,0,0,0/), \
                      (/1998,12,16,0,0,0/), \
                      (/1999,2,16,0,0,0/)/)
  time_axis_labels(time,resplot,restick)
  plot = gsn_csm_xy(wks,time,y,resplot) ; will produce bottom x-axis ticks
                                         ; at Apr 16, 1998, June 16, 1998 etc.
                                         ; ttmFormat will be determined in the
                                         ; procedure.
                                         ; Specify ttmFormat attribute to overri
de the default.

   Example 4

 ...
 resplot@ttmFormat = "%H:%M:%S" ; will produce HH:MM:SS kind of time formatting.
                                ; To specify month/day as well, use:
 resplot@ttmFormat = "%N/%D %H:%M:%S"

   Example 5

   To write hour values as "HH:00 Hours" use:

  resplot@ttmFormat = "%H:00 Hours"

   Example 6

 restick = True
 restick@ttmFormat = "%d %c"
 restick@ttmAxis = "YL"
 restick@ttmMajorStride = 20
 time_axis_labels( data&time,  res, restick )
 plot = gsn_csm_hov( wks, data, res ) ; will produce y-axis ticks on a
                                      ; Hovmueller. Labels will be plotted every
 20th data
                                      ; timestep in the format 29 Jun, 4 Jul, et
c.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

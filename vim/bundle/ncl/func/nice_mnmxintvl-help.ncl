THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/nice_mnmxintvl.shtml
THE_TITLE:nice_mnmxintvl
   NCL Home > Documentation > Functions > Array creators

nice_mnmxintvl

   Calculates "nice" values for endpoints and spacing to be used for
   creating a series of equally-spaced levels through the data domain.

Prototype

        function nice_mnmxintvl (
                cmin       [1] : numeric,
                cmax       [1] : numeric,
                max_levels [1] : integer,
                outside    [1] : logical
        )

        return_val [3] :  numeric      ; float or double

Arguments

   cmin
   cmax

   Minimum and maximum values of your data.
   max_levels

   The maximum number of levels you want.
   outside

   Controls whether the "nice" values returned fall just outside or just
   inside the input cmin and cmax values.

Description

   Given the minimum and maximum values of a data domain and the maximum
   number of levels desired, this function calculates "nice" values for
   endpoints and spacing. The returned values can be used to create a
   series of "nice" equally-spaced levels through the data domain. The
   outside flag controls whether the returned "nice" min and max values
   are inside or outside the data range.

   An array of three elements of type float (or double if cmin and/or cmax
   are double) is returned where the first element contains the "nice"
   minimum value, the second element the "nice" maximum value, and the
   third element the spacing. If cmin or cmax is a missing value, then a
   missing value will be returned.

See Also

   symMinMaxPlt

Examples

   Example 1

   Assume data is dimensioned ny x nx. Determine consistent "nice" minimum
   and maximum values and a nice contour interval (that falls inside the
   original min/max range) to use for contour plots:
  dmin    = min(data)
  dmax    = max(data)
  maxlev  = 18
  mnmxint = nice_mnmxintvl( dmin, dmax, maxlev, False)

  res = True
  . . .
  res@cnLevelSelectionMode = "ManualLevels"
  res@cnMinLevelValF       = mnmxint(0)
  res@cnMaxLevelValF       = mnmxint(1)
  res@cnLevelSpacingF      = mnmxint(2)

   Example 2

   Assume data is dimensioned ntim x klvl ny x nx. Determine consistent
   "nice" minimum and maximum values and a nice contour intervals for each
   level to use for contour plots. Use NCL's new statement and typeof
   function to allocate memory.
  maxlev = 10
  mnmxint = new( (/klvl,3/), typeof(data) )
  do kl=0,klvl-1
     dmin   = min( data(:,kl,:,:) )
     dmax   = max( data(:,kl,:,:) )
     mnmxint(kl,:) = nice_mnmxintvl( dmin, dmax, maxlev, True)
  end if

   mnmxint will contain different "nice" min, max and contour intervals
   for each level.

   Example 3

   Assume x1-x4 and y1-y4 are dimensioned as follows: [x1(N),y1(N)],
   [x2(M),Y2(M)], [x3(K),y3(5,K)], and [x4(3,L),y4(3,L)]. Assume that a
   common set of "nice" x-y min/max values is desired for 4 different
   plots:
  minX     = min( (/ min(x1), min(x2), min(x3), min(x4) /) )
  minY     = min( (/ min(y1), min(y2), min(y3), min(y4) /) )

  maxLev   = 10
  mnmxintX = nice_mnmxintvl( minX, maxX, maxLev, True)
  mnmxintY = nice_mnmxintvl( minY, maxY, maxLev, True)

   An array of 3 elements is returned which can be used to set specific
   NCL graphic resources. For example, you could use these values to set
   the following XY plot resources:

  res@trXMinF  = mnmxintX(0)
  res@trXMaxF  = mnmxintX(1)
  res@trYMinF  = mnmxintY(0)
  res@trYMaxF  = mnmxintY(1)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

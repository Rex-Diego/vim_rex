THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/smth9_Wrap.shtml
THE_TITLE:smth9_Wrap
   NCL Home > Documentation > Functions > General applied math

smth9_Wrap

   Performs nine point local smoothing on one or more 2D grids and retains
   metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function smth9_Wrap (
                x     : numeric,
                p     : numeric,
                q     : numeric,
                wrap  : logical
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   A grid of two or more dimensions. The two rightmost dimensions are the
   dimensions to be smoothed. If missing values are present, the attribute
   x@_FillValue must be set appropriately.
   p
   q

   Two scalars which affect the degree of smoothing. In general, for good
   results, set p = 0.50. With p = 0.50, a value of q = -0.25 results in
   "light" smoothing and q = 0.25 results in "heavy" smoothing. A value of
   q = 0.0 results in a 5-point local smoother.
   wrap

   False if the rightmost dimension is not to be treated as a cyclic. True
   when the rightmost dimension is treated as cyclic. x should not include
   the cyclic point.

Return value

   Returns an array dimensioned the same as x.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function performs 9-point smoothing using the equation:

f0 = f0 + (p / 4) * (f2 + f4 + f6 + f8 - 4 * f0) + (q / 4) * (f1 + f3 + f5 + f7
- 4 * f0)

   where f0, f1 (and so on) are as indicated:

      1-------------8---------------7
      |             |               |
      |             |               |
      |             |               |
      |             |               |
      2-------------0---------------6
      |             |               |
      |             |               |
      |             |               |
      |             |               |
      3-------------4---------------5

   This function is primarily used prior to plotting for nicer looking
   plots. Missing values are allowed and are indicated by the _FillValue
   attribute (x@_FillValue).

   This function is identical to smth9 except it retains metadata.

   Notes:

    1. If a point or any of its neighbors is missing as indicated by
       x@_FillValue, the point is not smoothed. If x@_FillValue is not
       set, then the NCL default (appropriate to the type of x) will be
       assumed.
    2. This routine does not smooth the edges, only the interior with the
       exception that the left and right edges are smoothed when wrap is
       True.

See Also

   smth9

Examples

   Example 1

   Define g(ny, nx) where ny = 20, nx = 40

   The rightmost dimension is not to be treated as cyclic. The result will
   replace the input array g. g will retain any attributes and coordinate
   dimensions.

  g = smth9_Wrap(g, 0.50, -0.25, False) ; light local smoothing

   Example 2

   Define g(ntim, nlvl, nlat, mlon) where ntim = 50, nlvl = 30, nlat = 64,
   mlon = 128.

   The rightmost dimension is to be treated as "cyclic". The user should
   not add a cyclic point for the rightmost dimension; it is accounted for
   internally. All times and levels will be smoothed and returned in a new
   array gsmth.

   Note: gsmth will not have any of the attributes or coordinate
   information of the input g.
  gsmth = smth9_Wrap(g, 0.50,  0.25, True) ; heavy local smoothing

   Example 3

   Assume that the data in example 2 have named dimensions time, lvl, lat,
   lon, and that the user wishes to plot smoothed vertical cross sections.
   The returned variable gvert below will have dimension sizes ntim x mlon
   x nlvl x nlat.
  gvert = smth9_Wrap(g(time|:, lon|:, lvl|:, lat|:), -0.25, False)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

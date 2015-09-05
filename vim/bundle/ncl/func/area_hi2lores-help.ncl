THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/area_hi2lores.shtml
THE_TITLE:area_hi2lores
   NCL Home > Documentation > Functions > Regridding, Interpolation

area_hi2lores

   Interpolates from high resolution rectilinear grids to low resolution
   recitlinear grids using local area averaging.

Prototype

        function area_hi2lores (
                xi        [*] : numeric,
                yi        [*] : numeric,
                fi            : numeric,
                fiCyclicX [1] : logical,
                wy        [*] : numeric,
                xo        [*] : numeric,
                yo        [*] : numeric,
                foOption  [1] : logical
        )

        return_val  :  float or double

Arguments

   xi

   A one-dimensional array that specifies the X coordinates of the fi
   array. It must be monotonically increasing. It may be unequally spaced.
   For geo-referenced data, xi is generally the longitude array.
   yi

   A one dimensional array that specifies the Y coordinates of the fi
   array. This may be a monotonically increasing or decreasing array. It
   may be unequally spaced. For geo-referenced data, yi is generally the
   latitude array.
   fi

   An array of two or more dimensions. The two rightmost dimensions must
   of size nyi x nxi, and are the dimensions used in the interpolation. If
   missing values are present, the attribute fi@_FillValue must be set
   appropriately.
   fiCyclicX

   An option to indicate whether the rightmost dimension of fi is cyclic.
   This should be set to True only if you have global data, but your
   longitude values don't quite wrap all the way around the globe. For
   example, if your longitude values go from, say, -179.75 to 179.75, or
   0.5 to 359.5, then you would set this to True.
   wy

   A scalar or a one dimensional array containing the weights for the yi
   coordinate. If no weighting is to be used, set to 1. Otherwise, wy
   could contain (say) gaussian weights or cosines of the latitude.
   xo

   A one-dimensional array that specifies the X coordinates of the return
   array. It must be monotonically increasing, but may be unequally
   spaced. For geo-referenced data, xo is generally the longitude array.
   yo

   A one-dimensional array that specifies the Y coordinates of the return
   array. It may be monotonically increasing or decreasing. It may be
   unequally spaced. For geo-referenced data, yo is generally the latitude
   array.
   foOption

   If the variable is True then optional arguments may be present.
   Currently, only one option is available. There is an internal
   parameter, critpc, that specifies the percentage of input grid points
   within the scope of the low resolution grid point that must be present.
   The default is critpc=100 (percent). This means that if any missing
   values (_FillValue) are encountered the output grid point will be set
   to _FillValue. The user may change the default value by setting the
   foOption variable attribute, critpc, to any number [0 to 100]. A value
   of (say) critpc=70 (percent) means that a value will be returned if 70%
   of the high resolution grid points within the scope of the low
   resolution grid point are non-missing.

Return value

   The returned value will have the same dimensions as fi, except for the
   rightmost two dimensions which will have the same dimension sizes as
   the lengths of yo and xo. The return type will be double if fi is
   double, and float otherwise.

Description

   area_hi2lores uses local area averaging to interpolate from a high
   resolution rectilinear grid to a low resolution rectilinear grid. The
   method accounts for fractional contributions of the input high
   resolution grid points to the scope of each low resolution grid point.
   This is not strictly conservative remapping. However, it is reasonably
   quick and yields grids that are adequate for most purposes. Use the
   SCRIP (Spherical Coordinate Remapping and Interpolation Package) for
   conservative remapping.

   In default mode, if missing values (_FillValue) are present in the
   input high resolution grid points within the scope of a low resolution
   grid point, a missing value will be returned. Use the opt@critpc to
   alter this behavior.

   Note: If it is desired to go from a low resolution to a high resolution
   grid use bilinear resolution (linint2, linint2_Wrap) or, possibly the
   spherical harmonic regridders if the grids are global.

   If the output coordinates (xo,yo) are outside those of the input
   coordinates (xi,yi), then the fo values at those coordinates will be
   set to missing (i.e. no extrapolation is performed).

   Use area_hi2lores_Wrap if retention of metadata is desired.

   For more robust regridding, see the ESMF regridding examples, which
   show how to regrid data from and to rectilinear, curvilinear, or
   unstructured grids. Available in version 6.1.0 and later.

See Also

   area_hi2lores_Wrap, ESMF_regrid, linint1, linint2, linint2_Wrap,
   linmsg, latGauWgt, latRegWgt, NormCosWgtGlobe

Examples

   Example 1

   Assume fi is dimensioned niy x nix (100 x 400), and that the rightmost
   dimension is not to be treated as cyclic. The returned array will be of
   size noy x nox, where noy and nox are the sizes of the one-dimensional
   arrays xo and yo:
  fo = area_hi2lores (xi,yi,fi, False, 1,  xo,yo, False)

   Example 2

   Consider high resolution grid, fi(ntim,nlat,mlon), where nlat=400 and
   mlon=1440. The input latitudes span -49.875 to +49.875 (degrees_north).
   The input longitudes span -179.875 to +179.875 (degrees_east). The grid
   is cyclic and missing values are present. Create a 2x3 grid over the
   same spatial range using the default critpc [=100%] and then a second
   grid that requires only say) 50% of the high resolution grid points be
   non-missing.
  f = addfile ("foo.nc", "r")
  p = f->PRC
  printVarSummary( p )

  LON = fspan(-178.5,178.5, 120)
  LAT = fspan(-48,48, 49)
  po  = area_hi2lores (p&lon,p&lat, p , True, 1,  LON, LAT, False)  ; (ntim,49,1
20)

  opt = True
  opt@critpc = 50                ; require only 50% of the values to be precent
  PO  = area_hi2lores (p&lon,p&lat, p , True, 1,  LON, LAT, opt  )  ; (ntim,49,1
20)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

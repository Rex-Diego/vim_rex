THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/area_conserve_remap_Wrap.shtml
THE_TITLE:area_conserve_remap_Wrap
   NCL Home > Documentation > Functions > Regridding, Interpolation

area_conserve_remap_Wrap

   Performs areal conservative remapping from one rectilinear grid to
   another and preserves meta data.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function area_conserve_remap_Wrap (
                loni [*] : numeric,
                lati [*] : numeric,
                fi       : numeric,
                lono [*] : numeric,
                lato [*] : numeric,
                opt  [1] : logical
        )

        return_val  :  float or double

Arguments

   loni

   A one-dimensional array that specifies the longitudinal coordinates in
   degrees of the fi array. It must be monotonically increasing (W->E)
   with constant spacing and must be global.
   lati

   A one dimensional array that specifies the latitudinal coordinates in
   degrees of the fi array. This must be a monotonically increasing array
   (S->N). It may be unequally spaced [eg, a gaussian grid]. It may be
   global or (say) 45S to 45N. Regardless of latitudinal span, it must be
   longitudinally cyclic (periodic).
   fi

   An array of two or more dimensions. The two rightmost dimensions must
   of size nlati x nloni, and are the dimensions used in the
   interpolation. Missing values, designated by the _FillValue attribute,
   are not allowed. If any missing values are encountered, the remap will
   not be performed for that grid.
   lono

   A one-dimensional array that specifies the longitude coordinates
   (degrees) of the return array. It must be monotonically increasing and
   have constant spacing.
   lato

   A one-dimensional array that specifies the latitudinal coordinates in
   degrees of the return array. It must be monotonically increasing
   (S->N). It may be unequally spaced (eg, gaussian grid).
   opt

   If the variable is True then optional arguments may be present.

   If the input and/or output grids are Gaussian and of less than global
   extent, an optional parameter is required (opt@NLATi for input,
   opt@NLATo for output) giving the dimension of the *global* latitude set
   of which the grid is a subset. This is required in order to internally
   compute the global Gaussian weights from which local box areas are
   computed. These optional parameters are ignored for equally-spaced
   latitudinal grids.

   There is an internal parameter, bin_factor, that specifies a grid
   contraction factor. The default bin_factor=1.0. In the uncommon case of
   binning from low-to-high resolution, an optional smoothing operator,
   "opt@bin_factor", should be employed since the default behavior will
   give discontinuous looking results. This parameter expands the
   area-of-influence in the binning process. It is defined relative to
   area of an output gridbox. So, for binning from 2x2deg to 1x1deg, a
   recommended "bin_factor" would be about 4.0 to smooth the data. *NOTE*:
   the remapping will not be conservative. Remapping is conservative only
   for "bin_factor=1." which is the default.

Return value

   The returned value will have the same dimensions as fi, except for the
   rightmost two dimensions which will have the same dimension sizes as
   the lengths of lato and lono. The return type will be double if fi is
   double, and float otherwise.

Description

   area_conserve_remap uses local area-conservative binning to interpolate
   from high-to-low or low-to-high resolution rectilinear grids. The
   method accounts for fractional contributions of the input grid points
   to the scope of each output grid point. There is no provision for
   missing data. If any grid has a missing value the corresponding return
   grid will be all missing values.

   For more robust regridding, see the ESMF regridding examples, which
   show how to regrid data from and to rectilinear, curvilinear, or
   unstructured grids. Available in version 6.1.0 and later.

See Also

   area_conserve_remap, area_hi2lores_Wrap, ESMF_regrid, linint2,
   linint2_Wrap, latGau, latGauWgt, latRegWgt, NormCosWgtGlobe

Examples

   Detailed applications of area_conserve_remap and
   area_conserve_remap_Wrap are available: specifically, examples 6-11.

   Example 1

   Consider a gaussian grid fi(ntim,klev,nlati,mloni) =>
   fi(120,30,256,512).
   Remap to a 2.5x2.5 grid => fo(120,30,72,144)
  fo = area_conserve_remap_Wrap (loni,lati,fi, lono,lato, False)

   Example 2

   Consider high resolution grid, fi(ntim,nlati,mloni), where nlati=400
   and mloni=1440. The input latitudes span -49.875 to +49.875
   (degrees_north). The input longitudes span -179.875 to +179.875
   (degrees_east). The grid is cyclic and no missing values are present.
   Create a T85 gaussian grid that spans these latitudes [output size:
   72x256]. Here, the opt=True and the attribute NLATo is set to the
   appropriate global value.
  f = addfile ("foo.nc", "r")
  p = f->PRC
  printVarSummary( p )

  LON  = fspan(-178.5,178.5, 256)
  NLATG= 128           ; appropriate global value
  LATG = latGau (NLATG, "LATG", "latitude", "degrees_north")      ; nominally 90
S -> 90N
  LAT  = LATG({-48:48})          ; extract gaussian latitudes for region

  opt = True
  opt@NLATo = NLATG
  po  = area_conserve_remap_Wrap (p&lon,p&lat, p , LON, LAT, opt)  ; (ntim,72,25
6)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

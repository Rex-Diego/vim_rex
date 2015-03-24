THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_streamline_contour_map.shtml
THE_TITLE:gsn_csm_streamline_contour_map
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_streamline_contour_map

   Creates and draws streamlines over a contour plot over a map.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_streamline_contour_map (
                wks     [1] : graphic,
                u    [*][*] : numeric,
                v    [*][*] : numeric,
                data [*][*] : numeric,
                res     [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   u
   v

   The u and v data for the streamline plot; they must be two-dimensional.
   data

   The data for the contour plot. It must be two-dimensional, where the
   leftmost dimension will be represented on the Y (latitude) axis, and
   the rightmost dimension represented on the X (longitude) axis.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the map plot created is returned. The id of the
   streamline plot is returned as an attribute called streamline and the
   id of the contour plot as an attribute called contour. The id of the
   data object is returned as an attribute called vfdata, and the id of
   the scalar data object is returned as an attribute called sfdata. This
   is useful if you want to use setvalues to change some data options
   after this function has been called.

Description

   This function creates and draws streamlines over a contour plot over a
   map on the given workstation. The default projection is a cylindrical
   equidistant, which you can override by setting the mpProjection
   resource.

   In order for the streamlines and contours to be overlaid correctly on
   the map, please see the document "Overlaying data on a map".

   The special resource gsnAddCyclic will be set to True so that a cyclic
   point will be added to the data. Set this resource to False if your
   data is not cyclic, or if you have already added the cyclic point in
   another fashion.

   If u, v, or data have a _FillValue attribute, these values will be used
   as missing values.

   For the contour plot, if the resource cnFillOn is set to True, then the
   following will happen automatically:
     * a labelbar will be automatically added (default horizontal)
     * contour lines and line labels will be turned off
     * the contour information label will be turned off

   If you want to turn the labelbar off, set lbLabelBarOn to False.

   For the map, the following will happen automatically:
     * the continents will be colored gray
     * the continental outlines will be turned off
     * the latitude/longitude locations will be labeled (cylindrical
       equidistant and polar stereographic maps only)
     * the tickmarks will point outward (cylindrical equidistant map only)

   If u has an attribute called "long_name", and gsnLeftString hasn't
   explicitly been set, then the value of this attribute is used for the
   left string title.

   If u has an attribute called "units", and gsnRightString hasn't
   explicitly been set, then the value of this attribute is used for the
   right string title.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

   In NCL V6.1.0, this function was updated to automatically create a
   labeblar if stMonoLineColor is set to False.

See Also

   gsn_csm_streamline_contour_map_ce, gsn_csm_streamline_contour_map_polar
   Special gsn resources

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
;
; Read in 2D data only
;
  uvf = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/941110_UV.cdf","r")
  pf  = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/941110_P.cdf","r")
  u   = uvf->u
  v   = uvf->v
  p   = pf->Psl

  wks  = gsn_open_wks("ncgm","gsn_csm_streamline_contour_map")
  gsn_define_colormap(wks,"temp1")

  res                        = True                           ; plot mods desire
d
  res@gsnMaximize            = True
  res@gsnSpreadColors        = True ; the default in 6.1.0

  res@sfXCEndV               = max(p&lon)
  res@sfXCStartV             = min(p&lon)
  res@sfYCEndV               = max(p&lat)
  res@sfYCStartV             = min(p&lat)
  res@vfXCEndV               = max(u&lon)
  res@vfXCStartV             = min(u&lon)
  res@vfYCEndV               = max(u&lat)
  res@vfYCStartV             = min(u&lat)

  res@cnFillOn               = True

  res@mpProjection          = "Orthographic"
  res@mpEllipticalBoundary  = True

  res@mpPerimOn             = False
  res@mpFillOn              = True
  res@mpLabelsOn            = False

  res@mpGeophysicalLineColor= 2
  res@mpGridLineColor       = 2
  res@mpLimbLineColor       = 2

  res@mpLimitMode           = "LatLon"
  res@mpMinLatF             = 0.0

  res@mpFillDrawOrder       = "Predraw"
  res@mpGridAndLimbDrawOrder= "Draw"
  res@mpOutlineDrawOrder    = "Draw"

  res@tiMainString            = "Example of a streamline plot"

  plot = gsn_csm_streamline_contour_map(wks,u,v,p,res)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

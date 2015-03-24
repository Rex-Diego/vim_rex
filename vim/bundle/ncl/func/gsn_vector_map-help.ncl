THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_vector_map.shtml
THE_TITLE:gsn_vector_map
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_vector_map

   Creates and draws a vector plot over a map.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_vector_map (
                wks  [1] : graphic,
                u [*][*] : numeric,
                v [*][*] : numeric,
                res  [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   u
   v

   The u and v data for the vector plot; must be two-dimensional.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the map created is returned. The id of the vector plot
   is returned as an attribute called vector, and the id of the data is
   returned as an attribute called data. This is useful if you want to use
   setvalues to change some data or vector options after this function has
   been called.

Description

   This function creates and draws a vector plot over a map on the given
   workstation.

   If either u or v have a _FillValue attribute, these values will be used
   as missing values.

   You should use gsn_csm_vector_map if you want a more customized vector
   plot and/or if your data has coordinate arrays.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_vector
   Special gsn resources

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  dir = ncargpath("data")
  uf = addfile(dir+"/cdf/Ustorm.cdf","r")  ; Open two netCDF files.
  vf = addfile(dir+"/cdf/Vstorm.cdf","r")

  u   = uf->u(0,:,:)   ; Get u, v, lat, lon data.
  v   = vf->v(0,:,:)
  lat = uf->u&lat
  lon = uf->u&lon

  wks = gsn_open_wks("x11","gsn_vector_map") ; Open a workstation.

  resources = True

  nlon = dimsizes(lon)
  nlat = dimsizes(lat)
  resources@vfXCStartV  = lon(0)      ; Define lat/lon corners
  resources@vfXCEndV    = lon(nlon-1) ; for vector plot.
  resources@vfYCStartV  = lat(0)
  resources@vfYCEndV    = lat(nlat-1)

  map = gsn_vector_map(wks,u,v,resources)  ; Draw a vector plot of
                                           ; u and v over a map.
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wmvectmap.shtml
THE_TITLE:wmvectmap
   NCL Home > Documentation > Functions > Graphics routines

wmvectmap

   Draws vectors over maps.

Prototype

        procedure wmvectmap (
                wks [1] : graphic,
                lat     : float,
                lon     : float,
                u       : float,
                v       : float
        )

Arguments

   wks

   An NCL workstation identifier specifying where you want to draw your
   vectors. The wks identifier is one returned either from calling
   gsn_open_wks or calling create to create a Workstation object.

   lat
   lon

   Arrays of any size and shape containing the latitudes and longitudes
   (in degrees) at which the vectors are to be drawn. These arrays must be
   the same size and shape as the u and v arrays.
   u
   v

   Arrays containing the longitudinal and latitudinal vector components.

Description

   The procedure wmvectmap uses the vector functions from the Wmap package
   to draw vectors over maps.

   This procedure is primarily to be used for drawing vectors that are
   defined on non-gridded data; if you are drawing vectors over a map that
   are defined on gridded data, then you could use a vector plot with
   vcGlyphStyle set to an approproate style.

   Vectors will be drawn at the specified locations using the current map
   transformation (i.e. on the most recently created map). The vector
   directions will be adjusted to point in concert with the map
   projection. For example, a vector with u=0. and v=80. will point toward
   the north pole rather than necessarily straight up.

   There are several parameters that control the vector apperance. The
   parameters VRS and VRN establish the relationship between vector
   lengths [the value sqrt(u*u+v*v)] and the length of the vector
   displayed on the plot. By default a vector length of 10. gets mapped to
   a line that is 2% of the maximum width of the output plot. You will
   most likely want to change these values.

   To set parameters to control the appearance of a vector, such as its
   color, linewidth, and so forth, use the wmsetp procedure. To retrieve
   parameter values, use the function wmgetp.

   The parameters applicable to wmvectmap are:

    1. VCH - controls the vector arrow head size
    2. VCC - controls the vector color.
    3. VCW - controls the linewidth scale factor.
    4. VVA - controls the angle between the arrow and tail

   The procedure wmvectmap does not call frame.

   Vectors are not plotted where the input data has missing values.

See Also

   wmvect, wmvlbl

Examples

   Example 1

   See example 9 on the weather symbols application page.

   Example 2

   The following example draws a bunch of vectors over Greenland, pointing
   north.
load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin

;
;  Draw a bunch of vectors over Greenland pointing to the
;  noth pole.
;
  cmap = (/(/1.,1.,1./),(/0.,0.,0./),(/1.,0.,0./) /)  ; color map
  wks = gsn_open_wks("ps","test")
  gsn_define_colormap(wks,cmap)

;
;  Draw an orthographic map centered at lat/lon = (70.,-10.).
;  Don't advance the frame, since we want to add vectors.
;
  mpres              = True
  mpres@gsnFrame     = False
  mpres@mpLimitMode  = "Corners"
  mpres@mpLeftCornerLatF  =  55.
  mpres@mpLeftCornerLonF  = -50.
  mpres@mpRightCornerLatF =  85.
  mpres@mpRightCornerLonF = -20.
  mpres@mpCenterLatF =  70.
  mpres@mpCenterLonF = -10.
  mpres@mpPerimOn = True
  mpres@vpHeightF = 1.
  mpres@vpWidthF  = 1.
  mpres@vpXF = 0.
  mpres@vpYF = 1.
  mpres@mpGridSpacingF = 5.

  map = gsn_map(wks,"Orthographic",mpres)

;
;  Draw an array of vertical vectors over the above map.
;
  lat = new((/3,2,5/),float)
  lon = new((/3,2,5/),float)
  u   = new((/3,2,5/),float)
  v   = new((/3,2,5/),float)

  lat(0,:,:) = 65
  lat(1,:,:) = 70
  lat(2,:,:) = 75

  do i=0,4
    lon(:,0,i) = -65.+i*5.
    lon(:,1,i) = -40.+i*5.
  end do

  u(:,:,:) =  0.
  v(:,:,:) = 35.

  wmsetp("vcc", 2)    ; Draw in red.
  wmsetp("vcw", 3.)   ; Increase the linewidth
  wmvectmap(wks, lat, lon,  u, v)  ; Plot vectors.
  wmvlbl(wks,1.,0.)
  frame(wks)          ; Advance the frame.
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

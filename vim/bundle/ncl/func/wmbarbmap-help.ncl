THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wmbarbmap.shtml
THE_TITLE:wmbarbmap
   NCL Home > Documentation > Functions > Graphics routines

wmbarbmap

   Draws wind barbs over maps.

Prototype

        procedure wmbarbmap (
                wks [1] : graphic,
                lat     : float,
                lon     : float,
                u       : float,
                v       : float
        )

Arguments

   wks

   An NCL workstation identifier specifying where you want to draw your
   wind barbs. The wks identifier is one returned either from calling
   gsn_open_wks or calling create to create a Workstation object.

   lat
   lon

   Arrays of any size and shape containing the latitudes and longitudes
   (in degrees) at which the wind barbs are to be drawn. These arrays must
   be the same size and shape as the u and v arrays.
   u
   v

   Arrays containing the zonal ("x") wind component and the meridional
   ("y") wind component.

Description

   The procedure wmbarbmap uses the wind barb functions from the Wmap
   package to draw wind barbs over maps.

   This procedure is primarily to be used for drawing wind barbs that are
   defined on non-gridded data; if you are drawing wind barbs over a map
   that are defined on gridded data, then you could use a vector plot with
   vcGlyphStyle set to "WindBarb".

   Wind barbs will be drawn at the specified locations using the current
   map transformation (i.e. on the most recently created map). The
   direction of the wind barbs is that which has the barbs pointing toward
   the wind direction (the meteorological convention). The length of the
   shaft of the wind barb is controlled by the value of the internal
   parameter WBS (see below for how to change the value of WBS). The
   length of the shaft has no relation to the wind speed.

   To set parameters to control the appearance of a wind barb, such as its
   size, color, and so forth, use the wmsetp procedure. To retrieve
   parameter values, use the function wmgetp.

   The parameters applicable to wmbarb are: COL, WBF, WBA, WBC, WBD, WBR,
   WBS, WBT.

   The procedure wmbarbmap does not call frame.

   [In version 4.3.0 and later] Wind barbs are not plotted where the input
   data has missing values.

See Also

   wmbarb, wmdrft, wmgetp, wmlabs, wmsetp, wmstnm

Examples

   Example 1

   See examples 3, 5, and 6 on the weather symbols application page.

   Example 2

   The following code:
load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
  cmap = (/(/1.,1.,1./),(/0.,0.,0./),(/1.,0.,0./) /)  ; color map
  wks = gsn_open_wks("x11","test")

;
;  Draw an orthographic map centered at lat/lon = (70.,-10.).
;  Don't advance the frame, since we want to add wind barbs.
;
  mpres              = True
  mpres@gsnFrame     = False
  mpres@mpLimitMode  = "LatLon"
  mpres@mpMinLonF    = -40.
  mpres@mpMaxLonF    =  20.
  mpres@mpMinLatF    =  55.
  mpres@mpMaxLatF    =  85.
  mpres@mpCenterLatF =  70.
  mpres@mpCenterLonF = -10.

  map = gsn_map(wks,"Orthographic",mpres)

;
;  Draw an array of vertical wind barbs over the above map.
;
  lat = new((/3,2,5/),float)
  lon = new((/3,2,5/),float)
  u   = new((/3,2,5/),float)
  v   = new((/3,2,5/),float)

  lat(0,:,:) = 65
  lat(1,:,:) = 70
  lat(2,:,:) = 75

  do i=0,4
    lon(:,0,i) = -40.+i*5.
    lon(:,1,i) = -15.+i*5.
  end do

  u(:,:,:) =  0.
  v(:,:,:) = 90.

  wmsetp("col", 2)    ; Draw in red.
  wmsetp("wbs", .06)  ; Increase the size of the barb.
  wmbarbmap(wks, lat, lon,  u, v)  ; Plot barbs.
  frame(wks)          ; Advance the frame.
end

   will draw wind barbs of the same magnitude, but at different locations.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

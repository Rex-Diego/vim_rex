THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/generate_2d_array.shtml
THE_TITLE:generate_2d_array
   NCL Home > Documentation > Functions > Random number generators

generate_2d_array

   Generates a "nice" 2D array of pseudo random data, especially for use
   in 2D graphics.

Prototype

        function generate_2d_array (
                mlow       : integer,
                mhigh      : integer,
                dlow       : numeric,
                dhigh      : numeric,
                iseed      : integer,
                dsizes [2] : byte, short, integer or long
        )

        return_val [dsizes] :  float or double

Arguments

   mlow
   mhigh

   Integers representing the approximate minimum and maximum number of
   highs and lows that the output data should have. They must be in the
   range 1 to 25. If not, then they will be set to either 1 or 25.
   dlow
   dhigh

   The exact minimum and maximum value that the output data should have.
   iseed

   An integer value from 0 to 100 that represents the seed. If a value
   outside this range is entered, then iseed will be set to 0.
   dsizes

   The dimension sizes of the two-dimensional return array.

   As of version 6.0.0, dsizes can be of type long, allowing dimension
   sizes greater than or equal to 2 gigabytes (GB) on 64-bit systems.

Description

   This function generates a two-dimensional array (dimensioned dsizes) of
   pseudo random numbers using a sum of exponentials. This function is
   especially useful for generating random data for nice 2D graphics.

   The values will fall exactly within the range [dlow,dhigh] and there
   will be approximately mlow lows and mhigh highs.

   The return type will be double if dlow and/or dhigh are double, and
   float otherwise.

See Also

   random_chi, random_gamma, random_normal, random_uniform,
   random_setallseed, generate_unique_indices

Examples

   Example 1

   Generate a 14 x 23 set of random numbers that range from -136.148 to
   451.834:
  z = generate_2d_array(20,20,-136.148,451.834,0,(/14,23/))

   Example 2

   This example generates the well-known NCAR Graphics example "cpex08",
   which shows filled contours only over Africa. generate_2d_array is used
   to generate a 40 x 40 array:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
;
; Generate an ny x nx array of random data with a minimum of -10 and a
; maximum of 110.
;
  nx = 40
  ny = 40
  z  = generate_2d_array(15,15,-10.,110.,0,(/ny,nx/))
;
; Generate 1D lat/lon coord arrays and attach to data. Make sure
; to include the units so we don't get warning messages from the
; gsn_csm_contour_map routine.
;
  lat   = fspan(-35,38,ny)
  lon   = fspan(-18,52,nx)
  z!0   = "lat"
  z!1   = "lon"
  z&lat = lat
  z&lon = lon
  z&lat@units = "degrees_north"
  z&lon@units = "degrees_east"

;
; These are the geographical areas we want to fill.
;
  fill_specs = (/"water","land"/)
;
; These are the geographical areas we want to mask.
;
  mask_specs = (/\
  "algeria","angola","angola-exclave-called-cabinda","benin","botswana",\
  "burundi","cameroon","central-african-republic","chad","congo","djibouti",\
  "egypt","equatorial-guinea","ethiopia","gabon","gambia","ghana","guinea",\
  "guinea-bissau","ivory-coast","kenya","lesotho","liberia","libya",\
  "madagascar","malawi","mali","mauritania","mauritius","morocco",\
  "mozambique","namibia","niger","nigeria","rwanda","senegal","sierra-leone",\
  "somalia","south-africa","sudan","swaziland","tanzania","togo","tunisia",\
  "uganda","upper-volta","western-sahara","zaire","zambia","zimbabwe"/)


;
; Open workstation and define colormap.
;
  wks = gsn_open_wks("x11","africa")

  color_map = (/(/1.00,1.00,1.00/),(/0.00,0.00,0.00/),(/0.70,0.70,0.70/), \
                (/0.75,0.50,1.00/),(/0.50,0.00,1.00/),(/0.00,0.00,1.00/), \
                (/0.00,0.50,1.00/),(/0.00,1.00,1.00/),(/0.00,1.00,0.60/), \
                (/0.00,1.00,0.00/),(/0.70,1.00,0.00/),(/1.00,1.00,0.00/), \
                (/1.00,0.75,0.00/),(/1.00,0.38,0.38/),(/1.00,0.00,0.38/), \
                (/1.00,0.00,0.00/)/)

  gsn_define_colormap(wks,color_map)


; Set some resources.
;
  res                 = True
  res@gsnMaximize     = True
  res@gsnAddCyclic    = False

  res@cnFillColors    = (/3,4,5,6,8,9,10,11,12,13,14,15/)
  res@cnFillOn        = True
  res@cnFillDrawOrder = "Predraw"
  res@cnLineDrawOrder = "Predraw"
  res@cnHighLabelsOn  = False
  res@cnInfoLabelOn   = False
  res@cnLineLabelsOn  = False
  res@cnLowLabelsOn   = False
;
; Map projection resources
;
  res@mpProjection         = "Orthographic"
  res@mpEllipticalBoundary = True
  res@mpCenterLatF         = 20.0
  res@mpCenterLonF         = 14.0

;
; Map lat/lon grid resources
;
  res@mpGridAndLimbOn      = True
  res@mpGridSpacingF       = 10
  res@mpGridLineColor      = 2
  res@mpGridLineThicknessF = 1.1
  res@mpGridMaskMode       = "MaskLand"  ; Don't draw grid over land.
;
; Set the resources to indicate which areas to fill and which to mask.
;
;
; Map fill area resources
;
  res@mpFillBoundarySets    = "NoBoundaries"
  res@mpAreaMaskingOn       = 1
  res@mpMaskAreaSpecifiers  = mask_specs
  res@mpSpecifiedFillColors = (/7,2/)
  res@mpFillAreaSpecifiers  = fill_specs

;
; LabelBar resources. Note that this labelbar has two more boxes
; than we have contour levels. These extra boxes are used to show the
; colors for land and ocean.
;
  res@lbOrientation    = "Vertical"
  res@lbBoxCount       = 14
  res@lbLabelFont      = "Helvetica-bold"
  res@lbLabelAlignment = "BoxCenters"
  res@lbLabelStrings   = (/"Ocean","Land","< 0","0-10","10-20","20-30", \
                           "30-40","40-50","50-60","60-70","70-80",     \
                           "80-90","90-100","> 100"/)
  res@lbFillColors     = (/7,2,3,4,5,6,8,9,10,11,12,13,14,15/)

  contour = gsn_csm_contour_map(wks,z,res)

end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_contributed/wrf_mapres_c.shtml
THE_TITLE:wrf_mapres_c
   NCL Home > Documentation > Functions > WRF

wrf_mapres_c

   Sets the appropriate geographical mapping resources based upon WRF file
   contents. (deprecated)

   [new.gif] Available in version 4.3.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"
        procedure wrf_mapres_c (
                f    : file,
                res  : logical,
                opt  : integer
        )

Arguments

   f

   File reference to a WRF netCDF file as returned by addfile
   res

   Variable to which mapping attributes will be attached.
   opt

   Not used. Set to zero [ 0 ].

Description

   This function has been deprecated. Use wrf_map_resources instead.

   Makes NCL scripts less complicated. The procedure queries the file
   pointed to by f. Based upon the information returned it sets the
   attributes needed for plotting on a geographic background when using
   the high level graphical interfaces [gsn_csm*]

See Also

   WRF functions/procedures

Examples

   Example 1

   Based on WRF file attributes and arrays containing coordinate
   information, assign attributes required by the high level graphical
   interfaces [gsn_csm*] for plotting on a geographical background.
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"

  f     = addfile ("wrfout_d01_000000.nc" , "r")
  x     = f->X(0,0,:,:)              ; read only one time step and level for the
 example
        :
        :
  res   = True                       ; can be any name
        :
  wrf_mapres_c(f, res, 0)     ; invoke the procedure

  print(res)

        :
  plot = gsn_csm_contour_map (wks, x, res)

   The output shows the type of information associated with the input
   variable res.
  Variable: res
  Type: logical
  Total Size: 4 bytes
              1 values
  Number of Dimensions: 1
  Dimensions and sizes:   [1]
  Coordinates:
  Number Of Attributes: 17
    mpProjection :        LambertConformal
    mpLimitMode : Corners
    mpLeftCornerLatF :    40.57254
    mpLeftCornerLonF :    -95.42059
    mpRightCornerLatF :   47.07504
    mpRightCornerLonF :   -82.85648
    mpCenterLonF :        -98
    mpCenterLatF :        43.99802
    mpLambertParallel1F : 30
    mpLambertParallel2F : 60
    mpLambertMeridianF :  -98
    mpFillOn :    False
    mpOutlineDrawOrder :  PostDraw
    mpOutlineBoundarySets :       GeophysicalAndUSStates
    mpPerimDrawOrder :    PostDraw
    tfDoNDCOverlay :      True
    gsnAddCyclic :        False

   Note: attributes may be assigned to res before or after invoking the
   wrf_mapres_c procedure. Also, users may delete or change any of the
   attributes associated with res.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

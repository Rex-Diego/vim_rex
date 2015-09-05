THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dz_height.shtml
THE_TITLE:dz_height
   NCL Home > Documentation > Functions > CESM

dz_height

   Calculates the height layer thicknesses at each grid point over varying
   surface terrain.

Prototype

        function dz_height (
                z        : numeric,
                zsfc     : numeric,
                ztop [1] : numeric,
                iopt     : integer
        )

        return_val  :  numeric

Arguments

   z

   An array of at least three dimensions. The rightmost dimensions must be
   (klvl,nlat,mlon). Dimensions to the left of klvl are optional. The
   values at each grid point must be monotonically increasing or
   decreasing but may be unequally spaced.
   zsfc

   A scalar or an array containing the surface height. Must have the same
   units as z. The rightmost dimensions must be latitude and longitude,
   eg: (nlat,mlon). Dimensions to the left of nlat are optional. If
   present, they must match the dimensions of z.
   ztop

   A scalar specifying the top of the column. Must be greater-than or
   equal to 0.0 and must have the same units as z.
   iopt

   Set to zero. Currently not used.

Return value

   A variable containing the layer "delta z". It will have the same shape
   and size as z. It will be of type double if any of the input is double
   and float otherwise.

Description

   Calculates the layer height thicknesses at each grid point over a vary
   surface elevations. It is analogous to dpres_hybrid_ccm for hybrid
   coordinates and dpres_plevel for constant pressure coordinates. At each
   grid point the sum of the height thicknesses equates to [ztop-zsfc]. At
   each grid point, the returned values above ztop and below zsfc will be
   set to z@_FillValue. If there is no zsfc@_FillValue then the _FillValue
   will be set to the default missing value for the output type (it is
   1e20 in NCL versions 5.2.x and earlier). If ztop or zsfc is between z
   levels then the layer thickness is modifed accordingly. If zsfc is set
   to _FillValue, all layer thicknesses are set to the appropriate
   _FillValue.

   The primary purpose of this function is to return height layer
   thicknesses to be used to weight observations for integrations.

See Also

   dpres_hybrid_ccm,dpres_plevel

Examples

   Example 1 Consider one grid point and three different boundary zsfc and
   ztop: [0, 27000], [500, 27000], [500,21500].
                             ; z(:,nl,ml)
  Z= (/ 97.1,308.8,545.9,811.4,1108.8,1441.8,1814.8        \
      ,2232.6,2700.5,3224.6,3811.5,4468.9,5205.2,6029.8    \
      ,6953.4,7987.8,9146.3,10443.9,11897.2,13524.8,15357.1\
      ,17335.3,19339.7,21339.8,23339.8,25339.8/)*1d0


  dz   = dz_height(z, zsfc, ztop, 0)

   The output from the print statement is:
                           0        500        500
               Z       27000      27000      21500
        --------------------------------------------
(0)          97.1      202.9        0.0        0.0
(1)         308.8      224.4        0.0        0.0
(2)         545.9      251.3      178.7      178.7
(3)         811.4      281.5      281.5      281.5
(4)        1108.8      315.2      315.2      315.2
(5)        1441.8      353.0      353.0      353.0
(6)        1814.8      395.4      395.4      395.4
(7)        2232.6      442.8      442.8      442.8
(8)        2700.5      496.0      496.0      496.0
(9)        3224.6      555.5      555.5      555.5
(10)       3811.5      622.1      622.1      622.1
(11)       4468.9      696.9      696.9      696.9
(12)       5205.2      780.4      780.4      780.4
(13)       6029.8      874.1      874.1      874.1
(14)       6953.4      979.0      979.0      979.0
(15)       7987.8     1096.4     1096.4     1096.4
(16)       9146.3     1228.1     1228.1     1228.1
(17)      10443.9     1375.5     1375.5     1375.5
(18)      11897.2     1540.4     1540.4     1540.4
(19)      13524.8     1729.9     1729.9     1729.9
(20)      15357.1     1905.3     1905.3     1905.3
(21)      17335.3     1991.3     1991.3     1991.3
(22)      19339.7     2002.2     2002.2     2002.2
(23)      21339.8     2000.1     2000.1     1160.2
(24)      23339.8     2000.0     2000.0        0.0
(25)      25339.8     2660.2     2660.2        0.0


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

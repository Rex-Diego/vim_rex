THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/uv2vr_cfd.shtml
THE_TITLE:uv2vr_cfd
   NCL Home > Documentation > Functions > Meteorology

uv2vr_cfd

   Computes relative vorticity using centered finite differences.

Prototype

        function uv2vr_cfd (
                u         : numeric,
                v         : numeric,
                lat   [*] : numeric,
                lon   [*] : numeric,
                boundOpt  : integer
        )

        return_val [dimsizes(u)] :  numeric

Arguments

   u

   A multi-dimensional array containing the zonal wind component. The
   rightmost two dimensions must be lat and lon.
   v

   A multi-dimensional array containing the meridional wind component. The
   rightmost two dimensions must be lat and lon.
   lat

   A one-dimensional array containing the latitude coordinates in degrees
   associated with the u and v arrays.
   lon

   A one-dimensional array containing the longitude coordinates in degrees
   associated with the u and v arrays.
   boundOpt

   A scalar integer equal to the boundary condition option:
     * 0 = Boundary points are set to the missing value.
     * 1 = The u and v arrays are cyclic in longitude. (The arrays should
       NOT include the cyclic point.) The upper and lower boundaries will
       be set to missing.
     * 2 = Boundary points are estimated using one-sided difference
       schemes normal to the boundary.
     * 3 = The u and v arrays are cyclic in longitude. (The arrays should
       NOT include the cyclic points.) The upper and lower boundaries are
       estimated using a one-sided difference scheme normal to the
       boundary.

Return value

   A multi-dimensional array of the same size and type as u.

Description

   Computes relative vorticity for a latitude-longitude grid using
   centered finite differences. The grid need not be global and missing
   values are allowed.
   According to H.B. Bluestein [Synoptic-Dynamic Meteorology in
   Midlatitudes, 1992, Oxford Univ. Press p113-114], let D represent the
   partial derivative, a the radius of the earth, phi the latitude and
   dx2/dy2 the appropriate longitudinal and latitudinal spacing,
   respectively. Then, letting j be the latitude y-subscript, and i be the
   longitude x-subscript:
    rv = Dv/Dx - Du/Dy + (u/a)*tan(phi)


    rv(j,i) = (v(j,i+1)-v(j,i-1))/dx2(j)
              - (u(j+1,i)-u(j-1,i))/dy2(j)
              + (u(j,i)/a)*tan(phi(j))

   The last terms accounts for the convergence of the meridians on a
   sphere. The grid may be global or represent a limited area. If missing
   values are present, the functions perform the calculation at all points
   possible, but will return missing values at coordinates which could not
   be used.
   If the relative vorticity is to be estimated at the boundaries
   (boundOpt = 2 or 3), then the boundary values are determined using a
   one-sided difference scheme normal to the appropriate boundary.

See Also

   If the data are global and no missing values are present then it is
   highly recommended that the spherical harmonic functions uv2vrG and
   uv2vrF be used. They are more accurate.

Examples

   Example 1

   Let u and v be arrays on a global gaussian grid with dimensions lat and
   lon. Assume there are no missing values and the data are periodic in
   longitude. Then:
  vr = uv2vr_cfd (u,v,lat,lon, 3)
; result vr is dimensioned lat and lon.

   The 3 will cause the functions to account for the cyclic point and will
   also calculate values at the top and bottom latitudes. In this case, it
   would be better to use uv2vrG because the grid is global and no data
   are missing.

   Example 2

   Let u and v be arrays on a limited area of the globe with dimension
   sizes (ntim=100,nlat=34,mlon=60). Obviously, the data are not periodic
   in longitude. Then:
  vr = uv2vr_cfd (u,v,lat,lon, 2)  ==> vr(ntim,nlat,mlon)

   The 2 will cause the functions to calculate the quantities at all
   boundary points using one-sided differences.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

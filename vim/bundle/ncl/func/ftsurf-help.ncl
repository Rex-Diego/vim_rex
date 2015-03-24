THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftsurf.shtml
THE_TITLE:ftsurf
   NCL Home > Documentation > Functions > Regridding

ftsurf

   Calculates an interpolatory surface passing through a rectangular grid
   of function values.

Prototype

        function ftsurf (
                xi     : numeric,
                yi     : numeric,
                zi     : numeric,
                xo [*] : numeric,
                yo [*] : numeric
        )

        return_val  :  float or double

Arguments

   xi

   An array whose rightmost dimension is of arbitrary length (say mi),
   containing X coordinates for grid lines in the X direction.
   yi

   An array whose rightmost dimension is of arbitrary length (say ni)
   containing Y coordinates for grid lines in the Y direction. All but the
   rightmost dimensions of xi and yi must be the same.
   zi

   An array having two or more dimensions. The rightmost two dimensions
   must have sizes mi and ni, respectively, and the leftmost two
   dimensions must be the same as xi and yi. These last two dimensions
   contain functional values at the grid points defined by xi and yi. zi
   should not contain missing values, as missing values are not treated in
   any special way.
   xo

   A 1D array specifying the X (say mo in number) coordinates for the
   output interpolation grid.
   yo

   A 1D array specifying the Y (say no in number) coordinates for the
   output interpolation grid.

Return value

   An array of interpolated values defined on the specified output grid.
   The returned array will have the same number of dimensions as zi. The
   final two dimension sizes of the returned array are the same as those
   of xo and yo, respectively. All other dimension sizes will be the same
   as those of zi. If zo is the array returned from interpolating data on
   a two-dimensional array zi, then zo(i,j) will be the interpolated value
   at (xo(i),yo(j)) for 0 .le. i .lt. mo and 0 .le. j .lt. no. zo will be
   of type double if any of the input is double, and float otherwise.

Description

   The surface computed is a tensor product of splines under tension.
   ftsurf is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   ftsurf does not recognize missing values. There are some parameters
   that can alter the behavior of ftsurf. These parameters all have
   reasonable default values. However, users may change any of these
   parameters by invoking ftsetp prior to calling ftsurf. ftsurf is called
   after all of the desired values for control parameters have been set.

   Control parameters that apply to ftsurf are: sig, zx1, zxm, zy1, zyn,
   z11, zm1, z1n, zmn, df1, df2, df3, df4, df5, df6, df7, df8.

   The value for the parameter sig specifies the tension factor. Values
   near zero result in a cubic spline; large values (e.g. 30) result in
   nearly a polygonal line. A typical value is 1. (the default). For
   values of sig larger than about 40. an internal overflow exception may
   be generated, so sig should be kept smaller than that value.

   zx1 is an array containing mi X-partial derivatives of the function
   along the line xi(0), that is zx1(j) is the X-partial derivative at
   point (x(0),y(j)) for j=0,ni-1. This parameter may be defaulted by
   setting the value for df1 appropriately. The default is to compute zx1
   internally. Values for zx1 can be set using the procedure ftsetp.

   zxm is an array containing n X-partial derivatives of the function
   along the line xi(mi-1), that is zxm(j) is the X-partial derivative at
   point (xi(mi-1),yi(j)) for j=0,ni-1. This parameter may be defaulted by
   setting the value for df2 appropriately. The default is to compute zx2
   internally. Values for zxm can be set using the procedure ftsetp.

   zy1 is an array containing m Y-partial derivatives of the function
   along the line yi(0), that is zy1(j) is the Y-partial derivative at
   point (x(i),y(0)) for i=0,mi-1. This parameter may be defaulted by
   setting the value for df3 appropriately. The default is to compute zy1
   internally. Values for zy1 can be set using the procedure ftsetp.

   zyn is an array containing m Y-partial derivatives of the function
   along the line yi(ni-1), that is zyn(j) is the Y-partial derivative at
   point (x(i),y(ni-1)) for i=0,mi-1. This parameter may be defaulted by
   setting the value for df4 appropriately. The default is to compute zyn
   internally. Values for zyn can be set using the procedure ftsetp.

   z11, zm1, z1n, zmn specify X-Y-partial derivatives of the function at
   the four corners (xi(0),yi(0)), (xi(mi-1),yi(0)), (xi(0),yi(ni-1)),
   (xi(mi-1),yi(ni-1)), These parameters may be defaulted by setting the
   values for df5, df6, df7, df8, appropriately. The default is to compute
   z11, zm1, z1n, zmn internally.

   You can extrapolate values with ftsurf (that is calculate interpolated
   values for coordinates outside of the scope of the input grid), but
   these values are, in general, unreliable.

Examples

   Example 1

begin
  nxi = 11
  nyi = 17
  xi = fspan(0.,1.,nxi)
  yi = fspan(0.,1.,nyi)
  zi = new((/nxi,nyi/),float)
  do i=0,nxi-1
    do j=0,nyi-1
      zi(i,j) = 0.5 + 0.25*sin(-7.*xi(i)) + 0.25*cos(5.*yi(j))
    end do
  end do
  nxo = 31
  nyo = 21
  xo = fspan(0.,1.,nxo)
  yo = fspan(0.,1.,nyo)
  zo = ftsurf(xi,yi,zi,xo,yo)
end

   Example 2

begin

;
;  Create the input arrays.
;
  nxi = 11
  nyi = 17
  xi = fspan(0.,1.,nxi)
  yi = fspan(0.,1.,nyi)
  zi = new((/2,5,nxi,nyi/),float)

  do m=0,1
    divm = 1./(1.*(m+1))
    do k=0,4
      divk = 1./(1.*(k+1))
      do i=0,nxi-1
          zi(m,k,i,:) = 0.5 + 0.25*divk*sin(-7.*xi(i)) + 0.25*divm*cos( 5.*yi)
      end do
    end do
  end do

;
;  Set up the output grid and interpolate.
;
  nxo = 31
  nyo = 21
  xo = fspan(0.,1.,nxo)
  yo = fspan(0.,1.,nyo)
  zo = ftsurf(xi,yi,zi,xo,yo)

;
; Create an XWorkstation object.
;
  wid = create "ftsurf" xWorkstationClass defaultapp
    "wkPause" : "True"
  end create

  rho = 3.
  theta = 36.
  phi = 67.

;
;  Draw plots.
;
  do m=0,1
    do k=0,4
      tdez2d(wid,xo,yo,zo(m,k,:,:),rho,theta,phi,6)
      frame(wid)
    end do
  end do

end

Errors

          = 1 if the number of xi or yi values is less than 2.
          = 2 if the xi or yi values are not strictly increasing.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

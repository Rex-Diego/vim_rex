THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/shgrid.shtml
THE_TITLE:shgrid
   NCL Home > Documentation > Functions > Interpolation

shgrid

   Interpolates data from an unstructured grid to a grid in 3-space.

Prototype

        function shgrid (
                xi [*] : float,
                yi [*] : float,
                zi [*] : float,
                ui [*] : float,
                xo [*] : float,
                yo [*] : float,
                zo [*] : float
        )

        return_val [*][*][*] :  float

Arguments

   xi

   A one-dimensional array, of any size greater than 9, containing the X
   coordinates of the input data points.
   yi

   A one-dimensional array, of the same size as xi, containing the Y
   coordinates of the input data points.
   zi

   A one-dimensional array, of the same size as xi and yi, containing the
   Z coordinates of the input data points.
   ui

   A one-dimensional array, of the same size as xi, yi, and zi, containing
   the functional values at the input data coordinates given by xi, yi,
   and zi. That is, ui(k) is the input function value at
   (xi(k),yi(k),zi(k)) for k = 0 to dimsizes(xi)-1.
   xo

   A one-dimensional array, of any size, containing the X coordinates of
   the output grid.
   yo

   A one-dimensional array, of any size, containing the Y coordinates of
   the output grid.
   zo

   A one-dimensional array, of any size, containing the Z coordinates of
   the output grid.

Return value

   A three-dimensional array containing the calculated functional values.
   The first dimension of the returned value has the same size as xo, the
   second dimension of the returned value has the same size as yo, and the
   third dimension of the returned value has the same size as zo. If uo is
   the returned value, then uo(i,j,k) contains the functional value at
   coordinate (xo(i),yo(j),zo(k)).

Description

   shgrid is in the ngmath library. It uses a modified Shepard's algorithm
   to construct an interpolatory surface. For details on the algorithm,
   see the introduction module in the shgrid documentation.

   The general documentation for shgrid contains several complete
   examples.

Examples

begin

;
;  Create the input arrays.
;
  xmin = -2.
  xmax =  2.
  ymin = -2.
  ymax =  2.
  zmin = -2.
  zmax =  2.

  nx = 21
  ny = 21
  nz = 21

  ndata = 1000
  xi = new(ndata,float)
  yi = new(ndata,float)
  zi = new(ndata,float)
  ui = new(ndata,float)

  do i=0,ndata-1
      xi(i) = xmin + (xmax-xmin)*rand()/32767.
      yi(i) = ymin + (ymax-ymin)*rand()/32767.
      zi(i) = zmin + (zmax-zmin)*rand()/32767.
      ui(i) = xi(i)*xi(i) + yi(i)*yi(i) + zi(i)*zi(i)
  end do

;
;  Set up the output grid.
;
  xo = fspan(xmin,xmax,nx)
  yo = fspan(ymin,ymax,ny)
  zo = fspan(zmin,zmax,nz)

;
;  Get the interpolated values.
;
  uo = shgrid(xi,yi,zi,ui,xo,yo,zo)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

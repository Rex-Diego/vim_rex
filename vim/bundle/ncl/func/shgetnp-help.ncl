THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/shgetnp.shtml
THE_TITLE:shgetnp
   NCL Home > Documentation > Functions > Interpolation

shgetnp

   Finds the nearest point, or points (in a specified set of points), to a
   given point in 3-space.

Prototype

        function shgetnp (
                px   [1] : float,
                py   [1] : float,
                pz   [1] : float,
                x    [*] : float,
                y    [*] : float,
                z    [*] : float,
                flag [1] : integer
        )

        return_val [1] :  integer

Arguments

   px

   A scalar specifying the X coordinate value of a point P whose nearest
   neighbor (in a specified set of points) is to be found.
   py

   A scalar specifying the Y coordinate value of a point P whose nearest
   neighbor (in a specified set of points) is to be found.
   pz

   A scalar specifying the Z coordinate value of a point P whose nearest
   neighbor (in a specified set of points) is to be found.
   x

   A one-dimensional array containing the X coordinates of the input data
   points.
   y

   A one-dimensional array, of the same size as x, containing the Y
   coordinates of the input data points.
   z

   A one-dimensional array, of the same size as x and y, containing the Z
   coordinates of the input data points.
   flag

   A scalar flag that is 0 for the first call to this function for a given
   dataset and is 1 otherwise.

Return value

   An integer, say np, such that (x(np),y(np),z(np)) is the nearest input
   data point to P. np = -1 if there is an error. On successive calls to
   this function after the first (that is, when flag=1) you can find the
   Mth closest point to (px,py,pz) with the Mth call.

Description

   shgetnp is called to find the nearest point, or points (in a specified
   set of points), to a given point in 3-space. Successive calls to
   shgetnp determine the point nearest the specified point, excluding the
   points found in previous calls; i.e., successive calls can be used to
   find the N nearest points for any N between one and the maximum number
   of points in the input dataset.

   shgetnp is part of the shgrid package in the ngmath library.

Examples

begin

;
;  Specify the data points.
;
  xi = new(64,float)
  yi = new(64,float)
  zi = new(64,float)
  np = new(64,integer)
  l = 0
  do k=1,4
    zl = (1.*(k-1))/3.
    do j=1,4
      yl = (1.*(j-1))/3.
      do i = 1,4
        xi(l) = (1.*(i-1))/3.
        yi(l) = yl
        zi(l) = zl
        l = l+1
      end do
    end do
  end do

;
;  Specify a reference point P.
;
  px = 0.301
  py = 0.901
  pz = 0.501

;
;  Find the index of the nearest point to P.
;
  np(0) = shgetnp(px,py,pz,xi,yi,zi,0)

;
;  Find the other nearest points to P in sequence.
;
  do i=1,63
    np(i) = shgetnp(px,py,pz,xi,yi,zi,1)
  end do

;
;  Print the indices of the nearest points (xi(np(k)),yi(np(k),zi(np(k)))
;  is the kth nearest point to P for k=0,63
;
  print(np)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

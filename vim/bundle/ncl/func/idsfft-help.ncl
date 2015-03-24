THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/idsfft.shtml
THE_TITLE:idsfft
   NCL Home > Documentation > Functions > Interpolation

idsfft

   Interpolates 2D random data.

Prototype

        function idsfft (
                xc  [*] : float,
                yc  [*] : float,
                zc  [*] : float,
                dim [2] : integer
        )

        return_val [dim[0]][dim[1]] :  float

Arguments

   xc

   A one-dimensional array containing the x-coordinates of the input data.
   xc must have size four or greater.
   yc

   A one-dimensional array containing the y-coordinates of the input data.
   yc must have size four or greater and be the same size as xc.
   zc

   A one-dimensional array containing values at coordinates (xc,yc). zc
   must have size four or greater and be the same size as xc and yc.
   dim

   A one-dimensional array of size 2 containing the dimensions for the
   returned array, i.e. the returned array will be two-dimensional and
   have dimension sizes dim[0] and dim[1].

Return value

   idsfft returns a float array of size dim[0] x dim[1]. The values in the
   returned array are interpolated from the input data. The x-coordinates
   for the returned array are determined by finding the span of the min
   and max values of the xc array and dividing that span into dim[0]
   equally-spaced coordinates. Similarly for the y-coordinates. Run the
   example below for clarification if desired.

Description

   idsfft interpolates the data values zc, defined at coordinates (xc,yc),
   onto a regular grid.

   idsfft returns a two-dimensional float array of size dim[0] x dim[1].
   These values are interpolated from the input. The x-coordinates for the
   returned array are determined by finding the span of the min and the
   max of the xc array and dividing that span into dim[0] equally-spaced
   coordinates. Similarly for the y-coordinates. Run the example below for
   clarification if desired. The derived coordinate variables are
   attributes of the returned array. Dimension 0 of the output is named
   "ncl0" and dimension 1 of the output is named "ncl1".

   Note: a serious bug was fixed in this routine in version 4.2.0.a31
   (released mid-January 2004) in which incorrect results would be
   calculated for cases where dim[0] was not equal to dim[1].

   There are many interpolation functions superior to idsfft. It is
   recommended you use one of those. For a list of other interpolation
   functions, see the list of interpolation routines.

   Note: this function no longer exits when an error occurs.

See Also

   List of interpolation routines

Examples

   Example 1

   Interpolation on random data.
begin
  xran = (/                                                   \
           12., 60., 14., 33.,  8., 12., 43., 57., 22., 15.,  \
           19., 12., 64., 19., 15., 55., 31., 32., 33., 29.,  \
           18.,  2., 18., 42., 56.,  9.,  6., 12., 44., 19.   \
         /)
  yran = (/                                                   \
            0.,  2.,  3., 53.,  7., 11., 13., 17., 19., 49.,  \
            1., 31., 37.,  5.,  7., 47., 61., 17.,  5., 23.,  \
            29.,  3.,  5., 41., 43.,  9., 13., 59.,  1., 67.  \
         /)
  zran = (/                                                   \
           1.0, 1.5, 1.7, 1.4, 1.9, 1.0, 1.5, 1.2, 1.8, 1.4,  \
           1.8, 1.7, 1.9, 1.5, 1.2, 1.1, 1.3, 1.7, 1.2, 1.6,  \
           1.9, 1.0, 1.6, 1.3, 1.4, 1.8, 1.7, 1.5, 1.1, 1.0   \
         /)

  out = (/50,60/)

  interp = idsfft(xran,yran,zran,out)

  print(interp&ncl0)  ;  50 equally-spaced coordinates in the range 2. to 64.
  print(interp&ncl1)  ;  60 equally-spaced coordinates in the range 0. to 67.
  print(interp)       ;  A 50 x 60 array of interpolated values.

end

Errors

   If two coordinates (xc[i],yc[i]) and (xc[j],yc[j]) are equal for i not
   equal to j, an error is reported.

   If any three coordinates in the input arrays (xc,yc) are collinear, an
   error is reported.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/csvoro.shtml
THE_TITLE:csvoro
   NCL Home > Documentation > Functions > Interpolation

csvoro

   Determines Voronoi polygons for data randomly positioned on a sphere
   and returns vertices for the one surrounding a specified input point.

Prototype

        procedure csvoro (
                rlati [*] : numeric,
                rloni [*] : numeric,
                index     : integer,
                cflag     : integer,
                rlato [*] : numeric,
                rlono [*] : numeric,
                alen  [*] : numeric,
                nca       : integer,
                numv      : integer,
                nv    [*] : integer
        )

Arguments

   rlati
   rloni

   Latitudes and longitudes of the input points, in degrees. The two
   arrays must be of the same size.
   index

   Index of the input coordinate for which you want to determine the
   Voronoi polygon (0 <= index < dimsizes(rlati)).
   cflag

   Flag indicating if this is the first call to csvoro to retrieve Voronoi
   polygons for this dataset (1=yes, 0=no). For a given dataset, calls
   after the first call are much faster than the first one.
   rlato
   rlono

   (output)
   Latitudes and longitudes, in degrees, of points to be used in defining
   the Voronoi polygons. The two arrays should be of the same size. All
   the returned points are the centers of circles circumscribed about
   Delaunay triangles formed from the input dataset. (Some of the Delaunay
   triangles may contain vertices which are "pseudo points" added to the
   original input dataset. This happens only when all of the original
   points fit in the same hemisphere, in which case three "pseudo points"
   are added in the opposite hemisphere.) The size of rlato and rlono
   should be two times the size of rlati and rloni.
   alen

   (output)
   Array of circumradii, in degrees - the angles between circumcenters and
   their associated triangle vertices. The size of alen should be two
   times the size of rlati.
   nca

   (output)
   The actual number of point coordinates returned in rlato and rlono.
   This number may be larger than the size of rlati if "pseudo points"
   were added to the original dataset.
   numv

   (output)
   The number of vertices in the Voronoi polygon enclosing the coordinate
   (rlati(index),rloni(index)).
   nv

   (output)
   An array containing numv indices for the Voronoi polygon enclosing the
   coordinate (rlati(index),rloni(index)). Indices returned in this array
   refer to the coordinates returned in rlato and rlono. For example, if
   the integer j is an element of the nv array, then (rlato(j),rlono(j))
   is a vertex of the Voronoi polygon enclosing
   (rlati(index),rloni(index)). The indices in nv give the vertices of the
   Voronoi polygon in counter-clockwise order. nv should be the same size
   as rlati.

Description

   csvoro is in the Cssgrid package - a software package that implements a
   tension spline interpolation algorithm to fit a function to input data
   randomly spaced on a unit sphere.

   The general documentation for Cssgrid contains complete examples for
   entries in the package.

   If missing values are detected in the input data, then those values are
   ignored when calculating the interpolating function.

Examples

begin

;
;  Create input arrays.
;
  ndata = 100
  rlati = new(ndata,float)
  rloni = new(ndata,float)
;
  do i=0,ndata-1
    rlati(i) =  -90. + 180.*rand()/32767.
    rloni(i) = -180. + 360.*rand()/32767.
  end do

;
;  Obtain the Voronoi polygon for the first point in the input
;  dataset.  nv(0:numv-1) will contain integers to be used as
;  indices for rlato and rlono to determine the polygonal vertices.
;
  rlato = new(2*ndata,float)
  rlono = new(2*ndata,float)
  alen  = new(2*ndata,float)
  nca   = new(1,integer)
  numv  = new(1,integer)
  nv    = new(ndata,integer)
  csvoro(rlati,rloni,0,1,rlato,rlono,alen,nca,numv,nv)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

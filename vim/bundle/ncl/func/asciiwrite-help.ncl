THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/asciiwrite.shtml
THE_TITLE:asciiwrite
   NCL Home > Documentation > Functions > File IO

asciiwrite

   Creates an ascii text file of numeric or string data type.

Prototype

        procedure asciiwrite (
                filepath [1] : string,
                var
        )

Arguments

   filepath

   Path for new ascii file.
   var

   A variable of any dimensionality and of type numeric or string.

Description

   The asciiwrite function is used to create an ascii data file from an
   NCL variable. Each element of the variable, var, is written in its
   string representation followed by a new line. The data are ordered in
   their row x column internal ordering. Each line will have one value.
   The user has no format control.

   To create formatted output, use write_table or write_matrix.

See Also

   write_matrix, write_table, addfile, sprintf, sprinti, print_table

Examples

   Example 1

   Let x be an N x M (5 x 7) array generated via the random_normal
   function. Assume you want to write the values in ascii to a file called
   "foo":

  N    = 5
  M    = 7
  ave  = 0.0
  std  = 5.0
  x    = random_normal (ave, std, (/N,M/))

  asciiwrite ("foo", x)

   The file "foo" will contain 35 (5*7) lines, each with one value:

4.351637
4.364619
9.733969
4.912648
1.769823
-0.6349826
-4.294664
4.385624
[SNIP]
-1.427254
8.652377

   Example 2

   asciiwrite does not allow for user specified formatting. However,
   sprintf can be used on the var argument to allow the user to specify
   formatting.
  asciiwrite ("foo.txt" , sprintf("%9.3f", x ))

   The file "foo.txt" will contain the formatted data.
    4.352
    4.365
    9.734
    4.913
    1.770
   -0.635
   -4.295
    4.386
[SNIP]
   -1.427
    8.652

   Example 3

  s = (/"apple", "orange", "I like fruit!"/)
  asciiwrite ("fooString" , s)

   The file "fooString" will contain 3 lines:

apple
orange
I like fruit!

   Example 4

   Consider an array x(time,lat,lon) and it is desired to create an ascii
   file that contains all the temporal data for each latitude and
   longitude point.

 n   lat    lon   time=0   time=1  ...  time=(ntim-1)

This may be achieved by appending a sequence of strings.



  lat = ....              ; (nlat)
  lon = ....              ; (mlon)
  x   = ....              ; (ntim,nlat,mlon)

  dimx  = dimsizes(x)
  ntim  = dimx(0)
  nlat  = dimx(1)
  mlon  = dimx(2)

  npts  = nlat*mlon        ; total number of grid points

  fName = "foo.txt"
  data  = new( npts, "string")

  npt   = -1

  do nl=0,nlat-1
    do ml=0,mlon-1

       npt  = npt + 1
       data(npt) = sprinti("%0.5i", (npt+1) )
       data(npt) = data(npt) + sprintf("%7.1f ",lat(nl))
       data(npt) = data(npt) + sprintf("%7.1f ",lon(ml))

      do nt=0,ntim-1
         data(npt) = data(npt) + sprintf("%10.3f ", x(nt,nl,ml))
      end do
    end do
  end do

  asciiwrite (fName , data)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

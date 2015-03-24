THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/svdstd.shtml
THE_TITLE:svdstd
   NCL Home > Documentation > Functions > Singular value decomposition

svdstd

   Uses singular value decomposition and returns the left and right
   homogeneous and heterogeneous arrays associated with the two input
   datasets.

Prototype

        function svdstd (
                x      [*][*] : numeric,
                y      [*][*] : numeric,
                nsvd          : integer,
                homlft [*][*] : numeric,
                hetlft [*][*] : numeric,
                homrgt [*][*] : numeric,
                hetrgt [*][*] : numeric
        )

        return_val  :  float or double

Arguments

   x

   Two-dimensional input array, dimensioned num_stations (or grid points)
   in x by num_time.
   y

   Two-dimensional input array, dimensioned num_stations (or grid points)
   in y by num_time.
   nsvd

   Scalar integer that specifies the number of SVD patterns to be
   calculated.
   homlft

   Left homogeneous array (output), a two dimensional array dimensioned
   nsvd x num_stations in x. Space for this must be explicitly allocated
   by the user.
   hetlft

   Left heterogeneous array (output), a two dimensional array dimensioned
   nsvd x num_stations in x. Space for this must be explicitly allocated
   by the user.
   homrgt

   Right homogeneous array (output), a two dimensional array dimensioned
   nsvd x num_stations in y. Space for this must be explicitly allocated
   by the user.
   hetrgt

   right heterogeneous array (output), a two dimensional array dimensioned
   nsvd x num_stations in y. Space for this must be explicitly allocated
   by the user.

Return value

   This function returns the percent variance explained by the patterns
   (an array of length nsvd). The type of the return array will be double
   if any of the numeric input is double, and float otherwise.

   homlft, hetlft, hetlft, and hetrgt must be preallocated by the user,
   and all are outputs. After function call, homlft will contain the left
   homogeneous array, hetlft will contain the left heterogeneous array,
   homrgt will contain the right homogeneous array, and hetrgt will
   contain the right heterogeneous array.

Description

   The function svdstd uses the singular value decomposition (SVD) of x
   and y and returns the percent variance explained by the patterns (an
   array of length nsvd). The input arrays x and y are standardized prior
   to the SVD calculations. The approach is based upon Bretherton, Smith
   and Wallace (1992). Note: A similar function, svdcov, does not
   standardize the input arrays x and y.

   This function does not allow for missing data (defined by the
   _FillValue attribute) to be present.

   Both of these functions return the following attributes:

   fnorm (scalar, float or double)
          fnorm

   condn (scalar, float or double)
          condition number

   lapack_err (scalar, integer)
          LAPACK error code

   ak (1D array of length nsvd x num_time, float or double)
          expansion coefficient of left homogeneous

   bk (1D array of length nsvd x num_time, float or double)
          expansion coefficient of right homogeneous

     Users may want to use the onedtond function to convert ak and bk to
     2-dimensional arrays.

Caveat

   Newman and Sardeshmukh (1995) and Cherry (1996) urge caution when
   interpreting results.

References

   Bretherton, Smith and Wallace, 1992: An Intercomparison of Methods for
   Finding Coupled Patterns in Climate Data. J. Climate, vol 5, 541-560.

   Cherry, 1996: Singular Value Decomposition Analysis and Canonical
   Correlation Analysis. J. Climate, vol 9, 2003-2009.

   Newman and Sardeshmukh, 1995: A Caveat Concerning Singular Value
   Decomposition. J. Climate, vol 8, 352-360.

See Also

   svdcov, svdstd_sv, svdcov_sv

Examples

   Example 1

begin
  ; ================================>  ; PARAMETERS
  ntime   = 8                          ; # time steps
  ncols   = 3                          ; # columns (stations or grid pts) for S
  ncolz   = 6                          ; # columns (stations or grid pts) for Z
  nsvd    = 3                          ; # svd patterns to calculate
                                       ;   [nsvd <= min(ncols, ncolz) ]
  xmsg    = -999.9                     ; missing value

; ================================>  ; READ THE ASCII FILE
                                     ; open "files" as 2-D
  s     = asciiread ("svdrdm_S.asc",(/ntime,ncols/), "float")
  z     = asciiread ("svdrdm_Z.asc",(/ntime,ncolz/), "float")

  s!0   = "time"                       ; name dimensions for reordering
  s!1   = "col"
  z!0   = "time"
  z!1   = "col"

  homlft = new((/nsvd,ncols/),float)
  hetlft = new((/nsvd,ncols/),float)
  homrgt = new((/nsvd,ncolz/),float)
  hetrgt = new((/nsvd,ncolz/),float)

  x = svdcov(s(col|:,time|:),z(col|:,time|:),nsvd,homlft,hetlft,homrgt,hetrgt)
  print("svdcov: percent variance= " + x)

  s2 = s(col |:,time |:)                ; for a cleaner look one might do this
  z2 = z(col |:,time |:)

  ak   = onedtond(x@ak,(/nsvd,ntime/))
  bk   = onedtond(x@bk,(/nsvd,ntime/))
  ak!0 = "sv"
  ak!1 = "time"
  bk!0 = "sv"
  bk!1 = "time"

  y = svdstd(s2,z2,nsvd,homlft,hetlft,homrgt,hetrgt)
  print("svdstd: percent variance= " + y)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

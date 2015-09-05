THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/svdstd_sv.shtml
THE_TITLE:svdstd_sv
   NCL Home > Documentation > Functions > Singular value decomposition

svdstd_sv

   Uses singular value decomposition to return the left and right singular
   vectors associated with the two input datasets.

Prototype

        function svdstd_sv (
                x       [*][*] : float or double,
                y       [*][*] : float or double,
                nsvd           : integer,
                svLeft  [*][*] : float or double,
                svRight [*][*] : float or double
        )

        return_val  :  float or double

Arguments

   x

   Two-dimensional input array, dimensioned num_stations (or grid points)
   in x by time.
   y

   Two-dimensional input array, dimensioned num_stations (or grid points)
   in y by time.
   nsvd

   Scalar integer that specifies the number of singular vectors to be
   returned.
   svLeft

   Left singular vector (output), dimensioned nsvd x num_stations in x.
   Space for this must be explicitly allocated by the user.
   svRight

   Right singular vector (output), dimensioned nsvd x num_stations in y.
   Space for this must be explicitly allocated by the user.

Return value

   This function returns the percent variance explained as a 1D float
   array (double array if input is double) of length nsvd.

   svLeft and svRight must be preallocated by the user, and all both
   outputs. After function call, svLeft will contain the left singular
   vector dimensioned nsvd x num_stations in x. svRight will contain the
   right singular vector dimensioned nsvd x num_stations in y.

Description

   svdstd_sv uses singular value decomposition (SVD) of x and y and
   returns the percent variance explained. The input arrays x and y are
   standardized prior to the SVD calculations. Note: A similar function,
   svdcov_sv, does not standardize the input arrays x and y.

   This function does not allow for missing data (defined by the
   _FillValue attribute) to be present.

   This function returns the following attribute:

   sv (1D array, float or double)
          singular values

See Also

   svdcov_sv, svdstd, svdcov

Examples

   Example 1

begin
                                 ; PARAMETERS
  ntime   = 8                      ; # time steps
  ncols   = 3                      ; # columns (stations or grid pts) for S
  ncolz   = 6                      ; # columns (stations or grid pts) for Z
  nsvd    = 3                      ; # svd patterns to calculate
                                 ;   [nsvd <= min(ncols, ncolz) ]
  froot = "/fs/scd/home1/shea/ncldata_input/"
  s     = asciiread (froot+"svd_ex01_S.asc",(/ntime,ncols/), "float")
  z     = asciiread (froot+"svd_ex01_Z.asc",(/ntime,ncolz/), "float")

  s!0   = "time"                       ; name dimensions for reordering
  s!1   = "col"
  z!0   = "time"
  z!1   = "col"

  svLeft  = new((/nsvd,ncols/),float)  ; pre-allocate space
  svRight = new((/nsvd,ncolz/),float)
                                     ; reorder so time varying fastest
  pcVar = svdstd_sv(s(col|:,time|:),z(col|:,time|:),nsvd,svLeft,svRight)

  print("svdstd_sv: percent variance= " + pcVar)
  print("svdstd_sv: singular values = " + pcVar@sv)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

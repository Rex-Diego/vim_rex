THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/covcorm.shtml
THE_TITLE:covcorm
   NCL Home > Documentation > Functions > General applied math

covcorm

   Calculates a covariance or correlation matrix.

Prototype

        function covcorm (
                x [*][*] : numeric,
                iopt [2] : integer
        )

        return_val  :  numeric

Arguments

   x

   Data array of size(nrow,ncol).
   iopt

   iopt(0)=0 or 1 means return the covariance or correlation matrix.
   iopt(1)=0 return in symmetric storage mode: 1D of size [
   nrow*(nrow+1)/2 ]. iopt(1)=1 means that the return matrix will be a 2D
   array (nrow,nrow).

   There's a bug in V6.1.2 of this function in which "iopt" behaves the
   opposite of how it is described:
     * iopt=(/0,1/) behaves as if you had set iopt=(/1,0/)
     * iopt=(/1,0/) behaves as if you had set iopt=(/0,1/)
     * iopt=(/0,0/) or (/1,1/) works as described

   This will be fixed in the V6.2.0 release of NCL.

Return value

   See the description of iopt. The return numeric type will be double if
   x is double and float otherwise. The trace of the calculated matrix is
   returned as an attribute.

Description

   There's a bug in the handling of "iopt" in NCL V6.1.2. See the Argument
   section above.

   Standard calculation of covariance or correlation matrix. The original
   matrix may have to be reshaped to a two-dimensional array. The
   reshaping may be accomplished by the ndtooned and onedtond functions.

   Missing values (x@_FillValue) are allowed. However, interpretation of
   statistics derived from an input array, x, containing missing values
   should be done with appropriate caution because the elements of the
   derived covariance or correlation matrix will use differing numbers of
   values.

See Also

   eofunc,ndtooned,onedtond

Examples

   The following examples use data from:
  Statistics and Data Analysis in Geology
  John C Davis
  John Wiley and Sons: 2002:   3rd Edition:

   Specifically, the folllowing data which are contained within the ascii
   text file: "BOXES.TXT"
  3.760  3.660  0.540  5.275  9.768 13.741  4.782
  8.590  4.990  1.340 10.022  7.500 10.162  2.130
  6.220  6.140  4.520  9.842  2.175  2.732  1.089
  7.570  7.280  7.070 12.662  1.791  2.101  0.822
  9.030  7.080  2.590 11.762  4.539  6.217  1.276
  5.510  3.980  1.300  6.924  5.326  7.304  2.403
  3.270  0.620  0.440  3.357  7.629  8.838  8.389
  8.740  7.000  3.310 11.675  3.529  4.757  1.119
  9.640  9.490  1.030 13.567 13.133 18.519  2.354
  9.730  1.330  1.000  9.871  9.871 11.064  3.704
  8.590  2.980  1.170  9.170  7.851  9.909  2.616
  7.120  5.490  3.680  9.716  2.642  3.430  1.189
  4.690  3.010  2.170  5.983  2.760  3.554  2.013
  5.510  1.340  1.270  5.808  4.566  5.382  3.427
  1.660  1.610  1.570  2.799  1.783  2.087  3.716
  5.900  5.760  1.550  8.388  5.395  7.497  1.973
  9.840  9.270  1.510 13.604  9.017 12.668  1.745
  8.390  4.920  2.540 10.053  3.956  5.237  1.432
  4.940  4.380  1.030  6.678  6.494  9.059  2.807
  7.230  2.300  1.770  7.790  4.393  5.374  2.274
  9.460  7.310  1.040 11.999 11.579 16.182  2.415
  9.550  5.350  4.250 11.742  2.766  3.509  1.054
  4.940  4.520  4.500  8.067  1.793  2.103  1.292
  8.210  3.080  2.420  9.097  3.753  4.657  1.719
  9.410  6.440  5.110 12.495  2.446  3.103  0.914

   Example 1
   Compute the covariance matrix [iopt(0)=0] and return in symmetric
   storage mode [iopt(1)=0].
       diri     = "./"
       fili     = "BOXES.TXT"
                                          ; read the entire data array
       ntim     = 25                      ; number of observations [number of ti
me steps]
       mpts     = 7                       ; number of variables or grid points
       data     = asciiread( diri+fili, (/ntim,mpts/), "float")
       data!0   = "time"                  ; name the dimensions
       data!1   = "gridpts"

       cov_ssm  = covcorm( data(gridpts|:,time|:), (/0,0/)  )
       print(cov_ssm)

   The output values in symmetric storage mode are:
       5.400
       3.260
       5.846
        :
       2.252
       2.622
       2.594

   Example 2
   Compute the correlation matrix [iopt(0)=1] and return in symmetric
   storage mode [iopt(1)=0].
       corm_ssm = covcorm( data(gridpts|:,time|:), (/1,0/)  )
       print(corm_ssm)

   The output values in symmetric storage mode are:

       1.000
       0.580
       1.000
       0.201
       0.364
       1.000
        :
       0.427
       0.357
       1.000


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

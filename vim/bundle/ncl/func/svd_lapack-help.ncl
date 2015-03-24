THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/svd_lapack.shtml
THE_TITLE:svd_lapack
   NCL Home > Documentation > Functions > Singular value decomposition

svd_lapack

   Calculates the singular value decomposition of a general rectangular
   matrix.

Prototype

        function svd_lapack (
                A        : numeric,
                jobu [1] : string,
                jobv [1] : string,
                optv [1] : integer,
                U [*][*] : numeric,
                V [*][*] : numeric
        )

        return_val [*] :  float or double

Arguments

   A

   An N (column) x M (row) matrix which will be overwritten by the
   function. If the original A matrix is to be subsequently used by the
   user, then a copy should be made prior to invoking this function.

   If A has more than two dimensions, then all but the rightmost dimension
   will be collapsed into one single dimension (which we are referring to
   as N).
   jobu
   jobv

   For now, these are dummy options. They will be set to "S" and "S".
   optv

   If optv = 0, then V will contain the transpose(V) as is returned by the
   LAPACK routine. If optv = 1, then the V array will be returned.
   U

   (output)
   A two-dimensional array dimensioned min(M,N) x M. that will contain the
   left singular vectors. The user must pre-allocate space for this array.
   V

   (output)
   A two-dimensional array dimensioned N x N that will contain the right
   singular vectors. The user must pre-allocate space for this array.

Return value

   The return value is a one-dimensional array of length min(N,M). It will
   be of type double if A is double, and float otherwise.

Description

   This function calculates the singular value decomposition of a general
   rectangular matrix. The singular values and the left and right singular
   vectors are returned.

     A = U * S * transpose(V)

   where S is an N x M matrix which is zero except for its min(M,N)
   diagonal elements, U is an M x M orthogonal matrix, and V is an N x N
   orthogonal matrix. The diagonal elements of S are the singular values
   of A; they are real and non-negative, and are returned in descending
   order. The first min(M,N) columns of U and V are the left and right
   singular vectors of A.

   Note that the source LAPACK routine (dgesvd) returns V**T, not V.
   However, setting optv=1 will result in the return of V.

   Missing values are not allowed, and the routine will exit if any are
   encountered.

Examples

   Note: remember that NCL is row-major in terms of how it interprets
   arrays. This means that the rightmost dimension varies the fastest.

   Example 1

; Data source
; IMSL
; User's Manual
; Version 1,  April 1987
; Page 280

begin
; create a simple 2D array for example
  a1D = (/1., 3., 4., 2., 1., 1., 2., 2., 3., 1., 5., 2., 1., 1., 1., \
              3., 2., 2., 4., 3., 4., 1., 2., 3./)

  nra = 6      ; number rows    of matrix 'a'
  nca = 4      ; number columns
  a   = onedtond(a1D, (/nca,nra/) )  ; reshape to 2D

;          a= ( 4  1  2  1 )
;             ( 3  1  2  3 )
;             ( 4  1  3  4 )
;             ( 1  3  1  2 )
;             ( 2  2  5  1 )
;             ( 3  2  2  1 )

  u   = new ( (/nca,nra/) , typeof(a) )  ; pre-allocate space
  v   = new ( (/nca,nca/) , typeof(a) )  ; for returned arrays

  s   = svd_lapack (a, "S" , "S", 0,  u, v)

  delete (a)   ; no longer needed. it was over written
end

   The output would be:

 S: singular values: s@info= 0

 11.4850178
  3.2697501
  2.6533556
  2.0887298

 U: left singular vectors
  1   -0.3805    0.1197    0.4391    0.5654
  2   -0.4038    0.3451   -0.0566   -0.2148
  3   -0.5451    0.4293    0.0514   -0.4321
  4   -0.2648   -0.0683   -0.8839    0.2153
  5   -0.4463   -0.8168    0.1419   -0.3213
  6   -0.3546   -0.1021   -0.0043    0.5458

 V: right singular vectors: return V transpose
  1   -0.4443   -0.5581   -0.3244   -0.6212
  2    0.5555   -0.6543   -0.3514    0.3739
  3   -0.4354    0.2775   -0.7321    0.4444
  4   -0.5518   -0.4283    0.4851    0.5261

   Note: if optv=1, then V will be transposed:

 V: right singular vectors (v) ==> what IMSL returns:
  1   -0.4443    0.5555   -0.4354   -0.5518
  2   -0.5581   -0.6543    0.2775   -0.4283
  3   -0.3244   -0.3514   -0.7321    0.4851
  4   -0.6212    0.3739    0.4444    0.5261

   Example 2

   Assume x is dimensioned ntim x nlat x mlon with named dimensions
   "time", "lat", and "lon". If the user wishes "time" to be the number of
   rows (rightmost dimension), and both spatial dimensions (i.e. lat and
   lon) to be the number of columns, then dimension reordering should be
   used:

  nca = nlat*mlon                        ; for clarity only
  nra = ntim

  u   = new ( (/nca,nra/) , typeof(x) )  ; pre-allocate space
  v   = new ( (/nca,nca/) , typeof(x) )  ; for returned arrays

  s   = svd_lapack (x(lat|:,lon|:,time|:), "S" , "S", 0,  u, v)

   Here, NCL creates a temporary array to pass to the function.

   Note: 4D arrays, like time x lev x lat x lon, would be approached in
   the same way.

   Example 3

   Same as example 2, except that "time" is to be the number of columns,
   and both spatial dimensions (i.e. lat and lon) are to be the number of
   rows. Here, NCL's built-in reshaping functions, ndtooned and onedtond,
   must be used:

  nca = ntim                             ; for clarity only
  nra = nlat*mlon

  u   = new ( (/nca,nra/) , typeof(x) )  ; pre-allocate space
  v   = new ( (/nca,nca/) , typeof(x) )  ; for returned arrays

  xTemp = onedtond( ndtooned(x), (/nca,nra/))

  s   = svd_lapack (xTemp, "S" , "S", 0,  u, v)
  delete (xTemp)

   The creation of xTemp results in a 2D array where the spatial
   dimensions are the rightmost dimensions.

   Example 4

   Assume that a user has an ensemble of five arrays, and that the arrays
   are of size ntim x lat x lon and have named dimensions "time", "lat",
   and "lon". Further, assume that they are on five netCDF files. There
   are several ways to do this (i.e. addfiles), but here we will do it
   explicitly. Also, because these files may be large, we may reorder on
   input to minimize any subsequent temporary arrays. The downside is that
   input may be slower.

   [1] "time" is to be the "column":

   a   = new ( (/ncase,nlat,mlon,ntim/) , float)
   a!0 = "case"    ; name dimension

   f0  = addfile ("ensemble_0.nc" ,"r")
   f1  = addfile ("ensemble_1.nc" ,"r")
   f2  = addfile ("ensemble_2.nc" ,"r")
   f3  = addfile ("ensemble_3.nc" ,"r")
   f4  = addfile ("ensemble_4.nc" ,"r")

   a(0,:,:,:) = f0->x(lat|:,lon|:,time|:)
   a(1,:,:,:) = f1->x(lat|:,lon|:,time|:)
   a(2,:,:,:) = f2->x(lat|:,lon|:,time|:)
   a(3,:,:,:) = f3->x(lat|:,lon|:,time|:)
   a(4,:,:,:) = f4->x(lat|:,lon|:,time|:)

   nca = ncase*nlat*mlon                 ; for clarity only
   nra = ntim

   u   = new ( (/nca,nra/) , typeof(x) )  ; pre-allocate space
   v   = new ( (/nca,nca/) , typeof(x) )  ; for returned arrays

   s   = svd_lapack (a , "S" , "S", 0,  u, v)
   delete (a)

   ------- Example 5: ncl-talk question & answer

   Can anyone tell me why the singular value decomposition (svd_lapack)
   below yields different eigenvalues than the eigenanalysis (eofunc,
   eofunc_ts), while both output the exact same EOFs and PCs? Can't see
   what I'm doing wrong. Code and output are below.


;###############################################################################
#######
;                   ### data array A=(/ntime,nspace/) ###
;###############################################################################
#######
    A   = (/ (/-2.,1./),(/7.,-8./),(/-3.,0./),(/5.,-9./) /)
    A!0 = "time"
    A!1 = "space"
    ntime  = 4        ;### number of rows, time dimension 0 ###
    nspace = 2        ;### number of columns, space dimension 1 ###

    Aprime = dim_rmvmean_n(A,0)

    ;### singular value decomposition of Aprime ###
    ;### Aprime=(u)(s)(vtranspose)-----> (4x2)=(4x2)(2x2)(2x2) ###

    u            = new ( (/ntime,nspace/) , float )           ;### columns of u
are PC eigenvectors ###
    vtranspose   = new ( (/nspace,nspace/) , float )          ;### rows of vtran
spose are EOF eigenvectors ###
    s            = svd_lapack (Aprime, "S" , "S", 0,  vtranspose, u)        ;###
 s^2=eigenvalues
                                                                            ;###
 s is returned with only the non-zero (diagonal) values

    print("for SVD")
    print("U:")
    write_matrix (u, "2f10.4", False)

    print("V:")
    write_matrix (vtranspose, "2f10.4", False)
    print("lambda:")
    print(s^2)

    At  = transpose(A)          ;### make time the rightmost dimension ###
    eof = eofunc(At,2,False)    ;### rows of eof are EOFs ###
    eoftranspose = transpose(eof)
    pc  = eofunc_ts_Wrap(At,eof,False)    ;### rows of pc are PCs ###
    pctranspose  = transpose(pc)           ;### for similarity to SVD matrices,
now columns of pc are PCs ###
    pc_colsum    = dim_sum_n(pctranspose^2,0)    ;### square each component and
sum the columns ###
    pctranspose(:,0) = pctranspose(:,0)/sqrt(pc_colsum(0))    ;### normalize PC1
    pctranspose(:,1) = pctranspose(:,1)/sqrt(pc_colsum(1))    ;### normalize PC2

    print("for eofunc")
    print("U:")
    write_matrix (pctranspose, "2f10.4", False)

    print("V:")
    write_matrix (eof, "2f10.4", False)
    print("lambda:")
    print(eof@eval)
;###############################################################################
#######


   OUPUT IS:

   (0) for SVD (0) U:

   0.5010 0.4050 -0.5261 0.5745 0.4983 -0.3748 -0.4732 -0.6046

   (0) V:

   -0.6898 0.7240 0.7240 0.6898

   (0) lambda: (0) 153.4626 (1) 3.287447

   (0) for eofunc (0) U:

   0.5010 0.4050 -0.5261 0.5745 0.4983 -0.3748 -0.4732 -0.6046

   (0) V:

   -0.6898 0.7240 0.7240 0.6898

   (0) lambda: (0) 51.15419 (1) 1.095816

   ANSWER:

   They should be different by a factor of 1/(n-1), since eofunc is
   computing the covariance matrix itself. In your case, that factor is
   exactly 1/3.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

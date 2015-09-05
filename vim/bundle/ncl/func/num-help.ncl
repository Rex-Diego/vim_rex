THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/num.shtml
THE_TITLE:num
   NCL Home > Documentation > Functions > Array query

num

   Counts the number of True values in the input.

Prototype

        function num (
                val  : logical
        )

        return_val [1] :  integer or long

Arguments

   val

   An array of logical values of any dimensionality.

Description

   This function counts the number of True values in the input, ignoring
   missing values.

   All numerical values except for 0 evaluate to True.

   As of version 6.0.0, this function will return type "long" if the count
   is greater than or equal to 2 GB.

See Also

   all, any, ind

Examples

   Example 1

   The following is a simple example that should print the value "2":
    a = (/1,2,3,4,5/)
    print(num(a.gt.3))

   Example 2

   To count the number of non-missing values in an array, use the
   ismissing function. The input array must have the _FillValue attribute
   set:
    N = num(.not.ismissing(x))

   Example 3

   Assume x is a four-dimensional array with dimensions ntim x klev x nlat
   x mlon. Use ismissing and num to count the number of missing values at
   each level and time, and print out the number as a percent of the
   total:
  NM = 100./(nlat*mlon)      ; the 100. will force NM to be type float

  do nt=0,ntim-1
    do kl=0,klev-1
       N = num(ismissing(x(nt,kl,:,:)))
       PC= N/NM
       print ("nt="+nt+"  kl="+kl+" N="+N+"  %="+PC)
    end do
  end do

   Example 4

   Compute the joint pdf of two variables C and V. This arose from a
   question sent to ncl-talk.
begin
  N = 10000
  c = random_normal ( 0,5,N)
  v = random_normal ( 0,5,N)

  nc_bin = 51                     ; => 50 bins
  nv_bin = 41                     ; => 40 bins
  c_bin  = fspan(-10,10,nc_bin)
  v_bin  = fspan(-5 ,20,nv_bin)

  count = new ( (/nc_bin,nv_bin/) , integer)
  count = 0                       ; initialize to 0

  do ic=0,nc_bin-2
    do iv=0,nv_bin-2
       count(ic,iv) = num(c.ge.c_bin(ic) .and. c.lt.c_bin(ic+1) .and. \
                          v.ge.v_bin(iv) .and. v.lt.v_bin(iv+1) )
       if (count(ic,iv).gt.0) then
           print("ic="+ic+"  iv="+iv+"    count="+count(ic,iv) )
       end if
    end do
  end do

  fpc = (100.*count)/N    ; frequency [%]    (nc_bin,nv_bin)
  printVarSummary(fpc)

  K = sum( count )                           ; < N
  F = sum( fpc )
  print("------")
  print("K="+K+"   F[%]="+F)
  print("------")

; extra stuff

  cbmin = min(c_bin)
  cbmax = max(c_bin)
  vbmin = min(v_bin)
  vbmax = max(v_bin)
                                              ; count corner outlier cases
  k1    = num (c.lt.cbmin .and. v.lt.vbmin)
  k2    = num (c.lt.cbmin .and. v.ge.vbmax)
  k3    = num (c.ge.cbmax .and. v.lt.vbmin)
  k4    = num (c.ge.cbmax .and. v.ge.vbmax)
                                              ; one outlier, one not
  k5    = num (c.lt.cbmin .and. v.ge.vbmin .and. v.lt.vbmax)
  k6    = num (c.ge.cbmax .and. v.ge.vbmin .and. v.lt.vbmax)
  k7    = num (v.lt.vbmin .and. c.ge.cbmin .and. c.lt.cbmax)
  k8    = num (v.ge.vbmax .and. c.ge.cbmin .and. c.lt.cbmax)

  KTOT  = K + k1+ k2+ k3+ k4+ k5+ k6+ k7+ k8

  print("k1="+k1)
  print("k2="+k2)
  print("k3="+k3)
  print("k4="+k4)
  print("k5="+k5)
  print("k6="+k6)
  print("k7="+k7)
  print("k8="+k8)

  print("------")
  print("KTOT="+KTOT)
  print("------")

  if (KTOT.eq.N) then
      print (" Lucky!!! Numbers add up.  :-)")
  end if
end

   Sampled out includes:
       ic=0  iv=1    count=1
       ic=0  iv=2    count=2
[snip]
       ic=15  iv=0    count=8
       ic=15  iv=1    count=10
       ic=15  iv=2    count=8
       ic=15  iv=3    count=8
       ic=15  iv=4    count=15
       ic=15  iv=5    count=11
       ic=15  iv=6    count=12
       ic=15  iv=7    count=10
       ic=15  iv=8    count=16
       ic=15  iv=9    count=13
       ic=15  iv=10    count=14
[snip]
       ic=49  iv=16    count=2
       ic=49  iv=17    count=3
       ic=49  iv=19    count=1

---------
Variable: fpc
Type: float
Total Size: 8364 bytes
            2091 values
Number of Dimensions: 2
Dimensions and sizes:   [51] x [41]
---------

       K=8014   F[%]=80.1399

       k1=40
       k2=0
       k3=34
       k4=0
       k5=200
       k6=181
       k7=1529
       k8=2

       KTOT=10000

       Lucky!!! Numbers add up.  :-)




   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

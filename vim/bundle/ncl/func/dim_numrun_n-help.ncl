THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_numrun_n.shtml
THE_TITLE:dim_numrun_n
   NCL Home > Documentation > Functions > General applied math

dim_numrun_n

   Counts the number of "runs" (sequences) within a series containing
   zeros and ones.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function dim_numrun_n (
                x       : integer,
                opt [1] : integer,
                dim [1] : integer
        )

        return_val  :  integer

Arguments

   x

   An array of any dimensionality containing only 0s and 1s.
   opt

   Scalar integer which indicates how "runs" will be counted. opt=0 will
   result in the total number of runs; opt=1 will result in the number of
   unique "runs". See Examples.
   dim

   Equal to the dimension of x on which to count the number of runs.

Return value

   An integer array with the same dimensionality as x.

Description

   The dim_numrun_n function counts the number of "runs" 1s in the
   dimension indicated by dim for each index of the remaining dimensions.
   Missing values are not allowed.

See Also

   num, dim_num_n, dim_avg_n, dim_median_n, dim_max_n, dim_min_n,
   dim_product_n, dim_rmsd_n, dim_rmvmean_n, dim_rmvmed_n,
   dim_standardize_n, dim_stat4_n, dim_stddev_n, dim_sum_n,
   dim_variance_n, copy_VarMeta

Examples

   The dim_numrun_n function returns an integer array of the same size and
   shape as the input array. Each subscript of the dimension being
   operated upon corresponds to a "run". Since NCL subscripts are
   zero-based, the length of the "run" is the subscript plus one.

   Example 1

    x  = (/1,0,1,0,1,1,1,0,1,1,0,1,1,0/)
    r0 = dim_numrun_n (x, 0, 0)  ; ==> r0=(/9,4,1,0,0,0,0,0,0,0,0,0,0,0/)
    r1 = dim_numrun_n (x, 1, 0)  ; ==> r1=(/2,2,1,0,0,0,0,0,0,0,0,0,0,0/)

    nx = dimsizes(x)
    do n=0,nx-1
       print((n+1)+"  ==> "+r0(n)+"   "+r1(n)) ; "run" length is index plus one

    end do

   will yield
        run
 index length        r0    r1
   0      1    ==>    9     2
   1      2    ==>    4     2
   2      3    ==>    1     1
   3      4    ==>    0     0
   4      5    ==>    0     0
[snip]
   12     13   ==>    0     0
   13     14   ==>    0     0

   Example 2

   Same as Example 1 but a longer series. It illustrates that 1s at the
   beginning and end are included in the run count.
    x  = (/1,0,1,1,1,0,0,1,1,0 \
          ,1,1,1,0,1,0,1,0,1,1 \
          ,1,0,1,1,1,1,1,1,1,0 \
          ,0,0,1,1,1,1,1,1,1,1 \
          ,1,1,1,1,0,0,1,1,1,1 /)

    r0 = dim_numrun_n (x, 0, 0)
    r1 = dim_numrun_n (x, 1, 0)

   will yield
        run
 index length        r0    r1
   0      1    ==>   37     3
   1      2    ==>   27     1
   2      3    ==>   20     3
   3      4    ==>   14     1
   4      5    ==>   11     0
   5      6    ==>    9     0
   6      7    ==>    7     1
   7      8    ==>    5     0
   8      9    ==>    4     0
   9     10    ==>    3     0
  10     11    ==>    2     0
  11     12    ==>    1     1
  12     13    ==>    0     0
  13     14    ==>    0     0
[SNIP]
  48     49    ==>    0     0
  49     50    ==>    0     0

   Example 3

   Let p(time,lat,lon) contain (say) daily precipitation and "wdval"
   indicate a value that should be the boundary between wet and dry. Of
   course, "wdval=0.0" is common. Create an array of 0s and 1s and compute
   the number of unique wet and dry sequences. NCL regards the leftmost
   dimension (here, "time") as number 0.

   wdval  = 0.0
   dry    = where( p.le.wdval, 1, 0) ; create 0/1 array
   wet    = where( p.gt.wdval, 1, 0)

   dryrun = dim_numrun_n (dry, 1, 0) ; opt=1 means "unique"
   wetrun = dim_numrun_n (wet, 1, 0)

   delete(dry)
   delete(wet)

; optional ... add meta data

   dryrun@long_name = "total dry runs"
   dryrun@wet_dry_crit_value = wdval
   copy_VarCoords(p, dryrun)          ; contributed.ncl

   wetrun@long_name = "unique wet runs"
   dryrun@wet_dry_crit_value = wdval
   copy_VarCoords(p, wetrun)

   Example 4

   Let tmx(time,lat,lon) contain (say) daily maximum temperatures and
   'tcrit' be some critical temperature. Create an array of 0s and 1s and
   compute the total and unique sequences of daily maximum temperatures in
   a row that exceed 'tcrit.' NCL regards the leftmost dimension (here,
   "time") as number 0.

   tcrit  = 35.
   hot    = where( tmx.ge.tcrit, 1, 0) ; create 0/1 array

   hot0   = dim_numrun_n(hot, 0, 0)    ; opt=0 means "total"
   hot1   = dim_numrun_n(hot, 1, 0)    ; opt=1 means "unique"

; optional ... add meta data

   hot0@long_name = "total hot runs"
   hor0@hot_crit_value = tcrit
   copy_VarCoords(tmx, dryrun)          ; contributed.ncl

   hot1@long_name = "unique hot runs"
   hot1@hot_crit_value = tcrit
   copy_VarCoords(tmx, wetrun)

   Example 5

   Calculate the maximum run length of x[*] greater than 5.85 and less
   than 9.1
   xband     = where( x.gt.5.85 .and. x.lt.9.1 .and. , 1, 0)  ; (/1,0,1,0,1,1,1,
0,1,1,0,1,1,0/)
   xband_run = dim_numrun_n(xband, 0, 0)                       ; (/9,4,1,0,0,0,0
,0,0,0,0,0,0,0/)
   indmx     = ind(xband_run.ne.0)                             ; (/0, 1, 2/) ==>
 subscripts (index)
   if (.not.indmx(0)) then
       mxrun = indmx(dimsizes(indmx)-1) + 1  ; add 1 because NCL is 0-based inde
xing
   end if
   print(mxrun)                 ; ==> mxrun=3

   Example 6

   Calculate the maximum run length for x(ntime,nlat,mlon) when greater
   than 5.85 and less than 9.1 at each grid point. In general, the
   returned index values will be different at each grid point. Here a
   function is created for cleaner code:
undef("maxrunlen")
function maxrunlen( runs )
; find max run length
; Example:
; runs = dim_runnum_n(p.gt.5, 0, 0) ; where p(ntim) or p(ntim,jlat,ilon)
;                                   ; runs(ntim) or runs(ntim,jlat,ilon)
; maxrun = maxrunlen( runs )

local dimr, rankr, maxrun, i, j, indrun
begin
  dimr   = dimsizes(runs)
  rankr  = dimsizes(dimr)

  if (.not.(rankr.eq.1 .or. rankr.eq.3)) then
      print("maxrunlen: rankr="+rankr+" not yet supported")
      exit
  end if

  if (rankr.eq.1) then
      maxrun = new( 1, "integer", -999)
      indrun = ind( runs.ne.0 )
      if (.not.ismissing(indrun(0))) then
          maxrun = indrun(dimsizes(indrun)-1) + 1
      else
          maxrun = 0
      end if
  end if

  if (rankr.eq.3) then
      maxrun = new ( dimr(1:rankr-1), "integer", -999)
      do j=0,dimr(1)-1
        do i=0,dimr(2)-1
           indrun = ind( runs(:,j,i).ne.0 )
           if (.not.ismissing(indrun(0))) then
               maxrun(j,i) = indrun(dimsizes(indrun)-1) + 1
           end if
           delete(indrun)       ; may change size next iteration
        end do
      end do
      copy_VarCoords(runs(0,:,:), maxrun)
  end if

  maxrun@long_name = "max run length"
  return(maxrun)
end

[SNIP]

  xband     = where( x.gt.5.85 .and. xband.lt.9.1, 1, 0)   ; xband(ntime,nlat,ml
on)
  xband_run = dim_numrun_n(xband, 0, 0)                    ; xband(ntime,nlat,ml
on)

  xband_maxrun = maxrunlen( xband_run )


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

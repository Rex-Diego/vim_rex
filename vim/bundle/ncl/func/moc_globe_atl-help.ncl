THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/moc_globe_atl.shtml
THE_TITLE:moc_globe_atl
   NCL Home > Documentation > Functions > CESM

moc_globe_atl

   Facilitates calculating the meridional overturning circulation for the
   globe and Atlantic.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function moc_globe_atl (
                lat_aux_grid    [*] : numeric,
                a_wvel    [*][*][*] : numeric,
                a_bolus   [*][*][*] : numeric,
                a_submeso [*][*][*] : numeric,
                tlat         [*][*] : numeric,
                rmlak     [2][*][*] : integer
        )

        return_val [moc_comp] [n_transport_reg] [kdepth] [nyaux] :  numeric

Arguments

   lat_aux_grid

   Latitude grid for transport diagnostics.
   a_wvel

   Area weighted Eulerian-mean vertical velocity [TAREA*WVEL].
   a_bolus

   Area weighted Eddy-induced (bolus) vertical velocity [TAREA*WISOP].
   a_submeso

   Area weighted submeso vertical velocity [TAREA*WSUBM].
   tlat

   Array of t-grid latitudes
   rmlak

   Basin index number: [0]=Globe, [1]=Atlantic

Return value

   A multi-dimensional array of size [moc_comp] x [n_transport_reg] x
   [kdepth] x [nyaux] where:
     * moc_comp refers to the three components returned
     * n_transport_reg refers to the Globe and Atlantic
     * kdepth is the the number of vertical levels of the work arrays
     * nyaux is the size of the lat_aux_grid

   The type of the output data will be double only if a_wvel or a_bolus or
   a_submesa is of type double. Otherwise, the return type will be float.

Description

   This is not a function that is meant to stand alone. It is provided for
   computational efficiency reasons. It is driven by a script written as
   part of the ocean diagnostics package.

Examples

   A driver code might look like the following. Numerous 'timing' function
   may be removed if desired. They were used to isolate possible regions
   of slow execution.

; ==============================================================
; NCL script to compute POP MOC field offline from POP netcdf
; history files.  This routine is designed for the CESM4 ocean
; component.
; ==============================================================
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

begin
; ==============================================================
; Input/Output
; ==============================================================
  tempfile = "/cgd/oce/xxxxx/POP_grids/gx1v6_ocn.nc"
  infile   = "/ptmp/xxxxx/testmoc/tavg.nc"
  outfile  = "./moc_globe_atl.ncl_tavg.gx1v6_ocn.nc"

; ==============================================================
; Read in variable templates from a POP netcdf which already
; includes MOC diagnostics
; ==============================================================
  f        = addfile (tempfile, "r")
  MOCnew   = f->MOC      ; (1,2,3,61,395)
  MOCnew   = 0.0         ; keep meta data

  moc_components       = f->moc_components
  transport_components = f->transport_components
  transport_regions    = f->transport_regions
  lat_aux_grid         = f->lat_aux_grid

  nyaux = dimsizes(lat_aux_grid)       ; 395
  dims  = dimsizes(transport_regions)  ; (0)=2 , (1)=256
  n_transport_reg = dims(0)
  if (n_transport_reg.ne.2) then
      print("ERROR -- only works for MOC global & Atlantic")
      exit
  end if

; ==============================================================
; Read in needed variables from a POP netcdf which lacks MOC
; ==============================================================
  f      = addfile (infile, "r")
  w_e    = f->WVEL              ; Eulerian-mean vertical velocity
  w_i    = f->WISOP             ; Eddy-induced (bolus) vertical velocity
  w_sm   = f->WSUBM             ; Eddy-induced (bolus) vertical velocity
  tarea  = f->TAREA             ; [60] x [384] x [320]  => double
  rmask  = f->REGION_MASK       ; [384] x [320] => int
  kmt    = f->KMT
  tlat   = f->TLAT              ; [384] x [320] => float

  dims   = dimsizes(tarea)
  ny     = dims(0)
  nx     = dims(1)
  km     = max(kmt)

; ==============================================================
; construct arrays used for array operations
; ==============================================================
  TimeDate = systemfunc("date")

  REGION_MASK_LAT_AUX        = new((/n_transport_reg,ny,nx/),integer)
  printVarSummary(REGION_MASK_LAT_AUX)

  REGION_MASK_LAT_AUX(0,:,:) = rmask
  REGION_MASK_LAT_AUX(1,:,:) = rmask

  REGION_MASK_LAT_AUX(0,:,:) = where(rmask.gt.0, 1, 0)
  REGION_MASK_LAT_AUX(1,:,:) = where(rmask.ge.6.and.rmask.le.11, 1, 0)
  wallClockElapseTime(TimeDate, "made REGION_MASK_LAT_AUX",0)
  TimeDate = systemfunc("date")

  k3d     = conform_dims((/km,ny,nx/),ispan(0,km-1,1),(/0/))
  kmt3d   = conform_dims((/km,ny,nx/),kmt  ,(/1,2/))
  tarea3d = conform_dims((/km,ny,nx/),tarea,(/1,2/))
  ocean   = k3d.le.kmt3d

  WORK1   = tofloat(where(ocean,w_e(0,:,:,:)*tarea3d,0.0))
  WORK2   = tofloat(where(ocean,w_i(0,:,:,:)*tarea3d,0.0))
  WORK3   = tofloat(where(ocean,w_sm(0,:,:,:)*tarea3d,0.0))
  WMSG    = WORK1@_FillValue

  delete(w_e)
  delete(w_i)
  delete(w_sm)
  delete(k3d)
  delete(kmt3d)
  delete(tarea3d)
  delete(ocean)
  wallClockElapseTime(TimeDate, "made WORK1-3",0)

; ==============================================================
; compute MOC
; http://test.www.ncl.ucar.edu/Document/Functions/Built-in/moc_globe_atl.shtml
; ==============================================================
  TimeDateMOC = systemfunc("date")

  lat_aux_region2_start = nyaux
  ntr   = n_transport_reg

               ; MOCGA(3,2,kdepth,nyaux)
  ilat_aux_grid = toint(lat_aux_grid)
  MOCGA = moc_globe_atl(lat_aux_grid,WORK1,WORK2,WORK3,tlat,REGION_MASK_LAT_AUX)

               ; Atlantic
  do n=1,nyaux-1
       section = tlat .ge. lat_aux_grid(n-1) .and. \
                 tlat .lt. lat_aux_grid(n)   .and. \
                 REGION_MASK_LAT_AUX(1,:,:).eq.1
       if (any(section) .and. n.lt.lat_aux_region2_start) then
           lat_aux_region2_start = n
       end if
  end do

  MOCnew(0,0,0,0:km-1,:) = (/ dim_cumsum(MOCGA(0,0,:,:),2) /)
  MOCnew(0,0,1,0:km-1,:) = (/ dim_cumsum(MOCGA(1,0,:,:),2) /)
  MOCnew(0,0,2,0:km-1,:) = (/ dim_cumsum(MOCGA(2,0,:,:),2) /)
  MOCnew(0,1,0,0:km-1,:) = (/ dim_cumsum(MOCGA(0,1,:,:),2) /)
  MOCnew(0,1,1,0:km-1,:) = (/ dim_cumsum(MOCGA(1,1,:,:),2) /)
  MOCnew(0,1,2,0:km-1,:) = (/ dim_cumsum(MOCGA(2,1,:,:),2) /)

  delete(WORK1)
  delete(WORK2)
  delete(WORK3)
  delete(MOCGA)
  wallClockElapseTime(TimeDateMOC, "MOC: Computed MOC",0)

; ==============================================================
; compute MOC addition at Atlantic southern boundary
; ==============================================================
  TimeDateMOC_moc_s = systemfunc("date")

  moc_s = new((/3,km/),float)
  moc_s = 0.0
  v_e   = f->VVEL               ; Eulerian-mean grid-y velocity
  v_i   = f->VISOP              ; Eddy-induced (bolus) grid-y velocity
  v_sm  = f->VSUBM              ; Eddy-induced (bolus) grid-y velocity
  dxu   = f->DXU
  htn   = f->HTN
  dz    = f->dz

  WORK1 = new((/km,ny,nx/),double)
  WORK2 = new((/km,ny,nx/),double)
  WORK3 = new((/km,ny,nx/),double)

  dxuk  = conform(WORK1,dxu,(/1,2/))
  htnk  = conform(WORK1,htn,(/1,2/))

  WORK1             = 0.5 * v_e(0,:,:,:) * dxuk
  WORK2(:,:,1:nx-1) = WORK1(:,:,0:nx-2)
  WORK2(:,:,0)      = 0.0

  WORK1 = WORK1+WORK2
  WORK2 = v_i(0,:,:,:) * htnk
  WORK3 = v_sm(0,:,:,:) * htnk

  wallClockElapseTime(TimeDateMOC_moc_s, "MOC: WORK1-3 for South: moc_s",0)

  rmlak0 = conform(WORK1, REGION_MASK_LAT_AUX(0,:,:), (/1,2/))
  rmlak1 = conform(WORK1, REGION_MASK_LAT_AUX(1,:,:), (/1,2/))

  j      = lat_aux_region2_start
  TMP1   = where(rmlak1(:,j+1,:) .eq. 1,WORK1(:,j,:),0.0)
  TMP2   = where(rmlak1(:,j+1,:) .eq. 1,WORK2(:,j,:),0.0)
  TMP3   = where(rmlak1(:,j+1,:) .eq. 1,WORK3(:,j,:),0.0)

  moc_s(0,:) = tofloat(dimsum(TMP1))
  moc_s(1,:) = tofloat(dimsum(TMP2))
  moc_s(2,:) = tofloat(dimsum(TMP3))

  delete(WORK1)
  delete(WORK2)
  delete(WORK3)
  delete(TMP1)
  delete(TMP2)
  delete(TMP3)

  wallClockElapseTime(TimeDateMOC_moc_s, "MOC: made moc_s",0)

  moc_s(:,km-1) = - dz(km-1) * moc_s(:,km-1)
  k = km-2
  do while(k.ge.0)
     moc_s(:,k) = moc_s(:,k+1) - dz(k) * moc_s(:,k)
     k=k-1
  end do

  wallClockElapseTime(TimeDateMOC_moc_s, "MOC: finalized moc_s",0)

; ==============================================================
; Add southern boundary for Atlantic only
; set dims == ntransport_req=2,moc_comp=3,km=60,nyaux=395
; ==============================================================

  moc_sn = conform(MOCnew(0,1,:,0:km-1,:),moc_s,(/0,1/))
  MOCnew(0,1,:,0:km-1,:) = MOCnew(0,1,:,0:km-1,:)+moc_sn
  TimeDate = systemfunc("date")
  print("finalized MOC, "+TimeDate)

; ==============================================================
; Convert to Sverdrups
; ==============================================================
  MOCnew = MOCnew*1.0e-12
  MOCnew@units = "Sverdrups"

; ==============================================================
; Save to netcdf
; ==============================================================
  system("/bin/rm -f "+outfile)
  outf      = addfile(outfile,"c")
  outf->MOC = MOCnew
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

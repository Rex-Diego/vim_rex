THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/pop_remap.shtml
THE_TITLE:pop_remap
   NCL Home > Documentation > Functions > Regridding, CESM, Oceanography

pop_remap

   Regrids a POP ocean model grid to another grid.

Prototype

        procedure pop_remap (
                x_dst      [*] : numeric,
                map_wts [*][*] : numeric,
                dst_add    [*] : integer,
                src_add    [*] : integer,
                x_src      [*] : numeric
        )

        return_val  :  numeric

Arguments

   x_dst

   (output)
   A one-dimensional array representing all points in the destination
   grid. The size is determined by the SCRIP software's variable
   dst_grid_dims. Must be the same type as x_src.
   map_wts

   A two-dimensional array equal to the remapping weights. The dimension
   order is (num_links,num_wgts) using SCRIP nomenclature.
   dst_add

   An one-dimensional array equal to the destination addresses.
   src_add

   An one-dimensional array equal to the source addresses.
   x_src

   A one-dimensional array representing all points in the source grid.
   Must be the same type as x_dst

Description

   Regrids a POP ocean model grid to another grid using weights, source
   addresses and destination addresses from the SCRIP (Spherical
   Coordinate Remapping and Interpolation Package). Only users familiar
   with SCRIP should use this function.
   This routine performs the appropriate first-order multiplication
   between the values in a one dimensional representation of the source
   grid and derived weights. The output is a one dimensional
   representation of the output grid.
   ndtooned and onedtond can be used to perform the transformations
   between multi-dimensional arrays and one dimensional arrays.
   It is the user's responsibility to read in the appropriate data from a
   SCRIP file.
   References
Jones, Philip W. (1999): First and Second Order Conservative
Remapping Schemes for Grids in Spherical Coordinates.
Monthly Weather Review: v127 pp 2204-2210.

Jones, Philip W. (1998): A User's Guide for SCRIP: A Spherical
Coordinate Remapping and Interpolation Package. Version 1.2.
Los Alamos National Laboratory.

   For more robust regridding, see the ESMF regridding examples, which
   show how to regrid data from and to rectilinear, curvilinear, or
   unstructured grids. Available in version 6.1.0 and later.

See Also

   ESMF_regrid

Examples

   Example 1

   Let Src_to_Dst.nc represent the SCRIP file with the desired regridding
   information. Let XIN be the two-dimensional source grid and XOUTbe the
   two-dimensional destination grid.
fP = addfile("Src_to_Dst.nc","r")    ; SCRIP netCDF file

dim_x   = dimsizes( XIN )             ; XIN is the variable to be remapped
nDx     = dimsizes( dim_x )           ; rank [# dimensions]
dim_src = fP->src_grid_dims           ; size source grid
                                      ; error check
if (dim_x(nDx-2).ne.dim_src(1) .or. dim_x(nDx-1).ne.dim_src(0)) then
    print (" Input grid and Remap sizes do not match")
    exit
end if

dst_add = fP->dst_address              ; destination grid [linear]
src_add = fP->src_address              ; source grid [linear]
map_wts = fP->remap_matrix             ; wts
dim_dst = fP->dst_grid_dims            ; size destination grid

mx      = dim_dst(0)                   ; output # elements in "x"
ny      = dim_dst(1)                   ; output # elements in "y"

xout_1D = new (ny*mx, typeof(XIN))    ; (temporary) return grid [1D]
xin_1D  = ndtooned ( XIN )            ; convert to 1D

pop_remap(xout_1D, map_wts, dst_add, src_add, xin_1D)

XOUT = onedtond(xout_1D, (/ny,mx/) )   ; new grid

delete(xout_1D)                        ; clean up
delete(xin_1D)
delete(dst_add)
delete(src_add)
delete(map_wts)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

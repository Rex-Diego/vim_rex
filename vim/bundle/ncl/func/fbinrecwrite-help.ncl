THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fbinrecwrite.shtml
THE_TITLE:fbinrecwrite
   NCL Home > Documentation > Functions > File IO

fbinrecwrite

   Writes a single unformatted sequential access Fortran record to a file.

Prototype

        procedure fbinrecwrite (
                path    [1] : string,
                rec_num [1] : integer,
                var
        )

Arguments

   path

   Pathname to binary file
   rec_num

   Record number to write to the file beginning at 0, -1 for append
   var

   A variable of any dimensionality and type

Description

   fbinrecwrite writes a single unformatted sequential access binary
   record to the file path. If rec_num is equal to -1 then var is appended
   to the end of the file. If rec_num is not equal to -1 then it is the
   record number to be written.

   By default, the elements of var are written to the file using the
   machine's native binary format. To force the byte order to be written
   as big-endian or little-endian, see the "WriteByteOrder" option in the
   setfileoption procedure.

   By default, the record marker size at the beginning and end of Fortran
   sequential files is assumed to be 4 bytes. In V6.1.1 and later, you can
   change this to 8 bytes using the "RecordMarkerSize" option in the
   setfileoption procedure.

See Also

   fbinnumrec, fbinrecread, fbindirread, fbinread, fbinwrite,
   fbindirwrite, setfileoption, isbigendian

Examples

   Example 1

   NCL code fragment: let a(5) be of type integer and x(100), y(399),
   z(64,128) be of type float. Append each succeeding record:
     filo = "example01"            ; output file
     fbinrecwrite (filo, -1, a)
     fbinrecwrite (filo, -1, x)
     fbinrecwrite (filo, -1, y)
     fbinrecwrite (filo, -1, z)

   Fortran (f77 here) code fragment: the read statements must be in the
   same order as they were in the fortran program:
     integer a(5)
     real    x(100), y(399), z(128,64)

     open (11,file="example01",form="unformatted", access="sequential")

     read (11) a
     read (11) x
     read (11) y
     read (11) z

   Example 2:

   NCL code fragment: assume that scalar variables year, mon, day and hour
   are to be written to a file, in addition to, say, three
   multi-dimensional grids, say, u(64,128), v(64,128), z(64,128,17,31):
     filo    = "example02"       ; output file
     time    = new ( 4, "integer")
     time(0) = year              ; explicitly assign
     time(1) = mon
     time(2) = day
     time(3) = hour
     fbinrecwrite (filo, -1, time)
     fbinrecwrite (filo, -1, u )
     fbinrecwrite (filo, -1, v )
     fbinrecwrite (filo, -1, z )

   Fortran code fragment to read:
     integer itime(4)
     real    u(128,64), v(128,64), z(64,128,17,31)

     open (11,file="example02",form="unformatted", access="sequential")

     read (11) itime
     read (11) u
     read (11) v
     read (11) z

   Example 3: let data(ntim,nfld,nlvl,nlat,mlon) be of type double

   Use NCL to write as one physical record:
     fbinrecwrite (filo, -1, data )

   Fortran:
     double precision data(ntim,nfld,nlvl,nlat,mlon)
     open (unit=8, file=`data.ieee', form=`unformatted')
     read (8) data

   Example 4: let data(ntim,nfld,nlvl,nlat,mlon) be of type float and, for
   some reason, it is desired to write two-dimensional records. Here,
   ntim=2, nfld=8, nlvl=18, nlat=73, mlon=144.
    do i=0,ntim-1
     do j=0,nfld-1
      do k=0,nlvl-1
         fbinrecwrite (filo, -1, data(:,:,k,j,i) )
       enddo
     enddo
    enddo

   Fortran code fragment (one way to read the data):
    integer mlon, nlat, nlvl, nfld, ntim
    parameter (mlon=144)  ! number of longitudes
    parameter (nlat=73)   ! number of latitudes
    parameter (nlvl=18)   ! number of levels
    parameter (nfld=8)    ! number of variables
    parameter (ntim=2)    ! number of time steps
    real data(mlon,nlat)

    open (unit=8, file=`data.ieee', form=`unformatted')
    do i=1,ntim
     do j=1,nfld
      do k=1,nlvl
         read (8) data    ! this will be 2D
       enddo
     enddo
    enddo


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

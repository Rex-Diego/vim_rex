THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_gbits.shtml
THE_TITLE:dim_gbits
   NCL Home > Documentation > Functions > Array manipulators

dim_gbits

   Unpacks bit chunks from the rightmost dimension of the input array.

Prototype

        function dim_gbits (
                npack  : numeric,  ; byte, ubyte, short, ushort, integer
                ibit   : integer,
                nbits  : integer,
                nskip  : integer,
                iter   : integer
        )

        return_val  :  typeof(npack)

Arguments

   npack

   The array to be unpacked. It can be a byte, ubyte, short, ushort, or
   integer array of any dimensionality. The rightmost dimension will be
   unpacked. (The recognition of ubyte and ushort types was added in NCL
   V6.0.0)
   ibit

   A bit-count offset to be used before the first bit chunk is unpacked.
   For example, if npack is one-dimensional and if ibit=3 and nbits=5,
   then 3 bits in npack will be skipped and the next 5 bits will be
   unpacked into the returned array.
   nbits

   The number of bits in each bit chunk to be unpacked.
   nskip

   The number of bits to skip between each bit chunk to be unpacked (after
   the first bit chunk has been unpacked).
   iter

   The number of bit chunks to be unpacked. Usually, iter is the same size
   as the rightmost dimension of npack.

Return value

   The return array will be the same type as npack. The dimensionality
   will depend on the remaining input parameters (see description and
   examples below).

Description

   Important note: As of version 6.0.0, bytes are now signed (instead of
   unsigned). Use the "ubyte" type if you need to mimic the behavior of
   the old unsigned byte type.

   dim_gbits unpacks bit chunks from the input array npack into an output
   array isam. iter bit chunks of length nbits with nskip bits being
   skipped between each bit chunk in the input array are unpacked into
   isam. Each bit chunk in the input array is unpacked into a separate
   word in isam, right-justified with zero-fill. Initially, ibit bits will
   be skipped at the beginning of the input array before unpacking.

   The following depicts the role of each argument. Assume ibit=5,
   nbits=2, nskip=3 and iter=4:
    npack:    0101011111100100110100
              ^^^^^                       skip first 5 bits
                   ^^                     iter=1 extract 11 ==> integer 3
                     ^^^                  skip 3 bits
                        ^^                iter=2 extract 10 ==> integer 2
                          ^^^             skip 3 bits
                             ^^           iter=3         01 ==> integer 1
                               ^^^        skip 3 bits
                                  ^^      iter=4         00 ==> integer 0


See Also

   getbitsone

Examples

   Example 1

   Assume x is a one dimensional array of length N.
   xchunk = dim_gbits (x,3,6,9,2)

   3 bits will be skipped at the beginning of x. The next 6 bits will be
   unpacked into xchunk(0) right-justified with zero-fill. 9 bits will be
   skipped in x. The next six bits of x will be unpacked into xchunk(1)
   right-justified with zero-fill. The return array xchunk will be the
   same type as x and be of length 2.

   Example 2

   Assume x is a 5D array with dimensions ntim x klvl x nlat x mlon x N
   and of type byte. Then:
   xchunk = dim_gbits (x,0,2,6,N)

   0 bits will be skipped at the beginning of the rightmost dimension of
   x. The first 2 bits of the rightmost dimension will be unpacked into
   the rightmost dimension of xchunk({...},0) right-justified with
   zero-fill. 6 bits will be skipped in the rightmost dimension of x. The
   next 2 bits of x will be unpacked into xchunk({...},1) right-justified
   with zero-fill. This will continue N times. The return array xchunk
   will be the same type and shape as x.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

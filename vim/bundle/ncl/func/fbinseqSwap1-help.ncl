THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/fbinseqSwap1.shtml
THE_TITLE:fbinseqSwap1
   NCL Home > Documentation > Functions > File IO

fbinseqSwap1

   Byte swaps Fortran sequential files (deprecated).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure fbinseqSwap1 (
                in_file  [1] : string,
                out_file [1] : string,
                type     [1] : string,
                dims     [*] : integer
        )

        return_val  :  file

Arguments

   in_file

   Name of input file.
   out_file

   Name of output file.
   type

   The type of the data on in_file (e.g. "float")
   dims

   A one-dimensional array or equal to the dimensionality of the input
   data.

Description

   Note: this function is deprecated. You can now use the "ReadByteOrder"
   and "WriteByteOrder" options in setfileoption to indicate how the
   various NCL binary read/write functions should read and write files.

   Byte swaps Fortran sequential files. It requires that all records in
   the file be the same type and dimension. The user must provide the
   dimensionality of each record, but not necessarily the number of
   records. If the wrong dimensions are input, the data will be distorted.

See Also

   setfileoption, fbinseqSwap2, fbindirSwap

Examples

   Example 1

   In the following, N is record length [eg N=1000 , (/nlat,mlon/) ]
   load $NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl

   fbinseqSwap1("foo.input", "foo.output", "float",  N)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

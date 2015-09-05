THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cbinread.shtml
THE_TITLE:cbinread
   NCL Home > Documentation > Functions > File IO

cbinread

   Reads binary files created using the C block I/O function write.

Prototype

        function cbinread (
                filename [1] : string,
                dsizes   [*] : integer or long,
                datatype [1] : string
        )

        return_val [as_specified_in_dsizes] :  datatype

Arguments

   filename

   Name of binary file to open. May include an absolute or relative path
   to the file.
   dsizes

   An array specifying the dimension sizes of the data to be read, or the
   value -1 to indicate an unknown size.

   As of version 6.0.0, dsizes can be of type int or long.
   datatype

   A string representing the type of the data being read (for example,
   "float", "integer").

Return value

   The variable returned will have the dimension sizes specified the
   dsizes argument and the type specified by datatype.

Description

   The cbinread function is used to read in binary data created using the
   C block I/O function write.

   Note: As with any binary file, the "endian-ness" of the data on the
   file and that of the current system must agree. The "ReadByteOrder"
   option in the setfileoption procedure can be used to force the "endian"
   type in a file. This allows big-endian files to be read on a
   little-endian machine and vice versa. The isbigendian function can be
   used to determine the endian-ness of your current system.

   If the dsizes array specifies a size less than the total file size,
   only the first n values of the file will be read in, where n is the
   product of the dimension sizes times the size of the specified type. If
   the size implied by the dimension sizes is greater than the file size,
   then the remaining space in the returned value is padded with the
   default missing value for the specified type. In both of these cases,
   warnings are printed. Note there is no way for NCL to determine if the
   type of file and the datatype argument represent the same type. If the
   value of -1 is used for dsizes, then the entire file is read into a
   single dimension variable with a dimension length equal to the number
   of elements in the file.

See Also

   setfileoption, fbindirread, fbinrecread, cbinwrite, isbigendian

Examples

;
; Write a flat binary file called "tmp_file_x" with six elements.
;
    x = (/10.,20.,30.,40.,50.,60./)
    cbinwrite("tmp_file_x",x)
;
; Read the file back in. "y" will be an array of length 6.
;
    y = cbinread("tmp_file_x",-1,"float")
    print(y)
;
; Read the  same file, only this time formatting it as a 2 x 3 array.
;
    z = cbinread("tmp_file_x",(/2,3/),"float")
    print(z)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

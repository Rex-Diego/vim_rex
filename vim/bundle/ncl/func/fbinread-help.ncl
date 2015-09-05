THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fbinread.shtml
THE_TITLE:fbinread
   NCL Home > Documentation > Functions > File IO

fbinread

   Reads one binary record that has been written using an UNFORMATTED
   FORTRAN write.

Prototype

        function fbinread (
                filepath [1] : string,
                rec_dims [*] : integer or long,
                rec_type [1] : string
        )

        return_val [rec_dims] :  rec_type

Arguments

   filepath

   Path needed to locate binary file.
   rec_dims

   An array specifying the dimensions of the data to be read or the value
   -1.

   As of version 6.0.0, rec_dims can be of type int or long.
   rec_type

   A string representing the type of the data being read.

Return value

   Returns a variable whose shape and type are specified via the rec_dims
   and rec_type arguments.

Description

   The fbinread function is a special case of the fbinrecread function.
   The latter can read multiple records from a file while fbinread reads
   only the first record.

   The file must have been been created by a fortran "open" statement of
   the form
    open (..., form="unformatted" [,access="sequential"],...)

   Note: As with any binary file, the "endian-ness" of the data on the
   file and that of the current system must agree. The "ReadByteOrder"
   option in the setfileoption procedure can be used to force the "endian"
   type in a file. This allows big-endian files to be read on a
   little-endian machine and vice versa. The isbigendian function can be
   used to determine the endian-ness of your current system.

   By default, the record marker size at the beginning and end of Fortran
   sequential files is assumed to be 4 bytes. In V6.1.1 and later, you can
   change this to 8 bytes using the "RecordMarkerSize" option in the
   setfileoption procedure.

   If the specified rec_dims dimensions do not define a size equal to the
   total file data size, an error message is generated. Note that there is
   no way for NCL to determine if the type of file and the rec_type
   parameter represent the same type. If the value of -1 is used for
   rec_dims then all of the values of the Fortran record are read and the
   output is a single dimension variable with a dimension size equal to
   the number of elements of the record.

See Also

   setfileoption, fbinnumrec, fbinrecread, fbindirread, fbinrecwrite,
   fbinwrite, isbigendian

Examples

   Example 1

   The below is a Fortran (f77) code fragment:
     real  x(100), y(399), z(128,64)
     open  (11,file="example01",form="unformatted")
     write (11) x, y, z       ! 1st record   [rec_num=0]

   Below is the NCL code to read the above. Note that the shape appears to
   be different for the z variable. In Fortran, the leftmost dimension
   varies fastest while in NCL [C], the rightmost dimension varies
   fastest. Thus, the data record will match the fastest varying
   dimensions correctly.
     fili = "example01"       ; input file
     recl = 100 + 399 + 128*64
     xyz  = fbinread (fili, recl , "float")

     x    = xyz(0:99)
     y    = xyz(100:498)
     z    = onedtond( xyz(499:) , (/64,128/) )


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

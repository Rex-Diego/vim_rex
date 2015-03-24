THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fbinrecread.shtml
THE_TITLE:fbinrecread
   NCL Home > Documentation > Functions > File IO

fbinrecread

   Reads unformatted sequential access Fortran binary files.

Prototype

        function fbinrecread (
                path     [1] : string,
                rec_num  [1] : integer,
                rec_dims [*] : integer or long,
                rec_type [1] : string
        )

        return_val [rec_dims] :  rec_type

Arguments

   path

   Full or relative pathname to binary file.
   rec_num

   Record number to read from the file beginning at 0. Please see caveat
   below.
   rec_dims

   A singly dimensioned array of integer values that describe how to shape
   the data, or -1 if the size of the record is unknown.

   As of version 6.0.0, rec_dims can be of type int or long.
   rec_type

   String name of the data type of the record.

Return value

   As specified by the rec_dims, rec_type arguments.

Description

   fbinrecread reads the rec_num record of the file path and shapes it
   according to the dimension sizes in parameter rec_dims. The data type
   of the record is specified by the parameter rec_type. If the size and
   dimensionality of the record are unknown the value -1 can be used for
   parameter rec_dims. In this case fbinrecread will read in the entire
   record as a singly dimensioned array.

   Note: As with any binary file, the "endian-ness" of the data on the
   file and that of the current system must agree. The "ReadByteOrder"
   option in the setfileoption procedure can be used to force the "endian"
   type in a file. This allows big-endian files to be read on a
   little-endian machine and vice versa. The isbigendian function can be
   used to determine the endian-ness of your current system.

   This function was updated in version 4.3.0 in order to allow reads into
   files bigger than 2 GB. This change allows you to access records that
   occur past the 2 GB point in the file, but not to read into variables
   that would be larger than 2 GB.

     Caveat: we've run across binary files that were written with 8-byte
     record markers. This function may expect them to be 4-bytes; it just
     depends on what system NCL was compiled on.

     This happens if the Fortran program that created the binary file was
     compiled with a version of "g77" or "gfortran" that sets the marker
     size to whatever "off_t" is on that system.

     In V6.1.1 and later, you can change this to 8 bytes using the
     "RecordMarkerSize" option in the setfileoption procedure.

     As a work-around for older versions of NCL, you can recompile the
     code that created the binary file with the option
     "-frecord-marker=4" to force a 4-byte record, and run the code again
     to regenerate the file.

     It is on our list to create a new option in setfileoption that will
     allow you to specify the record marker size that the file was
     written with.

See Also

   setfileoption, fbinnumrec, fbindirread, fbinread, fbinrecwrite,
   fbinwrite, isbigendian

Examples

   Example 1

   The below is a Fortran (f77) code fragment:
     integer a(5)
     real    x(100), y(399), z(128,64)

     open (11,file="example01",form="unformatted")

     write (11) a             ! 1st record   [rec_num=0]
     write (11) x             ! 2nd record   [rec_num=1]
     write (11) y             ! 3rd record   [rec_num=2]
     write (11) z             ! 4th record   [rec_num=3]

   Below is the NCL code to read the above. Note that the shape appears to
   be different for the z variable. In Fortran, the leftmost dimension
   varies fastest while in NCL [C], the rightmost dimension varies
   fastest. Thus, the data record will match the fastest varying
   dimensions correctly.
     fili = "example01"       ; input file
     a = fbinrecread (fili, 0,   5, "integer")        ; 1st record is zero
     x = fbinrecread (fili, 1, 100, "float")          ; 2nd           one
     y = fbinrecread (fili, 2, 399, "float")          ; 3rd record is two
     z = fbinrecread (fili, 3, (/ 64,128 /), "float") ; 4th record is three

; sample of reading *all* the float variable in one record.
; data will be a 1D array of length (100+399+128*64)

  data = fbinrecread (fili, 1, -1, "float")           ; read x, y, z as 1D


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

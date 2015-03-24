THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fbindirread.shtml
THE_TITLE:fbindirread
   NCL Home > Documentation > Functions > File IO

fbindirread

   Reads binary records written by a Fortran direct access write or C
   write.

Prototype

        function fbindirread (
                path     [1] : string,
                rec_num  [1] : integer,
                rec_dims [*] : integer or long,
                rec_type [1] : string
        )

        return_val [rec_dims] :  rec_type

Arguments

   path

   Pathname to binary file
   rec_num

   Record number to read from the file beginning at 0. Please see caveat
   below.
   rec_dims

   A singly dimensioned array of values that describe how to shape the
   data, or -1 if the size of the record is unknown.

   As of version 6.0.0, rec_dims can be of type int or long.
   rec_type

   String name of the data type of the record.

Return value

   As described by the rec_dims and rec_type arguments.

Description

   fbindirread reads the rec_num record of the file path and shapes it
   according to the dimension sizes specified in the rec_dims parameter.
   The data type of the record is specified by the parameter rec_type. If
   the size and dimensionality of the record are unknown, the value -1 can
   be used for parameter rec_dims. In this case fbindirread will read in
   the entire file as a singly dimensioned array.

   If written by fortran, the file must have been been written to a file
   created by a fortran "open" statement of the form
    open (..., access="direct", form="unformatted", recl=..., ...)


   All records in the file must have the same dimensions and must be the
   same type.

   Note: As with any binary file, the "endian-ness" of the data on the
   file and that of the current system must agree. The "ReadByteOrder"
   option in the setfileoption procedure can be used to force the "endian"
   type in a file. This allows big-endian files to be read on a
   little-endian machine and vice versa. The isbigendian function can be
   used to determine the endian-ness of your current system.

   This function was updated in version 4.3.0 to allow reads into files
   bigger than 2 GB. This change allows you to access records that occur
   past the 2 GB point in the file.

   This function was updated in version 6.0.0 to allow you to read
   variables larger than 2 GB if on a 64-bit system.

See Also

   setfileoption, fbinnumrec, fbinrecread, fbinread, fbinrecwrite,
   fbinwrite isbigendian

Examples

  path = "/dummy/file.binary"
  nrec = 5
  dims = (/10,30/)
  x = fbindirread(path, nrec, dims, "float")

   This will read the 6th record from "/dummy/file.binary" and return a
   two-dimensional [10 by 30] variable of type float to the variable "x".


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

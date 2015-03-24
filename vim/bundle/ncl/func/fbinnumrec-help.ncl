THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fbinnumrec.shtml
THE_TITLE:fbinnumrec
   NCL Home > Documentation > Functions > File IO

fbinnumrec

   Returns the number of unformatted sequential Fortran records in a
   binary file.

Prototype

        function fbinnumrec (
                path [1] : string
        )

        return_val [1] :  integer

Arguments

   path

   Pathname of file

Description

   This function returns the number of records in a Fortran unformatted
   sequential binary file.

   It was updated in version 4.3.0 in order to allow reads into files
   bigger than 2 GB. This change allows you to access records that occur
   past the 2 GB point in the file, but not to read into variables that
   would be larger than 2 GB.

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

See Also

   fbinnumrec, setfileoption isbigendian,fbindirread

Examples

   Example 1

   Determine the number of records on a file created opening the file via
   the fortran statement: open(10, "foo.binary", form="unformatted")

   nrec = fbinnumrec("foo.binary")   ; nrec is scalar integer


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

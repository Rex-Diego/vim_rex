THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fbindirwrite.shtml
THE_TITLE:fbindirwrite
   NCL Home > Documentation > Functions > File IO

fbindirwrite

   Writes binary records to a file in manner analogous to fortran's
   "access=direct".

Prototype

        procedure fbindirwrite (
                path [1] : string,
                var
        )

Arguments

   path

   Pathname to binary file
   var

   A variable of any dimensionality and type.

Description

   fbindirwrite writes records to a file in a manner similar to that
   written by Fortran code that opens a file with 'form=unformatted,
   access=direct, recl= ...'. If the file already exists, the values to be
   written are appended to the file.

   By default, the elements of var are written to the file using the
   machine's native binary format. To force the byte order to be written
   as big-endian or little-endian, see the "WriteByteOrder" option in the
   setfileoption procedure.

   This function was updated in version 4.3.0 in order to allow writes of
   files bigger than 2 GB.

See Also

   fbinnumrec, fbinrecread, fbindirread, fbinread, fbinrecwrite,
   fbinwrite, isbigendian, setfileoption

Examples

   The following will write ntimes records, each of length 64x128 float
   words.

     ntimes = 100
     z    = new ( (/ntimes,64,128/), float)
          .
     path = "/dummy/file"
     do nt=0,ntimes-1
        fbindirwrite(path,z(nt,:,:) )
     end do

   The binary file will be the same as a one open via fortran's open
   statement:
     open(..., form="unformatted", access="direct", recl= )   ; recl is system d
ependent


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/craybinrecread.shtml
THE_TITLE:craybinrecread
   NCL Home > Documentation > Functions > File IO

craybinrecread

   Reads COS blocked unformatted sequential access Fortran binary files.

Prototype

        function craybinrecread (
                path     [1] : string,
                rec_num  [1] : integer,
                rec_dims [*] : integer or long,
                rec_type [1] : string
        )

        return_val [rec_dims] :  rec_type

Arguments

   path

   Full or relative pathname to Cray COS blocked binary file.
   rec_num

   Record number to read from the file beginning at 0.
   rec_dims

   A singly dimensioned array of values that describe how to shape the
   data, or -1 if the size of the record is unknown.

   As of version 6.0.0, rec_dims can be of type int or long.
   rec_type

   String name of the data type of the record.

Return value

   As specified by the rec_dims, rec_type arguments.

Description

   craybinrecread reads the rec_num record of the file path and shapes it
   according to the dimension sizes in parameter dims. The data type of
   the record is specified by the parameter type. If the size and
   dimensionality of the record are unknown the value -1 can be used for
   parameter rec_dims. In this case craybinrecread will read in the entire
   record as a singly dimensioned array. The file must be COS blocked.

See Also

   craybinnumrec, fbinnumrec, fbinrecread fbinrecwrite

Examples

   Example 1

   The below is a Fortran (f77) code fragment that was run on a Cray:
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
     a = craybinrecread (fili, 0,   5, "integer")        ; 1st record is zero
     x = craybinrecread (fili, 1, 100, "float")          ; 2nd           one
     y = craybinrecread (fili, 2, 399, "float")          ; 3rd record is two
     z = craybinrecread (fili, 3, (/ 64,128 /), "float") ; 4th record is three

; sample of reading *all* the float variable in one record.
; data will be a 1D array of length (100+399+128*64)

  data = craybinrecread (fili, 1, -1, "float")           ; read x, y, z as 1D


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

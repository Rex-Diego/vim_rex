THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cbinwrite.shtml
THE_TITLE:cbinwrite
   NCL Home > Documentation > Functions > File IO

cbinwrite

   Creates a binary file in raw C block I/O format for a numeric data
   type.

Prototype

        procedure cbinwrite (
                filename [1] : string,
                var          : numeric
        )

Arguments

   filename

   Name of C binary file to open. May include an absolute or relative path
   to the file.
   var

   A numeric variable of any dimensionality.

Description

   The cbinwrite function is used to create a binary data file from a
   variable of type numeric. By default, the elements of value are written
   to the file in row x column order using the machine's native binary
   format. To force the byte order to be written as big-endian or
   little-endian, see the "WriteByteOrder" option in the setfileoption
   procedure.

See Also

   fbindirwrite , fbinrecwrite, setfileoption

Examples

   Example 1

;
; Write a C binary file called "tmp_file_x" with six elements.
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

   Example 2

   From ncl-talk: I am using 'cbinwrite' to output some binary data to a
   file. Since I am writing data in a loop, I found that cbinwrite will
   overwrite the pervious data every time. Does anybody know how to write
   the data in the file without overwriting?
    cbinwrite("file.bin",data)
    do i = 1, number_of_writes -1
       newdata = ....
       cbinwrite("tmp.bin",newdata)
       system("cat tmp.bin >> file.bin")
    end do


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

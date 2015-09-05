THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/readAsciiHead.shtml
THE_TITLE:readAsciiHead
   NCL Home > Documentation > Functions > File IO

readAsciiHead

   Reads an ASCII file and returns just the header.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function readAsciiHead (
                filename  : string,
                opt
        )

        return_val [*] :  string

Arguments

   filename

   The filename to read.
   opt

   If opt is an integer or long, then it is the number of rows (lines) for
   the header. This is a "fixed" number of lines.

   If opt is a string, then it is a sequence of characters that terminate
   a variable number of header rows. Currently this just checks character
   sequences starting in column 0.

   If opt is a float and positive, then it will read all values as float.

Return value

   A one-dimensional array of strings. Each row in the header will be one
   string.

Description

   This function reads an ASCII file and returns just the header as an
   array of strings. The header is the non-numeric part. Note upon return,
   the return values may have to be parsed individually for specific info.

See Also

   readAsciiTable, asciiread, asciiwrite, write_matrix

Examples

   Example 1

   Assume you have the file:
   DARWIN SEA LEVEL PRESS (1000 MB SUBTRACTED)
   YEAR   JAN   FEB   MAR   APR   MAY   JUN   JUL   AUG   SEP   OCT   NOV   DEC
   1951   5.3   5.1   7.0   9.4  11.9  11.2  13.3  13.2  12.5  11.4   9.5   8.9
   1952   6.7   7.1   8.3  10.3  10.3  12.5  13.0  12.6  12.1   9.9   7.7   8.4
   [snip]

   Then the following script:
   head = readAsciiHead("darwin", 2)     ; there are two header lines
   print(head)

   head = readAsciiHead("darwin", "YEAR"); the line that begins with year
                                         ; is the last header line
   print(head)

   will produce:
Variable: head
Type: string
Total Size: 8 bytes
            2 values
Number of Dimensions: 1
Dimensions and sizes:   [2]
Coordinates:
(0)     DARWIN SEA LEVEL PRESS (1000 MB SUBTRACTED)
(1)     YEAR   JAN   FEB   MAR   APR   MAY   JUN   JUL   AUG   SEP   OCT   NOV
 DEC


Variable: head
Type: string
Total Size: 8 bytes
            2 values
Number of Dimensions: 1
Dimensions and sizes:   [2]
Coordinates:
(0)     DARWIN SEA LEVEL PRESS (1000 MB SUBTRACTED)
(1)     YEAR   JAN   FEB   MAR   APR   MAY   JUN   JUL   AUG   SEP   OCT   NOV
 DEC


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

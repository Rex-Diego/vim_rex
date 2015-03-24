THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/readAsciiTable.shtml
THE_TITLE:readAsciiTable
   NCL Home > Documentation > Functions > File IO

readAsciiTable

   Reads an ASCII file given the number of lines at the beginning and end
   of the file to ignore.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function readAsciiTable (
                filename   : string,
                ncol       : integer or long,
                data_type  : string,
                opt
        )

        return_val [*] :  data_type

Arguments

   filename

   The filename to read.
   ncol

   A scalar representing the number of columns in the file.

   As of version 6.0.0, this can be of type integer or long.
   data_type

   A string representing the type of data in the table (i.e "float").
   opt

   If type integer or long, opt can have one or two elements. The first
   element specifices the number of lines (rows) to ignore at the
   beginning of the file, and the second element, if it exists, specifies
   the number of lines to ignore at the end of the file.

   If opt is a string, then it is a sequence of characters that terminate
   a variable number of header rows. Currently this just checks character
   sequences starting in column 0.

Return value

   A one or two-dimensional array dimensioned nrows by ncol. It will be of
   type data_type.

Description

   This function reads an ASCII file and returns the table data after the
   header portion, and before the footer portion (if specified).

   Note that this function can be extremely slow if you have thousands of
   lines of data. This is because this function has to read the file in as
   an array of strings, first to get the header information and then again
   to get the values. Reading thousands of lines of strings can be very
   slow. In this case, it may be better to use asciiread and reshape the
   data into a 2D array yourself. See the "Reading ASCII data" examples
   page for information on how to read a large ASCII file that has header
   and/or footer data.

See Also

   readAsciiHead, asciiread, asciiwrite, write_matrix

Examples

   Example 1

DARWIN SEA LEVEL PRESS (1000 MB SUBTRACTED)
YEAR   JAN   FEB   MAR   APR   MAY   JUN   JUL   AUG   SEP   OCT   NOV   DEC
1951   5.3   5.1   7.0   9.4  11.9  11.2  13.3  13.2  12.5  11.4   9.5   8.9
1952   6.7   7.1   8.3  10.3  10.3  12.5  13.0  12.6  12.1   9.9   7.7   8.4
[snip]

   ncol = 13
   data = readAsciiTable("darwin", ncol, "float", 2)
   data = readAsciiTable("darwin", ncol, "float", "YEAR")

   Example 2

 DEN %ALL=  24.50 #SND=10004
             JAN    FEB    MAR    APR    MAY    JUN    JUL    AUG    SEP    OCT
   NOV    DEC
 1977      11.29   8.93   9.68  37.29  25.81  26.67  35.48  39.34  22.03  17.74
  5.00  11.48
 1978      24.19  34.55  22.58  20.00  29.51  18.97  16.67  27.12  11.67  15.00
 29.82  12.90
...
 1990       8.06  25.45  37.10  39.66  37.93  16.95  42.62  33.90  25.00  14.52
 12.07  16.28
 ALLYEARS  14.69  20.20  26.66  28.54  34.37  25.94  30.38  33.77  24.19  20.05
 18.46  16.73
  #SONDES    858    782    859    820    838    825    846    832    831    853
   829    831


   ncol = 13
   data = readAsciiTable("dn.txt", ncol, "float", (/2,2/))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

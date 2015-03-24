THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/write_matrix.shtml
THE_TITLE:write_matrix
   NCL Home > Documentation > Functions > Printing, File IO

write_matrix

   Writes nicely-formatted integer, float, or double precision
   two-dimensional (2D) arrays to standard out or to a file.

Prototype

        procedure write_matrix (
                data [*][*] : numeric,  ; integer, float, or double
                fmtf        : string,
                option      : logical
        )

Arguments

   data

   The 2D array to be printed.
   fmtf

   Format to be used, specified via Fortran style. The format string used
   must agree with the variable type.

   option

   If False, the data are written to standard out according to the user
   specified format.

   If True, then this variable may have associated with it one or more of
   the following attributes:

   fout
          String specifying the output file name. If not present, the data
          is sent to standard out. The maximum length of fout is 96
          characters.

   title
          String specifying a title to be printed. If not present, no
          title is printed. (Default is title=" ".)

   tspace
          Integer specifying the number of spaces from left to skip prior
          to printing title. Only applicable if the title attribute is
          present. If the title attribute is present and tspace is not,
          then the title will be at the left edge. (Default is tspace =
          0.)

   row
          If row=True, then row numbers are printed. The maximum number of
          lines is 99999. If row is not present or row=False, then no row
          numbers are printed.

Description

   The write_matrix procedure provides the ability to "pretty-print" a 2D
   array to a user-specified destination: either standard out (the screen)
   or to a file. This procedure does not have the ability to print
   individual row and column text labels.

   All standard Fortran edit descriptors are accepted. See any standard
   Fortran text for more complete descriptions.

   In the following, w refers to the total width for each value. The edit
   descriptor width, w, must include room for any minus sign. All numbers
   are right-justified.

    1. Integers may use 'Iw/iw' or 'Iw.m/iw.m'.
    2. Commonly used float and double edit descriptors include:

     'Fw.d/fw.d'
     'Ew.d/ew.d'
     'Dw.d'
     'Gw.d/gw.d'
       where d represents the number of digits allocated to the fractional
       part of value.

   Sample edit descriptors (the b indicates a blank space):

             Value     format       output
               35       I2          35
               35       I5          bbb35
               45       i5.3        bb045
             -123       I5.1        b-123
             -123       i5.4        -0123
                1       I5.5        00001

             12.345     f8.3       bb12.345
             12.345     F8.1       bbbb12.3
            -12.345     f8.3       b-12.345
             12.355     F8.1       bbbb12.4    (note rounding of rightmost digit
)
            -12.355     F8.1       bbb-12.4    (note rounding of rightmost digit
)

             12.345     E11.5     0.12345E+02
             12.345     e11.4     b0.1235E+02
            -12.345     E11.5     -.12345E+02
            -12.345     e11.3     b-0.123E+02

   All edit descriptors may be preceded by an integer that specifies the
   number of times the descriptor is to be repeated at any row. For
   example, "9f12.5" means repeat the "f12.5" descriptor nine times. Edit
   descriptors may also be combined so that different combinations can be
   sent to the output destination.

   If the array to be output has a missing value [_FillValue] that can not
   be accommodated within the width of the edit descriptor specified by
   the user, then it is the user's responsibility to make a change prior
   to invoking this procedure. This can be accomplished by changing the
   _FillValue prior to the use of write_matrix.

   Use write_table if you want to write multiple formatted variables to a
   file.

See Also

   asciiwrite, asciiread, write_table, print_table

Examples

   In examples 1-3, the x array is generated with:
  N    = 5    ; number of rows
  M    = 7    ; number of columns
  ave  = 0.0
  std  = 5.0
  x    = random_normal (ave, std, (/N,M/))

   Example 1

   Examples 1a-b produce the following output to standard out:

   4.35   4.36   9.73   4.91   1.77  -0.63  -4.29
   4.39   4.66  -5.84   4.59   3.68 -14.12   0.07
   0.27   3.77   0.89  -3.09   5.08  -2.51   5.85
  -3.35  -1.66   8.46   7.55   0.14   1.76   0.87
  -6.90   4.06  10.39   4.56  -5.63  -1.43   8.65

   Example 1a

  write_matrix (x, "7f7.2", False)

   Example 1b

   Dynamically specify the format string (fmtf): to account for the size
   M:

  fmtf   = M + "f7.2"                           ; same as "7f7.2"
; or
  fWidth = 7     ; specify the format width
  fDec   = 2     ; specify the number to the right of decimal point
  fmtf   = M + "f" + fWidth + "." + fDec        ; same as "7f7.2"

  write_matrix (x, fmtf, False)

   Example 2

   Examples 2a-b produce the following output:

                      Normal

   4.35   4.36   9.73   4.91   1.77  -0.63  -4.29
   4.39   4.66  -5.84   4.59   3.68 -14.12   0.07
   0.27   3.77   0.89  -3.09   5.08  -2.51   5.85
  -3.35  -1.66   8.46   7.55   0.14   1.76   0.87
  -6.90   4.06  10.39   4.56  -5.63  -1.43   8.65

   Example 2a

   Write a user-specified title to standard out and specify the number of
   spaces to be skipped before title is printed:

   opt = True
   opt@title  = "Normal"
   opt@tspace = 22
   write_matrix (x, "7f7.2" , opt)

   Example 2b

   Dynamically calculate the value for tspace. This requires that the
   length of the title string be known:

   opt = True
   opt@title  = "Normal"
   opt@tspace = (M*fWidth - dimsizes(stringtochar(opt@title)))/2 + 1
   write_matrix (x, "7f7.2" , opt)

   Example 3

   Print out the row numbers for examples 2a-b. Here, 5 was added to
   tspace to account for the additional column space used to print the
   row. The following will be sent to standard out:

   opt@row    = True
   opt@tspace = ((M*fWidth - dimsizes(stringtochar(opt@title))))/2 + 6
   write_matrix (x, "7f7.2" , opt)

                           Normal

    0    4.35   4.36   9.73   4.91   1.77  -0.63  -4.29
    1    4.39   4.66  -5.84   4.59   3.68 -14.12   0.07
    2    0.27   3.77   0.89  -3.09   5.08  -2.51   5.85
    3   -3.35  -1.66   8.46   7.55   0.14   1.76   0.87
    4   -6.90   4.06  10.39   4.56  -5.63  -1.43   8.65

   Example 4

   Combine several edit descriptors; this shows a repeat edit descriptor
   ("2e14.5") and an example of specifying a specific number of spaces to
   be skipped ("4x"):

    fmtx = "f8.2,1x,f10.5,3x,2e14.5, 4x, e11.4,2f7.2"
    write_matrix (x, fmtx, False)

   This yields:

    4.35    4.36462      0.97340E+01   0.49126E+01     0.1770E+01  -0.63  -4.29
    4.39    4.65982     -0.58381E+01   0.45896E+01     0.3677E+01 -14.12   0.07
    0.27    3.77360      0.88711E+00  -0.30932E+01     0.5078E+01  -2.51   5.85
   -3.35   -1.66182      0.84589E+01   0.75549E+01     0.1364E+00   1.76   0.87
   -6.90    4.06438      0.10386E+02   0.45631E+01    -0.5635E+01  -1.43   8.65

   Example 5

   Let g be a 100 x 50 (N x M) array, and assume it is desired to send the
   output to a file called "GPRINT" with no title or row numbering:

  N    = 100    ; number of rows
  M    = 50     ; number of columns
  ave  = 0.0
  std  = 5.0
  x    = random_normal (ave, std, (/N,M/))

  fWidth = 10    ; specify the format width
  fDec   = 3     ; specify the number to the right of decimal point
  fmtx   = M + "f" + fWidth + "." + fDec              ; fmtx="50f10.3"

  opt = True
  opt@fout = "GPRINT"
  write_matrix (x, fmtx, opt)

   Example 6

   Let's say a user calculated seven (K) 1D arrays of length 100 (I):
   a(I), b(I), c(I), d(I), e(I), f(I), g(I). Further, let's assume that
   the values in each array vary widely, so different edit descriptors are
   required for each variable. To use write_matrix, several steps are
   required:

    1. place the seven 1D arrays into a 2D array using NCL's new and
       typeof functions,
    2. create the format to be used
    3. specify a file

  I = 100      ; number of elements per variable
  K = 7        ; number of variables (1D arrays)

  p = new ( (/I,K/), typeof(a) )
  p(:,0) = a
  p(:,1) = b
  p(:,2) = c
  p(:,3) = d
  p(:,4) = e
  p(:,5) = f
  p(:,6) = g

  fmtx       = "f8.2,1x,2e14.5,3x,2f7.1,2x,e11.4,f9.3"
  opt        = True
  opt@title  = "a,b,c,d,e,f,g"
  opt@tspace = 40
  write_matrix (p, fmtx, opt)

   To send to a file, simply add the fout attribute:

  opt@fout = "/some/place/special/ABCDEFG"
  write_matrix (p, fmtx, opt)

   Example 7

   Let z be a 4D array of size ntim x nlev x nlat x mlon. Reshape z to be
   a 2D array via NCL's ndtooned and onedtond functions:

  z2D = onedtond( ndtooned(z), (/ntim*nlev*nlat,mlon/) )

  opt  = True
  opt@fout = "Z2D"
  write_matrix (z2D, fmtx, opt)

   Example 8

   Let the N x M array x have a _FillValue (missing value) of 1.e+20.
   Assume all valid numbers can be accommodated by the format string
   "f10.2". To avoid bogus characters being sent to fout, the user must
   change the _FillValue attribute (at least temporarily):

  xmsg   = x@_FillValue              ; save _FillValue
  x@_FillValue = -9999.0             ; change to some value

  fmtx   = M + "f10.2"
  write_matrix (x, fmtx, False)

  x@_FillValue = xmsg                ; if desired, reset original _FillValue

   Example 9

   Let z be a 2D gaussian grid of size 64 x 128, and with coordinate
   variables named lat and lon [z(lat,lon)]. To output a subset, either
   standard or coordinate subscripting can be used. To output data from
   say, 10S-to-10N and every other longitude from 90-to-270, either of the
   following approaches may be used:

 write_matrix (z(28:35,32:96:2), fmt, opt)         ; standard subscripting

   or
 write_matrix (z({-10:10},{0:360:10}), fmt, opt)   ; coordinate sub


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

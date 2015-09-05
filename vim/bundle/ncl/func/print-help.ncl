THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/print.shtml
THE_TITLE:print
   NCL Home > Documentation > Functions > Printing

print

   Prints the value of a variable or expression.

Prototype

        procedure print (
                data
        )

Arguments

   data

   A variable of any type or dimensionality, an expression, or a literal
   value.

Description

   The print procedure displays either the variable information and value
   of the data parameter--when it is a variable--or simply displays the
   values when the parameter is an expression result or literal value. For
   variables of type byte, print will print these values in octal.

   By default, this procedure precedes every value with an index value.
   Scalars are preceded with "(0)". To turn this feature off, use the "-n"
   option on the NCL command line.

   If run at the command line, print invokes a pager for scrolling through
   the list. The pager is either "more" or whatever the user's PAGER
   environment variable is set to.

   If you are getting an error about the PAGER environment variable, first
   check that it is set to something valid:
  printenv PAGER

   You can tell NCL not to use this PAGER environment variable by setting
   the NCL_NO_SYSTEM_PAGER environment variable:

   From csh/tcsh:
  setenv NCL_NO_SYSTEM_PAGER

   From bash/ksh/sh:
  export NCL_NO_SYSTEM_PAGER=

   Users may use NCL's array syntax or coordinate subscripting to print
   specific information about a variable. Further, the argument to print
   can be combined with a string to print out labeled information. See
   examples below.

   print does not allow any format control. For limited format control,
   use the sprintf function for floating point numbers, and sprinti for
   integers. To "pretty print" 2D arrays, use the write_matrix procedure.

   If these options do not meet user needs, one option is to use a Fortran
   subroutine via a shared object to accomplish this. (See example 5 in
   this description of shared objects for an example of creating procedure
   to do special printing.)

See Also

   printVarSummary, printFileVarSummary, sprinti, sprintf, write_matrix

Examples

   Example 1

   Print out the variable's information and all of the values:
  f = addfile ("T2m.nc", "r")
  T = f->T
  print (T)

   The above yields:
   Variable: T
   Type: float
   Total Size: 72192 bytes
               18048 values
   Number of Dimensions: 3
   Dimensions and sizes:   [time | 1] x [lat | 94] x [lon | 192]
   Coordinates:
               time: [197901..197901]
               lat: [-88.54195..88.54195]
               lon: [ 0..358.125]
   Number Of Attributes: 4
     units :       K
     short_name :  T2m
     long_name :   Temperature (2m)
     _FillValue :  1e+36
   (0,0,0) 255.49
   (0,0,1) 255.44
   (0,0,2) 255.39
   (0,0,3) 255.34
   (0,0,4) 255.3
                   [SNIP all the other values]

   (0,93,186)      234.23
   (0,93,187)      234.16
   (0,93,188)      234.09
   (0,93,189)      234.02
   (0,93,190)      233.95
   (0,93,191)      233.88

   Example 2

   print may be used with standard subscripting or coordinate subscripting
   to print out subsets of the data:
  print (T(0,:,61))        ; print all the latitude information
                           ; at time=0 and lon=61

  print (T(0,{-90:90},61)) ; does the same thing
                           ; note: standard and coordinate
                           ; scripting may be combined

   The two print statements each yield the same output:
     Variable: T (subsection)
     Type: float
     Total Size: 376 bytes
                 94 values
     Number of Dimensions: 1
     Dimensions and sizes:   [lat | 94]
     Coordinates:
                 lat: [-88.54195..88.54195]
     Number Of Attributes: 6
       lon : 114.375
       time :        197901
       _FillValue :  1e+36
       long_name :   Temperature (2m)
       short_name :  T2m
       units :       K
     (0)     252.66
     (1)     254.55
     (2)     255.79
     (3)     254.4
     (4)     252.86
                     [SNIP]
     (89)    236.82
     (90)    236.79
     (91)    238.06
     (92)    237.68
     (93)    236.36

   Note: NCL adds additional information when a variable subsection is
   printed. In this case, the "lon" and "time" attributes were added which
   identify the time and longitude associated with the values being
   printed.

   Example 3

   Use the max and min functions and a string to print and label the
   maximum and minimum values:
   print ("Minimum="+min(T) +"    Maximum="+max(T))

   The above yields:
     (0)     Minimum=224.89    Maximum=308.2

   Although the variable T in this example has only one time step, one
   could loop through time and print the max and min at each time step:
  print ("============ Min /Max Section=========")
  time = f->time
  ntim = dimsizes(time)
  do nt=0,ntim-1
    print ("time="+time(nt)+"   Minimum="+min(T(nt,:,:)) +"    Maximum="+max(T(n
t,:,:)))
  end do

   The above yields:
    (0)     ============ Min /Max Section============
    (0)     time=197901   Minimum=224.89    Maximum=308.2

   Example 4

   To turn off the preceding index values in the output, use the "-n"
   option when you run NCL. For example, if you have the line:
print(ispan(0,10,1))

   the output would normally look like:
 Copyright (C) 1995-2008 - All Rights Reserved
 University Corporation for Atmospheric Research
 NCAR Command Language Version 5.1.0
 The use of this software is governed by a License Agreement.
 See http://www.ncl.ucar.edu/ for more details.
(0)     0
(1)     1
(2)     2
(3)     3
(4)     4
(5)     5
(6)     6
(7)     7
(8)     8
(9)     9
(10)    10

   If you type:
ncl -n myscript.ncl

   then you get:
 Copyright (C) 1995-2008 - All Rights Reserved
 University Corporation for Atmospheric Research
 NCAR Command Language Version 5.1.0
 The use of this software is governed by a License Agreement.
 See http://www.ncl.ucar.edu/ for more details.
0
1
2
3
4
5
6
7
8
9
10


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

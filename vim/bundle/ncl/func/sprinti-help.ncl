THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sprinti.shtml
THE_TITLE:sprinti
   NCL Home > Documentation > Functions > String manipulation

sprinti

   Converts integers into formatted strings.

Prototype

        function sprinti (
                format [1] : string,
                array      : integer
        )

        return_val [dimsizes(array)] :  string

Arguments

   format

   A "C" style format string, See "man sprintf" for more information.
   array

   An array of any dimensionality of integers.

Description

   This function uses the format string to call the system "sprintf"
   function. This is different from the C version in two ways: 1) only one
   "%" operator is allowed for the string, and 2) only integers are
   allowed. You must understand how to create a "C" format string to use
   this function.

See Also

   sprintf, write_matrix

Examples

   Example 1

   This examples creates some strings with leading zeros:
  i = 1
  print( sprinti("%0.4i", i) )   ; ===>    0001  a string of length 4

  i = 21
  print( sprinti("%0.3i", i) )   ; ===>     021  a string of length 3

                                                 a "+" means print sign
  print( sprinti("%+0.4i", i) )  ; ===>   +0021  a string of length 5

  i = -21                                        a minus sign extra
  print( sprinti("%0.4i", i) )   ; ===>   -0021  a string of length 5

  i = 321
  print( sprinti("%0.4i", i) )   ; ===>    0321  a string of length 4

  i =  9
  print( sprinti("%4.2i", i) )   ; ===>      09  a string of length 4
                                                 the first two characters
                                                 are blanks
  i = -9
  print( sprinti("%4.2i", i) )   ; ===>     -09  a string of length 4
                                                 first character is blank

  ii = (/ -47, 3579, 24680 /)
  print ( sprinti("%+7.5i", ii) ); ===>     -00047, +03579, +24680
                                                 all are of length 7

   Example 2

   A user could also put the format into a string variable. For example,
   if i=9, j=-5, and k=999:
  fmti = "%0.4i"
  fmtj = "%0.3i"
  fmtk = "%6.3i"
  title = "Sample title,  i=" + sprinti(fmti, i) +" j="+ sprinti(fmtj, j) \
                       +" k=" + sprinti(fmtk, k)

   The above yields:
  Sample title,  i=0009 j=-005 k=   999

   Example 3

   Frequently, a series of files must be processed. Assuming these files
   are "h00001.nc", "h00002.nc", ..., "h01234.nc", then:
do n=1,1234
   fnam = "h"+ sprinti("%0.5i", n) +".nc" ; Generate one string per iteration
   :
end do

   will generate the required sequence of names. Also, the following may
   be used to generate all the names at once:
   fnam = "h"+ sprinti("%0.5i", ispan(1,1234,1)) +".nc"

   fnam will have 1234 strings. Either approach is far more elegant than
   the following:

 do n=1,1234
   if (n.lt.10) then
       fnam = "h0000"+n+".nc"
   else
       if (n.lt.100) then
           fnam = "h000"+n+".nc"
       else
           if (n.lt.1000) then
               fnam = "h00"+n+".nc"
           else
               fnam = "h0"+n+".nc"
           end if
       end if
    end if
    .
    .
    .
 end do

   Example 4

   sprinti and sprintf can be used to provide limited formatting for
   printing ASCII text. The following code:
  print("      K     mylats      mylons     exacts    mytemps       fo")
  do n=0,N-1
    print (sprinti("%6.0i", knt(n))    +" " \
          +sprintf("%9.5f", mylats(n)) +"  " \
          +sprintf("%9.2f", mylons(n)) +"  " \
          +sprintf("%9.3f", exacts(n)) +"  " \
          +sprintf("%9.4f", mytemps(n))+"  " \
          +sprintf("%9.4f", fo(n))    )
  end do

   will produce the following output:
(0)          K    mylats     mylons     exacts    mytemps       fo
(0)             16.28100    -126.14     20.650    20.6500    20.6500
(0)          5  16.28110    -126.14     20.650    20.6500  -999.0000
(0)         25  16.36279    -125.77     20.550    20.5500    20.5500
(0)         50  16.36289    -125.77     20.550    20.4501    20.4501
(0)         75  16.71504    -125.86     20.350    20.3500    20.3500
(0)        100  16.71514    -125.86     20.350    20.3501    20.3502
(0)        300  16.63296    -126.22     20.650    20.6500    20.6500
(0)        400  16.63305    -126.22     20.650    20.6500  -999.0000
(0)        700  40.57919     -74.57      2.350     2.3500     2.3500
(0)        900  40.57929     -74.57      2.350     3.4908     3.4891
(0)       1000  40.52584     -74.11      4.750     4.7500     4.7500
(0)       3000  40.52594     -74.11      4.750     4.5151     4.5153
(0)       7000  40.87282     -74.04      1.350     1.3500     1.3500
(0)      10000  40.87292     -74.04      1.350     2.2145     2.2143
(0)      15000  40.92625     -74.50      0.850     0.8500     0.8500
(0)     123456  40.92635     -74.50      0.850     1.4571     1.4570

   You can also use the write_matrix procedure for "pretty printing"
   2-dimensional variables.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/getenv.shtml
THE_TITLE:getenv
   NCL Home > Documentation > Functions > System tools

getenv

   Returns the string value of a shell environment variable.

Prototype

        function getenv (
                env_name [1] : string
        )

        return_val [1] :  string

Return value

   Returns a string containing the value of the shell environment variable
   requested, if that environment variable is set, or a missing value if
   it is not set.

Description

   This function returns the value of the shell environment variable
   requested, if set, or a missing value if the environment variable is
   not set.

See Also

   system systemfunc

Examples

   Example 1

   Get the value of the shell environment variable HOST:
    host = getenv("HOST")
    print (host)

Variable: host
Type: string
Total Size: 8 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     myhost

   Here, variable "host" contains the string "myhost".

   Example 2

   Set the following environment variables in the shell (C-Shell assumed):

    setenv YEAR1 1901
    setenv YEAR2 2000

   NCL may retrieve these variables as:
    yr1_string = getenv("YEAR1")    ; return string "1901"
    yr2_string = getenv("YEAR2")    ; return string "2000"

   Example 3

   It is often useful to return string values as integral or floating
   point values. To do so, use the conversion functions "stringtointeger"
   and "stringtofloat":

   Using environment variables set in Example 2, above:

    yr1 = stringtointeger(getenv("YEAR1"))  ; yr1 = 1901  ; (integer)
    yr2 = stringtointeger(getenv("YEAR2"))  ; yr2 = 2000  ; (integer)

   Floating point values are similarly retrieved. From within a shell
   (C-Shell assumed):

    setenv CINT 2.5

   Retrieve this value from within NCL using the conversion function
   "stringtofloat":
    cint = stringtofloat(getenv("CINT"))  ; cint = 2.5 (type float)

   Example 4

   NCL may be used within a shell script. The shell script can set one or
   more environment variables and then invoke an NCL script which uses the
   getenv function to access the environment variable(s) set.

   Consider the following C-shell script:

#!/bin/csh

@ YR     = 79
@ YRSTOP = 99
#
while ( $YR <= $YRSTOP )
    echo $YR
    setenv YEAR $YR
    ncl myscript.ncl &          ; Processes are put in background [&]
    @ YR = ($YR + 1)
end

exit

   A functionally similar NCL script may invoke the system command. This
   uses shell syntax (default shell: /bin/sh) that sets an environment
   variable as export name = value. This example uses NCL's sleep
   procedure to wait 5 seconds before proceeding to the next iteration.
   The use of sleep is not necessary, it is included for illustrative
   purposes only.

begin
  do year =79, 81
     system("export YEAR = "+ year + "; echo $YEAR ; ncl myscript.ncl &")
     sleep(5)
  end do
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

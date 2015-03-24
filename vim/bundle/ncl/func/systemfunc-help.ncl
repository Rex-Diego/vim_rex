THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/systemfunc.shtml
THE_TITLE:systemfunc
   NCL Home > Documentation > Functions > System tools

systemfunc

   Executes a shell command and returns the output.

Prototype

        function systemfunc (
                command [1] : string
        )

        return_val [1] :  string

Arguments

   command

   A singly dimensioned string containing a shell command to execute.

Return value

   Returns a singly dimensioned string array containing the output from
   the executed shell command.

Description

   This function passes the string command to the shell environment for
   execution. When the command completes, the output from the shell
   command is returned to NCL as a string, and control is returned to NCL.

   The default shell used to execute command is /bin/sh (Bourne Shell). A
   different shell may be specified in command; to use a different shell,
   such as the C-Shell, commands are enclosed in single quotes (') to
   prevent the Bourne Shell from interpreting the commands. If the C-Shell
   command itself contains single quotes, they must be escaped with a '\'.
   See Example 5 below.

   Using the systemfunc command, an NCL script can perform tasks often
   accomplished via a Linux/Unix shell script.

See Also

   getenv system

Examples

   Example 1

   Retrieve the current time and date and return as a string:
  TimeDate = systemfunc("date")

   This returns a string of the form: TimeDate = "Tue Apr 11 14:30:44 MDT
   2000".

   Example 2

   Use several Linux/Unix tools to create a UTC (Coordinated Universal
   Time) time. The Linux/Unix command date -u returns the time as GMT
   (Greenwich Mean Time).
   ; "date -u" returns a string of the form: "Tue Feb 18 16:48:31 GMT 2003"
   UTC = systemfunc("date -u '+%H%M UTC %e %b %Y'| awk '{print toupper($0)}'")

   print(UTC)   ; 1648 UTC 18 FEB 2003

   Example 3

   Retrieve a list of files from the current directory using wild cards:
  myFiles = systemfunc("ls *.nc")  ; return all netCDF files

   myFiles will be a singly dimensioned array of strings.

   Example 4

   Retrieve a list of files from another directory:
  diri = "/ptmp/user/data/AnnualData/"
  fils = systemfunc("ls " + diri + "annual*")

  print(fils)   ; full path to files

Variable: fils
Type: string
Total Size: 40 bytes
            5 values
Number of Dimensions: 1
Dimensions and sizes:   [5]
Coordinates:
(0)     /ptmp/user/data/AnnualData/annual.1974.nc
(1)     /ptmp/user/data/AnnualData/annual.1975.nc
(2)     /ptmp/user/data/AnnualData/annual.1976.nc
(3)     /ptmp/user/data/AnnualData/annual.1977.nc
(4)     /ptmp/user/data/AnnualData/annual.1978.nc

   Example 5

   Retrieve a list of files from another directory, but do not include the
   directory; use the C-Shell (csh) syntax. To prevent the Bourne Shell
   from attempting to interpret C-Shell syntax, commands are enclosed by
   single quotes ('). If the C-Shell command itself contains single
   quotes, they must be escaped with a '\'.

   First, use the Linux/Unix command cd to change directory location to
   the desired directory, and then list the appropriate files:

  diri = "/ptmp/user/data/AnnualData/"
  fils = systemfunc ("csh -c 'cd " + diri + " ; ls annual*'")

  print(fils)   ; relative path to files

Variable: fils
Type: string
Total Size: 40 bytes
            5 values
Number of Dimensions: 1
Dimensions and sizes:   [5]

(0)     annual.1974.nc
(1)     annual.1975.nc
(2)     annual.1976.nc
(3)     annual.1977.nc
(4)     annual.1978.nc

   Example 6

   The following is based on an ncl-talk query:

   I have a directory "main" which has 20 subdirectories "a1", "a2", "a3",
   "a4",....... "a20" Each of these 20 subdirectories have 3 netcdf files
   each. How do I get the list of netcdf file names (20*3=60 file names)
   from "main" directory using systemfunc?
Response:

Let's say the files are in "/home/user/main".

You could do something like this:

   cmd  = "find /home/user/main/a* -type f -print"
   fili = systemfunc(cmd)

You can also use variables:

   dir  = "/home/user/main"
   cmd  = "find " + dir + "/a* -type f -print"
   fili = systemfunc(cmd)


   Example 7

   Some simple uses of the Unix/Linux awk tool as implemented via
   systemfunc. NOTE: awk returns values of type string. The ls -l returns
   nine items.
     * Retrieve a list of file names with a specific size (here, 4616028).
     * Retrieve a list of all file sizes in the current directory.
     * Retrieve the file size of a specific file.

   The toint or stringtoint functions can be used to convert the returned
   strings to integers if needed.

   Note that the first file name/size is empty. List from the 1st file The
   file size is item (argument) 5 while the file name is argument 9.
  fname = systemfunc("ls -l | awk '{if ($5 = 4616028) print $9}'" )   ; type str
ing

  print(fname)         ; Note that the initial file name is not appropriate
  print(fname(1:))     ; start from 1 .... 0 is bogus


  fsizes = systemfunc("ls -l | awk '{print $5}' ")
  fsize  = toint(fsizes(1:))

  diri = "/my/data/"
  fili = "3B42.020301.3.6.nc"
  fszs = systemfunc("ls -l "+diri+fili+" | awk '{print $5}' ")
  fsz  = toint(fszs)


   Example 8

   The following is based on an ncl-talk query:
   Is there is a way for 'live' interaction between an NCL script and
   user?

   Yes.
     print("=======> Enter integer a:")
    ;a = stringtointeger(systemfunc("read ifland; echo $ifland")) ; up thru 5.1.
1
     a = toint(systemfunc("read ifland; echo $ifland")) ; 5.2.0
     print(a)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

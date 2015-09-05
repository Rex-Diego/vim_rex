THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/system.shtml
THE_TITLE:system
   NCL Home > Documentation > Functions > System tools

system

   Executes a shell command.

Prototype

        procedure system (
                command [1] : string
        )

Arguments

   command

   A singly dimensioned string containing a shell command to execute.

Description

   This procedure passes the string command to the shell environment for
   execution. When the command completes, control is returned to NCL.

   Nothing is returned to the NCL environment.

   The default shell used to execute command is /bin/sh (Bourne Shell). A
   different shell may be specified in command; to use a different shell,
   such as the C-Shell, commands are enclosed by single quotes (') to
   prevent the Bourne Shell from interpreting the commands. If the C-Shell
   command itself contains single quotes, they must be escaped with a '\'.
   See Example 5 below.

   Using the system command, an NCL script can perform tasks often
   accomplished via a Linux/Unix shell script.

   By default, system pages its output for the convenience of the user. If
   you have the PAGER environment variable set, that value is used for
   paging; if it's not set, the pager more is used. If this behavior is
   not desired, paging may be turned off by either setting the environment
   variable NCL_NO_SYSTEM_PAGER or by using the command line option -p.
   This functionality will be available in version 5.0.0 of NCL.
setenv NCL_NO_SYSTEM_PAGER 1    (csh)
export NCL_NO_SYSTEM_PAGER=1    (sh)

   or
ncl -p

See Also

   getenv, systemfunc

Examples

   Example 1

   Echo the current date and time to the screen:

begin
  system("date")
end

   This returns a string of the form: Wed Jan 12 19:40:25 MST 2005

   Example 2

   Use an NCL script to pass environment variables to another NCL script
   that uses getenv to access the settings. The following code will create
   a file name to be passed to an NCL script that converts the binary file
   to netCDF format.

   Note: "export name=value" is used to set environment variables in the
   Bourne Shell (/bin/sh) and the semicolon (";") is used to place
   multiple shell commands on the same line.
begin
  tStart = 0
  tLast  = 1500
  tJump  = 30

  diri   = "/ptmp/user/model/binary/"
  diro   = "/ptmp/user/model/netCDF/"

  fRoot  = "myFile."
  fExt   = ".bin"

  do time = tStart, tLast, tJump
     fili = fRoot + time + fExt    ; name is of form myFile.630.bin and similar
     filo = fili + ".nc"
     print ("time = " + time + " fili = " + fili)

     ; use Bourne Shell 'export' to create environment variables
     system ("   export DIRIN="   + diri + \
             " ; export DIROUT="  + diro + \
             " ; export FILEIN="  + fili + \
             " ; export FILEOUT=" + filo + \
             " ; ncl bin2nc_model.ncl ")
  end do
end

   The NCL script "bin2nc_model.ncl" accesses the environment variables
   using the getenv function:

  diri = getenv("DIRIN")
  fili = getenv("FILEIN")

  diro = getenv("DIROUT")
  filo = getenv("FILEOUT")

   Example 3

   Use system to execute a sequence of commands to:
     * get files from NCAR's Mass Storage System (MSS)
     * use the netCDF operator "ncrcat" to extract the variable TEMP from
       multiple files
     * delete the original files from the MSS since they are no longer
       needed.

   Placing the command to be executed in a separate string is not
   necessary. In this example, the command string is used so that the user
   can explicitly see the command to be executed (this is good for
   debugging complicated strings.

begin
  nyrStart = 400                         ; start year
  nyrLast  = 999                         ; last  year

  mssi = "/CCSM/csm/b20.007/ocn/hist/"   ; MSS directory
  fili = "b20.007.pop.h.0"               ; first part of file name
  diri = "/ptmp/user/"                   ; where to put files from MSS
  diro = "/ptmp/user/"                   ; where to put final files
  filo = "b20.TEMP."                     ; rename output files


  do nyear = nyrStart, nyrLast
      wallClock = systemfunc("date")                         ; determine start t
ime for each year
      print("year = " + year + " wallClock = " + wallClock)  ; create/execute an
 MSS command
      msscmd = "msrcp -n 'mss:" + mssi + fili + nyear + "-[0-1][0-9].nc' " + dir
i + "."
      print(" msscmd = " + msscmd)
      system(msscmd)

      ; use 'ncrcat' to extract variable
      ncocmd = "ncrcat -v TEMP " + diri + fili + "*.nc " + diro + filo + nyear +
 ".nc"
      print("ncocmd = " + ncocmd)
      system(ncocmd)

      ; delete original files
      rmcmd = "'rm' " + diri + fili + nyear + "*.nc"
      print("rmcmd = " + rmcmd)
      system(rmcmd)
  end do

end

   Example 4

   Use Bourne Shell syntax to create a directory if it does not already
   exist.

   Note: in a Linux/Unix environment, multiple shell statements may be
   executed by using a semicolon (";") to separate them:
   DIR = "SAMPLE"
   system("if ! test -d " + DIR +" ; then mkdir " + DIR + " ; fi")

   Example 5

   The same as example 4, but use C-Shell (csh) syntax to create a
   directory if it doesn't already exist. To prevent the Bourne Shell from
   attempting to interpret C-Shell syntax, commands are enclosed by single
   quotes ('). If the C-Shell command itself contains single quotes, they
   must be escaped with a '\'.
  system("csh -c 'if (! -d " + DIR +") then ;  mkdir " + DIR + " ; endif'")

   Example 6

   Use ImageMagick's convert to create a gif image from a postscript file
   generated within NCL.

   Let the generated graphic be
  wks = gsn_open_wks("ps","sample")         ; create "./sample.ps"

; generate the plot(s) and before exit

  system("convert -density 128 -trim +repage sample.ps sample.gif)
                                              ; remove the ps files
  system("/bin/rm -f sample.ps)

   Another approach with the same result:

  pltName = "sample"
  pltType = "ps"
  pltDir  = "./"                              ; directory for plots
  pltPath = pltDir + pltName

  wks = gsn_open_wks(pltType,pltPath)         ; create "./sample.ps"

; generate the plot(s) and before exit

  pltIn  = pltPath+"."+pltType
  pltOut = pltPath+".gif"
  system("convert -density 128 -trim +repage "+pltIn+" "+pltOut")
                                              ; remove the ps files
  system("/bin/rm -f "+pltIn)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

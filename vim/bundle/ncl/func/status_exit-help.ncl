THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/status_exit.shtml
THE_TITLE:status_exit
   NCL Home > Documentation > Functions > System tools

status_exit

   Exits an NCL script passing a status code to the calling environment.

   [new.gif] Available in version 5.0.0 and later.

Prototype

        procedure status_exit (
                code  : integer
        )

Arguments

   code

   The status value to be passed to the calling environment.

Description

   Like the exit procedure, this procedure executes the standard C library
   exit command to exit the NCL script immediately. Unlike exit, it passes
   the value of the code argument to the calling enviroment, that is, the
   parent process, typically some flavor of Unix shell. Note that only the
   low-order eight bits of the value is actually transmitted.

   The C library defines two standard exit codes, EXIT_SUCCESS and
   EXIT_FAILURE, generally equated to the values 0 and 1 respectively.
   Other values may not be universally recognized.

See Also

   exit
   quit

Examples

   Example 1

   Exit a script with an error if a file is not opened successfully:
f = addfile("no_such_file.nc","r")
if (ismissing(f)) then
    status_exit(42)
end if

   The status value is available (until the next command is issued) in the
   C shell as $status. In sh, ksh, and bash it can be accessed as $?. In
   bash it is also available as $PIPESTATUS.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

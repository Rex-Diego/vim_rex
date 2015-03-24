THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/exit.shtml
THE_TITLE:exit
   NCL Home > Documentation > Functions > System tools

exit

   Forces an NCL script to exit immediately.

Prototype

        procedure exit (
        )

Description

   This procedure executes the standard C library exit command with the
   value of 0 to immediately exit the NCL script.

   Note that this procedure does not do the normal cleanup that occurs
   when "quit" (an NCL keyword) is invoked or when an NCL script just ends
   without either of these being executed. If you are writing graphics to
   an output file, like a PS or NCGM file, then these files may not be
   closed properly. You may want to call "delete(wks)" on your workstation
   before exiting a script, to ensure that it is closed properly.

   As of NCL version 5.0.0 the behavior described above concerning normal
   cleanup has been deemed an incorrect behavior (i.e. a bug) and has been
   fixed. All graphics and data files are now closed properly when exit is
   called.

See Also

   status_exit
   quit

Examples

   Example 1

   Quit a script if a certain condition is met:
begin
  [...]
  x = 0
  [...]

  if (x .eq. 0)
      exit
  end if
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

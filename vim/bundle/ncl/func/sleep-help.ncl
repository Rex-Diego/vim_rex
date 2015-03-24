THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sleep.shtml
THE_TITLE:sleep
   NCL Home > Documentation > Functions > System tools

sleep

   Pauses execution of NCL scripts for a specified number of seconds.

Prototype

        procedure sleep (
                seconds [1] : integer
        )

Arguments

   seconds

   A single positive integer value representing the number of seconds to
   pause script execution.

Description

   This procedure pauses script execution for the specified number of
   seconds.

Examples

   Example 1

   Wait 5 seconds before proceeding to the next iteration.
begin
  do year = 79, 81
     system("export YEAR = "+ year +"; echo $YEAR ; ncl myscript.ncl &")
     sleep(5)
  end do
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

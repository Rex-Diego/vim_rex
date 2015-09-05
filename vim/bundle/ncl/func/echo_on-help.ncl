THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/echo_on.shtml
THE_TITLE:echo_on
   NCL Home > Documentation > Functions > System tools

echo_on

   Enables echoing of NCL statements as they are encountered.

Prototype

        procedure echo_on (
        )

Description

   Echoes NCL statements as they are encountered. This can be particularly
   useful when debugging NCL scripts in batch mode. This procedure has the
   same effect as the command line option -x and is useful in conjunction
   with echo_off.

See Also

   echo_off

Examples

   Example 1

   Turn on echo mode to debug a script. Echoing of commands will occur
   until the end of the script.
begin
  [...]
  x = 0
  [...]

  echo_on()
  if (x .eq. 0)
      [...]
  end if

  [...]
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

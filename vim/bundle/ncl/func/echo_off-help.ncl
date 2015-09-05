THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/echo_off.shtml
THE_TITLE:echo_off
   NCL Home > Documentation > Functions > System tools

echo_off

   Disables echoing of NCL statements as they are encountered.

Prototype

        procedure echo_off (
        )

Description

   Turn off echoing of NCL statements. This can be particularly useful
   when debugging NCL scripts in batch mode and is typically used in
   conjunction with echo_on. This procedure reverses the effect of the
   command line option -x.

See Also

   echo_on

Examples

   Example 1

   Turn off echo mode when debugging a script.
begin
  [...]
  x = 0
  [...]

  echo_on()
  if (x .eq. 0)
      [...]
  end if
  echo_off()

  [...]
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

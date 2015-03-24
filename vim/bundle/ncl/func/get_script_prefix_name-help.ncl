THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/get_script_prefix_name.shtml
THE_TITLE:get_script_prefix_name
   NCL Home > Documentation > Functions > System tools

get_script_prefix_name

   Returns the name of a script of commands provided to NCL for execution,
   if provided, with any script name tag removed.

Prototype

        function get_script_prefix_name (
        )

        return_val [1] :  string

Return value

   Returns a singly dimensioned string containing the name of the file of
   commands, if provided, to NCL for execution, with the script name tag
   removed.

Description

   This function returns the name of a script of commands that NCL was
   invoked with, if provided, with the script name tag removed.

See Also

   get_script_name

Examples

   Example 1

   Print the name of the command file provided to NCL. If NCL is invoked
   as:
% ncl myScript.ncl

   the script itself can announce how NCL was invoked:

  script_name  = get_script_prefix_name()  ; string
  print(script_name)                ; Or, just print(get_script_prefix_name())

   The following string is returned:
myScript

   Example 2

   If no script is provided to NCL, the default missing value for type
   string is returned. If NCL is invoked as:
% ncl

   the function will return:
  print(get_script_prefix_name())

  (0) missing


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

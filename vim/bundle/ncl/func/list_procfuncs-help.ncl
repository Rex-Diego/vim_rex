THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/list_procfuncs.shtml
THE_TITLE:list_procfuncs
   NCL Home > Documentation > Functions > Variable query

list_procfuncs

   Lists all of the currently defined NCL functions and procedures and
   their argument lists.

Prototype

        procedure list_procfuncs (
        )

Description

   This procedure lists all of the currently defined NCL procedures and
   functions, the type of each parameter, and the dimensionality of each
   parameter. If run at the command line, this procedure invokes a pager
   for scrolling through the list. The pager is either "more" or whatever
   the user's PAGER environment variable is set to.

See Also

   list_files, list_hlus, list_vars

Examples

   Example 1

   There's not really a whole lot you can do with this procedure, except
   to use it:
begin
  list_procfuncs
end

   It may be useful to pipe this output to a file that you can then
   search.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

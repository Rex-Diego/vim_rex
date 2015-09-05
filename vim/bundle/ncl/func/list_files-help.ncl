THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/list_files.shtml
THE_TITLE:list_files
   NCL Home > Documentation > Functions > File IO

list_files

   Lists all of the variables that reference files.

Prototype

        procedure list_files (
        )

Description

   Lists all of the current variables containing references to files.
   These variables were created by the addfile function. If run at the
   command line, this procedure invokes a pager for scrolling through the
   list. The pager is either "more" or whatever the user's PAGER
   environment variable is set to.

See Also

   list_hlus, list_procfuncs, list_vars

Examples

   Example 1
     f = addfile("hgt.mon.mean.nc","r")
     g = addfile("slp.mon.mean.nc" ,"r")
     h = addfile("soi.nc" ,"r")

     list_files()

   outputs to standard out:

h       READ ONLY
        soi.nc
        Dimensions:
                (0) time 1392
        Attributes:
                title
                source
                history
                Conventions
                creation_date
                references

g       READ ONLY
        slp.mon.mean.nc
        Dimensions:
                (0) lon 144
                (1) lat 73
                (2) time 683
        Attributes:
                title
                history
                description
                platform
                Conventions

f       READ ONLY
        hgt.mon.mean.nc
        Dimensions:
                (0) lon 144
                (1) lat 73
                (2) level 17
                (3) time 674
        Attributes:
                title
                history
                description
                platform
                Conventions


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

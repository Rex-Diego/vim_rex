THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/list_filevars.shtml
THE_TITLE:list_filevars
   NCL Home > Documentation > Functions > File IO

list_filevars

   Lists all of the variables associated with a specific file.

Prototype

        procedure list_filevars (
                filevar [1] : file
        )

Arguments

   filevar

   Reference to an open file. This must be created via addfile. This must
   be a supported file format.

Description

   All of the variables referenced by the filevar parameter are listed. If
   run at the command line, this procedure invokes a pager for scrolling
   through the list. The pager is either "more" or whatever the user's
   PAGER environment variable is set to.

See Also

   getfilevarnames

Examples

   Example 1

     g = addfile("slp.mon.mean.nc" ,"r")
     list_filevars(g)

   The above code snippet outputs to standard out:
float   slp [ time | 683 ] x [ lat | 73 ] x [ lon | 144 ]
        long_name
        valid_range
        actual_range
        units
        add_offset
        scale_factor
        missing_value
        precision
        least_significant_digit
        var_desc
        dataset
        level_desc
        statistic
        parent_stat

double  time [ time | 683 ]
        units
        long_name
        actual_range
        delta_t
        prev_avg_period

float   lon [ lon | 144 ]
        units
        long_name
        actual_range

float   lat [ lat | 73 ]
        units
        actual_range
        long_name


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

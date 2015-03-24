THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ncargpath.shtml
THE_TITLE:ncargpath
   NCL Home > Documentation > Functions > System tools

ncargpath

   Returns the absolute pathnames of various NCAR Graphics directories.

Prototype

        function ncargpath (
                char  : string
        )

        return_val [1] :  string

Arguments

   char

   A singly dimensioned string denoting the directory name whose fully
   qualified pathname is requested.

Return value

   Returns a singly dimensioned string containing the directory name whose
   fully qualified pathname is requested. An invalid directory name
   returns NULL.

Description

   This function returns a fully qualified pathname for the requested
   directory. Below is a list of the valid strings.
          "bin"             Directory where NCAR Graphics binaries are
                            installed.

          "config"          Directory where NCAR Graphics
                            configuration files are installed.

          "data"            Directory where NCAR Graphics HLU and NCL
                            example data files are installed.

          "database"        Directory where NCAR Graphics databases
                            (like the Ezmap database) are installed.

          "doc"             Directory where NCAR Graphics PostScript
                            documents are installed.

          "examples"        Directory where NCAR Graphics LLU Fortran
                            and C examples are installed.

          "fontcap"         The default fontcap being used; only
                            returns a valid fontcap if the environment
                            variable FONTCAP is set.

          "fontcaps"        Directory where NCAR Graphics fontcaps are
                            installed.

          "gks_output"      The default name of the metafile.

          "graphcap"        The default graphcap being used; only
                            returns a valid graphcap if the
                            environment variable GRAPHCAP is set.

          "graphcaps"       Directory where NCAR Graphics graphcaps
                            are installed.

          "hluex"           Directory where NCAR Graphics HLU Fortran
                            and C examples are installed.

          "include"         Directory where NCAR Graphics include
                            files are installed.

          "lib"             Directory where NCAR Graphics libraries
                            are installed.

          "man"             Directory where NCAR Graphics man pages
                            are installed.

          "ncarg"           Root directory where NCAR Graphics
                            examples, databases, resource files, etc.
                            are installed.

          "nclex"           Directory where NCAR Graphics NCL examples
                            are installed.

          "ngwww"           Directory where NCAR Graphics HTML files
                            are installed (if they were installed).

          "ngurl"           URL for the NCAR Graphics documentation.

          "resfiles"        Directory where resource files for the NCL
                            and HLU examples are installed.

          "root"            Parent directory where NCAR Graphics is
                            installed.

          "sysappres"       Directory where the NCAR Graphics systems
                            application resource file is installed.

          "sysresfile"      Directory where the NCAR Graphics system
                            resource file is installed.

          "tests"           Directory where NCAR Graphics LLU Fortran
                            and C test examples are installed.

          "tmp"             Directory where NCAR Graphics temporary
                            files will be written.

          "tutorial"        Directory where NCAR Graphics LLU tutorial
                            C and Fortran examples are installed.

          "usrresfile"      Directory where the NCAR Graphics user
                            resource file is installed.

          "xapp"            Directory where NCAR Graphics X
                            application default files are installed.

See Also

   ncargversion

Examples

   Example 1

   Retrieve the NCAR Graphics bin directory, where NCAR Graphics binaries
   are installed:
  print(ncargpath("bin"))

   This returns a string of the form: /usr/local/ncarg/bin

   The location is site- and installation-dependent.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

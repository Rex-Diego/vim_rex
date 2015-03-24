THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/loadscript.shtml
THE_TITLE:loadscript
   NCL Home > Documentation > Functions > System tools

loadscript

   Loads the given NCL script.

Prototype

        procedure loadscript (
                filename [1] : string
        )

Arguments

   filename

   A string containing the name of the NCL script to load. filename can
   include a path name to the file as well.

Description

   This procedure loads the given NCL script. The script can either be
   sets of functions and procedures or actual NCL programs. Unlike the NCL
   "load" statement, loadscript can be executed conditionally.

   Caveat: if the script being loaded contains any procedures or
   functions, they cannot be accessed within a block that contains the
   loadscript procedure. For example, if "testscript.ncl" contains the
   procedure "proc", then the following code will produce an error:
  if (doit .eq. True) then
    loadscript("testscript.ncl")
    proc()
  end if

   This code will also produce an error:
begin
  loadscript("testscript.ncl")
  proc()
end

   The better way to do the above code is:
loadscript("testscript.ncl")

begin
  proc()
end

See Also

   The load statement.

Examples

   Example 1

   Assume that if the NCL scripts "foo1.ncl" and "foo2.ncl" exists, they
   contain the following lines of code:

   foo1.ncl:

    x      = 1.0
    script = "foo1.ncl"

   foo2.ncl:

    x      = 2.0
    script = "foo2.ncl"

   Further assume that at least one of these scripts must exist in your
   current directory so they can get loaded. Otherwise, an error message
   will occur. This code could look like the following:

filename1 = "foo1.ncl"
filename2 = "foo2.ncl"

if(isfilepresent(filename1)) then
  loadscript(filename1)
else
  if(isfilepresent(filename2)) then
    loadscript(filename2)
  else
    print("Error: neither file exists. Can't continue.")
    exit
  end if
end if

begin
  print("x = " + x)
  print("Script loaded is '" + script + "'")
end

   Important note: In order to properly reference variables inside
   foo1.ncl/foo2.ncl, the loadscript call must appear outside any kind of
   code block that references the variables. In this case, the variables
   are referenced inside a begin/end block, so the loadscript call comes
   before the begin statement.

   If foo1.ncl exists (and foo2.ncl does or doesn't exist), then the above
   code will produce:
(0)     x = 1
(0)     Script loaded is 'foo1.ncl'

   If only foo2.ncl exists, then the above code will produce:
(0)     x = 2
(0)     Script loaded is 'foo2.ncl'

   Example 2

   Many NCL scripts explicitly load the high level graphics and
   contributed libraries at the beginning. This has the advantage of
   clarity and the script will load only the specified libraries. However,
   some users find this cumbersome. The NCL_DEF_SCRIPTS_DIR environment
   variable can be used to point to a directory containing a script the
   user wants to be loaded *every* time NCL is run by that user. This
   script [say, aaa.ncl] must use the loadscript procedure for proper
   loading. The begin/end are needed for each NCL "load" statement to be
   execured.

    setenv NCL_DEF_SCRIPTS_DIR /some/user/directory

   The file aaa.ncl contains
    begin
      loadscript( "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"   )
    end
    begin
     loadscript( "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"    )
    end
    begin
     loadscript ( "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl")
    end
;;  Other libraries can be added as desired

   Note: Loading these three libraries does not add significant time
   overhead.
   Note: If there is only one .ncl file in the directory, the file name is
   arbitrary. However, if there are multiple .ncl files in the
   NCL_DEF_SCRIPTS_DIR directory, they will be loaded in alphabetical
   order. This can cause issues if the libraries violate NCL's scoping
   rules which are identical to Pascal's scoping rules. See the section
   The local statement and function and procedure scope.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

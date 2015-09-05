THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/get1Dindex.shtml
THE_TITLE:get1Dindex
   NCL Home > Documentation > Functions > Array query

get1Dindex

   Finds the indices of a one-dimensional array which exactly match a user
   specified list of values.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function get1Dindex (
                x            [*] : numeric,
                wanted_value [*] : numeric
        )

        return_val  :  integer or long

Arguments

   x

   A one-dimensional array.
   wanted_value

   A one dimensional array of the same type as x containing the user
   specified values of x for which the subscripts [indices] are desired.
   Exact values only. NOTE: (a) It does not return the subscripts of the
   closest values; (b) When there is more than one exact match, the
   returned index is that of the first match.

Return value

   A scalar or one dimensional array containing index subscripts
   corresponding to wanted_value.

Description

   Finds the indices in a one-dimensional array which equal a user
   specified list of values. The values must exist in the array to be
   checked. If the value does not exist, try using closest_val.
   Differs from ind in that an array of wanted values can be checked
   versus only a single value. Also, the input to ind must be made into a
   logical expression.

   The input arguments should contain only unique values. Duplicate
   entries will lead to a fatal error.

   NOTE: (a) It does not return the subscripts of the closest values; (b)
   When there is more than one exact match, the returned index is that of
   the first match.

See Also

   closest_val, getind_latlon2d, ind

Examples

   Example 1

   Find the subscript indices corresponding to years specified by the
   user.
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
       ;
       ;
  year      = ispan(1870,2006,1)

  year_want = (/1870,1900, 1948, 1957, 1964, 1965, 1989, 2005, 2006/)
  i         = get1Dindex(year,year_want)

  print(i)

   The output would be:

Variable: i
Type: integer
Total Size: 28 bytes
            9 values
[snip]
(0)     0
(1)     30
(2)     78
(3)     87
(4)     94
(5)     95
(6)     119
(7)     135
(8)     136

   Example 2

   Read specific dates over multiple files.
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

; user specified dates [yyyymmdd]

   date_select = (/19830131, 19850202, 19890610/)


   diri = "./"      ; input directory
   fili = systemfunc("cd "+diri +" ; ls uwnd*nc")
   print(fili)

   f = addfiles(diri+fili, "r")

   time = f[:]->time
   date = ut_calendar(time, -2)         ; yyyymmdd

   idate= get1Dindex(date, date_select) ; index for each desired data

   u_select = f[:]->uwnd(idate,:,:,:)   ; read selected dates only

   diro = "./"
   filo = "uwnd_select.nc"
   system("/bin/rm -f "+diro+filo)      ; rm any pre-existing file

   f_select = addfile(diro+filo, "c")
   f_select->date = date(idate)
   f_select->uwnd = u_select



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

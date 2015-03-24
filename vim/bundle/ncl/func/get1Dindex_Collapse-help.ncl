THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/get1Dindex_Collapse.shtml
THE_TITLE:get1Dindex_Collapse
   NCL Home > Documentation > Functions > Array manipulators

get1Dindex_Collapse

   Returns a one dimensional array of subscript indices that DO NOT match
   the values contained in a user specified list.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function get1Dindex_Collapse (
                x             [*] : numeric,
                exclude_value [*] : numeric
        )

        return_val  :  integer or long

Arguments

   x

   A one-dimensional array.
   exclude_value

   A one dimensional array of the same type as x. Must exist in x.

Return value

   A one dimensional array containing index subscripts excluding those
   specified by exclude_value.

Description

   Finds the indices in a one-dimensional array which do not match a user
   specified list of values. The values must exist in the array to be
   checked.

See Also

   ind, get1Dindex

Examples

   Example 1

   Find the subscript indices which exclude the years specified by the
   user.
  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
       ;
       ;
  year      = ispan(1985,2006,1)

  year_exc  = (/1985, 1989, 1999, 2005, 2006/)
  i         = get1Dindex_Collapse(year,year_exc)

  print("i="+i+  year(i)="+year(i))

   The output would be:

        i=1    year(i)=1986
        i=2    year(i)=1987
        i=3    year(i)=1988
        i=5    year(i)=1990
        i=6    year(i)=1991
        i=7    year(i)=1992
        i=8    year(i)=1993
        i=9    year(i)=1994
        i=10   year(i)=1995
        i=11   year(i)=1996
        i=12   year(i)=1997
        i=13   year(i)=1998
        i=15   year(i)=2000
        i=16   year(i)=2001
        i=17   year(i)=2002
        i=18   year(i)=2003
        i=19   year(i)=2004

   The following indices were excluded:

     no i=0  year(0)=1985
     no i=4  year(4)=1989
     no i=14 year(14)=1999
     no i=20 year(20)=2005
     no i=21 year(21)=2006


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

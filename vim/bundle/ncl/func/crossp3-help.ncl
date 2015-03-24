THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/crossp3.shtml
THE_TITLE:crossp3
   NCL Home > Documentation > Functions > Array manipulators

crossp3

   Compute cross product of multiple vectors of length 3.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function crossp3 (
                a [*][3] : numeric,
                b [*][3] : numeric
        )

        return_val  :  same type and shape of a

Arguments

   a

   A two dimensional array of any numeric type. The right dimension must
   be of length 3 [x,y,z directions].
   b

   A two dimensional array of any numeric type. The right dimension must
   be of length 3 [x,y,z directions].

Return value

   The results are returned in an array of the same shape and type as a.

Description

   The following is applied to each triplet.
     c(0) = a(1)*b(2)-a(2)*b(1)
     c(1) = a(2)*b(0)-a(0)*b(2)
     c(2) = a(0)*b(1)-a(1)*b(0)

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
 load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

  a  = (/ (/ 2,  -3,  -1/) \
        , (/-4, 9.3, 0.4/) /)
  b  = (/ (/ 1,   4,  -2/) \
        , (/-9,   0,-5.4/) /)

  ab = crossp3(a,b)
  ba = crossp3(b,a)

  print("ab="+ab +"   ba="+ba)

   The output would be:
    (0,0)       ab=10       ba=-10
    (0,1)       ab=3        ba=-3
    (0,2)       ab=11       ba=-11

    (1,0)       ab=-50.22   ba=50.22
    (1,1)       ab=-25.2    ba=25.2
    (1,2)       ab=83.7     ba=-83.7


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

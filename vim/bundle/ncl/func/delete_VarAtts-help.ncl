THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/delete_VarAtts.shtml
THE_TITLE:delete_VarAtts
   NCL Home > Documentation > Functions > Metadata routines

delete_VarAtts

   Deletes one or more attributes associated with a variable.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure delete_VarAtts (
                var   ,
                atts
        )

Arguments

   var

   Any valid variable.
   atts

   A variable of type string or integer. If it is of type string then it
   can be a single element or a one dimensional array specifying the names
   of the attributes to be deleted.

   If it is of type integer (by convention =-1) then all the attributes
   associated with the variable var will be deleted

Description

   This procedure checks to see if each specified attribute exists. If it
   does exist, it is deleted.

See Also

   There are many metadata tools.

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

   Let the variable x have 5 attributes: "apple", "peach", "orange",
   "banana", "pineapple". Let's say that 3 attributes ("peach", "banana",
   "pineapple") are to be deleted while the others ("apple", "orange") are
   to be retained. The classic approach would be:
      delete(x@pineapple)
      delete(x@peach)
      delete(x@banana)

   Using the delete_VarAtts procedure:
      delete_VarAtts(x,(/"pineapple","peach","banana"/))

   Example 2

   Let the variable x have 50 attributes: Delete all the attributes
   associated with x
      delete_VarAtts(x, -1)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

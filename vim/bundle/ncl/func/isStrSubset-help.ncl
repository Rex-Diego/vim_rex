THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/isStrSubset.shtml
THE_TITLE:isStrSubset
   NCL Home > Documentation > Functions > String manipulation

isStrSubset

   Return True or False if one string is a subset of another string.

   [new.gif] Available in version 4.3.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function isStrSubset (
                str        [1] : string,
                str_subset [1] : string
        )

        return_val [1] :  logical

Arguments

   str

   Variable of type string which will be searched for a substring.
   str_subset

   Variable of type string specifying the subset.

Description

   Return True if str_string is contained within the variable str;
   otherwise return False.

   Note: this function is written as an NCL script, and can be quite slow
   if you have a lot of strings to process. There's a similar function,
   str_index_of_substr, that is written in C and may be faster. See below
   for an example of using this function.

See Also

   indStrSubset, str_index_of_substr

Examples

   Example 1

   Is the string "orange" a subset of "apple_orange_banana"?
   aop = "apple_orange_banana"
   o   = "orange"
   tf  = isStrSubset(aop, o )
   if (tf) then
       print(o+" is a subset of input string: "+aop)
   else
       print(o+" is NOT a subset of input string: "+aop)
   end if

   Here, tf=True and the oupt is

    orange is a subset of input string: apple_orange_banana


   Example 2

   Given an ascii file ["Station.Data"] containing station names and data,
   search each line for a station named "San Francisco".
   S = asciiread ("Station.Data", -1, "string")
   do n=0,nlines-1
      tf = isStrSubset( S(n), "San Francisco")
      if (tf) then
         .... do something ....
         break  ; jump to statement after the 'end do'
      end
   end do

   The above code snippet can be rewritten to use str_index_of_substr:
   S = asciiread ("Station.Data", -1, "string")
   do n=0,nlines-1
      tf = str_index_of_substr( S(n), "San Francisco",0)
      if (.not.any(ismissing(tf))) then
         .... do something ....
         break  ; jump to statement after the 'end do'
      end
   end do


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isfunc.shtml
THE_TITLE:isfunc
   NCL Home > Documentation > Functions > Variable query

isfunc

   Returns True for every element of the input that is a defined function.

Prototype

        function isfunc (
                func_names  : string
        )

        return_val [dimsizes(func_names)] :  logical

Arguments

   func_names

   An array of strings of any dimensionality.

Description

   For each element in the func_names list, isfunc returns True if it is
   the name of a defined function, and False if the function doesn't exist
   or is a procedure.

   Note that this function works on both built-in functions as well as
   functions written in NCL.

See Also

   isproc

Examples

   Example 1

  print(isfunc("sin"))       ; True
  print(isfunc("print"))     ; False because "print" is a procedure
  print(isfunc("lalala"))    ; False because "lalala" doesn't exist

   Example 2

   This example tests for existing functions that may be part of an NCL
   script:
load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"
...
  print(isfunc("gsn_open_wks"))      ; True, defined in gsn_code.ncl
  print(isfunc("gsn_panel"))         ; False because "gsn_panel" is a procedure
  print(isfunc("gsn_csm_contour"))   ; False because "gsn_csm_contour"
                                     ; doesn't exist (it's in gsn_csm.ncl)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

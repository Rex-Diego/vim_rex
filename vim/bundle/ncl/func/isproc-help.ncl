THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isproc.shtml
THE_TITLE:isproc
   NCL Home > Documentation > Functions > Variable query

isproc

   Returns True for every element of the input that is a defined
   procedure.

Prototype

        function isproc (
                proc_names  : string
        )

        return_val [dimsizes(proc_names)] :  logical

Arguments

   proc_names

   An array of strings of any dimensionality.

Description

   For each element in the proc_names list, isproc returns True if it is
   the name of a defined procedure, and False if the procedure doesn't
   exist or is a function.

   Note that this function works on both built-in procedures as well as
   procedures written in NCL.

See Also

   isfunc

Examples

   Example 1

  print(isproc("sin"))       ; False because "sin" is a function
  print(isproc("print"))     ; True
  print(isproc("lalala"))    ; False because "lalala" doesn't exist

   Example 2

   This example tests for existing procedures that may be part of an NCL
   script:
load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"
...
  print(isproc("gsn_open_wks"))      ; False because it's a function
  print(isproc("gsn_panel"))         ; True
  print(isproc("gsn_csm_contour"))   ; False because "gsn_csm_contour"
                                     ; doesn't exist (it's in gsn_csm.ncl)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

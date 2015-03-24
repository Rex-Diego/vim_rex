THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/mod.shtml
THE_TITLE:mod
   NCL Home > Documentation > Functions > General applied math

mod

   Remainder function which emulates the fortran "mod" intrinsic function.

   [new.gif] Available in version 4.3.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function mod (
                n  : numeric,  ; integer, float, double
                m  : numeric
        )

        return_val  :  same type and shape as n

Arguments

   n

   Scalar or array variable of type integer, float, double.
   m

   Scalar or array variable. If an array it must be the same shape as n.
   Although not required, it is best if it is the same type as n.

Description

   NCL has a modulus algebraic operator, % , which requires that the
   arguments be integers. The mod function is more general. The results
   are the same as those of the the GNU "gfortran" compiler. While the
   function allows mixed types, it is best to always use n and m of the
   same type.

Examples

   The contributed.ncl library must be loaded prior to invoking the
   function:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Sample usage: numeric results and return types. Note that the returned
   value is the same numeric type and sign as argument n.
        mod(17,3)         = 2     type= integer

        mod(17.5,5.5)     = 1     type= float
        mod(17.5d0,5.5)   = 1     type= double
        mod(17.5d0,5.5d0) = 1     type= double
        mod(17.5,5.5d0)   = 1     type= float

        mod(17.5, 5 )     = 2.5   type= float
        mod(17  ,5.5)     = 2     type= integer

        mod(-17,3)        = -2    type= integer
        mod(-17.5,5.5)    = -1    type= float
        mod(-17.5d0,5.5)  = -1    type= double
        mod(-17.5d0,5.5d0)= -1    type= double
        mod(-17.5,5.5d0)  = -1    type= float

        mod(-17.5, 5 )    = -2.5  type= float
        mod(-17  ,5.5)    = -2    type= integer

        mod(17,-3)        = 2     type= integer
        mod(17.5,-5.5)    = 1     type= float
        mod(17.5d0,-5.5)  = 1     type= double
        mod(17.5d0,-5.5d0)= 1     type= double
        mod(17.5,-5.5d0)  = 1     type= float

        mod(17.5, -5 )    = 2.5   type= float
        mod(17  ,-5.5)    = 2     type= integer



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

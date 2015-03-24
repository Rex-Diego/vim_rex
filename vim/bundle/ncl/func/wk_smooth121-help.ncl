THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wk_smooth121.shtml
THE_TITLE:wk_smooth121
   NCL Home > Documentation > Functions > General applied math

wk_smooth121

   Performs a specialized 1-2-1 filter for Wheeler-Kiladis plots.

Prototype

        procedure wk_smooth121 (
                x  : float or double
        )

Arguments

   x

   An array with one or more dimensions. The fastest varying (i.e.
   rightmost) dimension will be the dimension on which the specialized
   1-2-1 running average is performed. Missing values should be indicated
   by x@_FillValue. If x@_FillValue is not set, then the NCL default
   (appropriate to the type of x) is assumed.

Description

   This procedure performs a special 1-2-1 weighted running average upon
   x. The input array is altered upon return,

See Also

   wgt_runave, wgt_areaave, wgt_areaave2, wgt_arearmse, wgt_arearmse2,
   wgt_areasum2, wgt_volave, wgt_volave_ccm, wgt_volrmse, wgt_volrmse_ccm

Examples

   Example 1

   Perform the specialized 1-2-1 smoothing on the rightmost dimension of
   x.
    x = ...
                   ; perform a special 1-2-1 filter
    wk_smooth121(x)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

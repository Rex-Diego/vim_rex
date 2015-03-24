THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/eofunc_varimax_reorder.shtml
THE_TITLE:eofunc_varimax_reorder
   NCL Home > Documentation > Functions > Empirical orthogonal functions

eofunc_varimax_reorder

   Reorder the results returned by eof_varimax into descending order by
   percent variance explained.

   [new.gif] Available in version 4.3.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        procedure eofunc_varimax_reorder (
                evec_rot  : numeric
        )

        return_val  :  numeric

Arguments

   evec_rot

   Empirical orthogonal function array returned by eof_varimax.

Description

   Note: due to a bug in versions 4.3.1 and 5.0.0, this function is
   actually called "eof_varimax_reorder". This will be fixed in version
   5.1.0.

   Examines the pcvar_varimax attribute returned by eof_varimax and, if
   necessary, reorders the values by descending percent variance
   explained.

See Also

   eofunc, eofunc, eofunc_varimax, eofunc_Wrap eofunc_varimax_Wrap

Examples

   Example 1 Let eofData(lat,lon,time) be the array containing the data.
      neof    = 10     ; more than usual number for varimax considerations.
      lat     = eofData&lat
      wgt     = sqrt(cos(lat*0.01745329))         ; array syntax
      eofData = eofData*conform(eofData, wgt, 0)  ; weight data vis cos(lat)

      opt     = False
      eof     = eofunc_Wrap (eofData,neof,opt)
      eof_ts  = eofunc_ts_Wrap(eofData,eof,False)  ; time series coef

      eof_rot = eofunc_varimax_Wrap(eof,  1 )
      printVarSummary(eof_rot)

   The returned information might look like:
    Variable: eof_rot
    [snip]
    Dimensions and sizes:   [evn | 10] x [lat | 29] x [lon | 144]
    Coordinates:
                evn: [1..10]
                lat: [20..90]
                lon: [ 0..357.5]
    Number Of Attributes: 3
      pcvar_varimax :       ( 19.33363, 9.226682, 10.51604, 16.034, 6.851599
                            ,  6.71392, 10.22079, 3.260028, 4.5404, 4.042647 )
      variance_varimax :    ( 3738.327, 1784.06, 2033.369, 3100.31, 1324.817
                            , 1298.196, 1976.28, 630.3551, 877.9262, 781.6812 )

   Note that the second largest pcvar_varimax is the fourth value.
      eof_varimax_reorder ( eof_rot )    ; reorder the information
      printVarSummary(eof_rot)

    Variable: eof_rot
    [snip]
    Dimensions and sizes:   [evn | 10] x [lat | 29] x [lon | 144]
    Coordinates:
                evn: [1..10]
                lat: [20..90]
                lon: [ 0..357.5]

    Number Of Attributes: 3
      pcvar_varimax :       ( 19.33363, 16.03398, 10.51604, 10.22079, 9.226682
                            , 6.851599, 6.713923, 4.5404, 4.042647, 3.260028 )
      variance_varimax :    ( 3738.327, 3100.31, 2033.369, 1976.28, 1784.06
                            , 1324.817, 1298.196, 877.9262, 781.6812, 630.3551 )

   The result is that the returned array and all the attributes have been
   reordered into descending order.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

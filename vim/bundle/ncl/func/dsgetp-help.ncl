THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dsgetp.shtml
THE_TITLE:dsgetp
   NCL Home > Documentation > Functions > Interpolation

dsgetp

   Gets parameters for Dsgrid routines.

Prototype

        function dsgetp (
                pnam [1] : string
        )

        return_val [1] :  numeric

Arguments

   pnam

   The name of the parameter you want to retrieve.

Return value

   Returns a numeric type according to the parameters for for Dsgrid
   routines.

Description

   This procedure retrieves values for parameters for Dsgrid routines.

   The NCL language affords a convenient implementation of the parameter
   setting and retrieval functions.

See Also

   dssetp

Examples

   Example 1

begin
  gexp = dsgetp("exp")
  print(gexp)
end

Variable: gexp
Type: float
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     0.5



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

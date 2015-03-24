THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tounsigned.shtml
THE_TITLE:tounsigned
   NCL Home > Documentation > Functions > Type converters

tounsigned

   Converts any kind of 8/16/32/64 integers to its coresponding unsigned
   integers.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function tounsigned (
                input_val  : any kind of 8/16/32/64 integers.
        )

        return_val [dimsizes(input_val)] :  unsigned 8/16/32/64 integers.

Arguments

   input_val

   A variable of any kind of 8/16/32/64 integers.

Return value

   Returns coresponding 8/16/32/64 integers.

Description

   This function converts any kind of 8/16/32/64 integers to its
   coresponding unsigned integers. If there is any missing value, it will
   be converted as well.

See Also

   tosigned

Examples

   Example

uv = new((/2/), ushort)
uv = 65535H
v = tosigned(uv)
print(uv)

;print-out:
;Variable: uv
;Type: ushort
;...
;(0)     65535
;(1)     65535

print(v)

;print-out:
;Variable: v
;Type: short
;...
;(0)     -1
;(1)     -1

nuv = tounsigned(v)
print(nuv)

;print-out:
;Variable: nuv
;Type: ushort
;...
;(0)     65535
;(1)     65535


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

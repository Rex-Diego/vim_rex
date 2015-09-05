THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tosigned.shtml
THE_TITLE:tosigned
   NCL Home > Documentation > Functions > Type converters

tosigned

   Converts any kind of 8/16/32/64 integers to its coresponding signed
   integers.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function tosigned (
                input_val  : any kind of 8/16/32/64 integers.
        )

        return_val [dimsizes(input_val)] :  signed 8/16/32/64 integers.

Arguments

   input_val

   A variable of any kind of 8/16/32/64 integers.

Return value

   Returns coresponding 8/16/32/64 integers.

Description

   This function converts any kind of 8/16/32/64 integers to its
   coresponding signed integers. If there is any missing value, it will be
   converted as well.

See Also

   tounsigned

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

   Example

ui = new((/2/), uint)
;ui = 2147483647I
ui = 4294967285I
i = tosigned(ui)
print(ui)
print(i)

nui = tounsigned(i)
print(nui)

ul = new((/2/), ulong)
;ul = 2147483647L
ul = 4294967285L
l = tosigned(ul)
print(ul)
print(l)

nul = tounsigned(l)
print(nul)

ull = new((/2/), uint64)
ull = 9223372036854775807Q
;ull = 18446744073709551615Q
ull = 2 * ull + 1;
ll = tosigned(ull)
print(ull)
print(ll)

mull = tounsigned(ll)
print(mull)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

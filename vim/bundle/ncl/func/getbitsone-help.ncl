THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/getbitsone.shtml
THE_TITLE:getbitsone
   NCL Home > Documentation > Functions > Array manipulators

getbitsone

   Unpacks one-bit chunks from the input array.

Prototype

        function getbitsone (
                npack  : numeric   ; byte, int8, uint8, short, ushort, integer
        )

        return_val  :  typeof(npack)

Arguments

   npack

   A byte, int8, uint8, short, ushort, or integer array of any
   dimensionality. (The recognition of int8, uint8, and ushort types was
   added in NCL V6.0.0)

Description

   getbitsone unpacks one-bit chunks from the input array npack into the
   return array. The leftmost dimensions of the return array will be the
   same as the dimensions of npack, and there will be an additional
   rightmost dimension added, where if npack is of type
   byte/(u)int8/(u)short/integer, the size of the added dimension will be
   8/8/16/32.

See Also

   dim_gbits

Examples

   Example 1

   Assume x is a 2D array with dimensions nlat x mlon and of type byte.
   The following code snippet:
   xchunk = getbitsone (x)

   will return an array dimensioned nlat x mlon x 8. Users can now, for
   example, check to if bit 4 at some arbitrary latitude/longitude is "on"
   or "off".

   Example 2

   Assume cloud_mask is a 3D array of type byte and dimensioned nB(=6) x
   yCell(=2030) x xCell(=1354). The 8 bits associated with the first byte
   (i.e. (0,:,:)) can be unpacked via the following:
   cmBit  = getbitsone ( cloud_mask(0,:,:) )

  printVarSummary (cmBit)

   The print command yields:
Variable: cmBit
Type: byte
Total Size: 21988960 bytes
            21988960 values
Number of Dimensions: 3
Dimensions and sizes:   [2030] x [1354] x [8]
    .
    .
    .

   Use print to list the bit values at a particular location. For example,
   assume yCell=1000 and xCell=500:
   print( cmBit(1000,500,:))

   The print command yields:
Variable: cmBit (subsection)
Type: byte
Total Size: 8 bytes
            8 values
Number of Dimensions: 1
Dimensions and sizes:   [8]
Coordinates:
(0)     0
(1)     0
(2)     1
(3)     1
(4)     1
(5)     0
(6)     0
(7)     1


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

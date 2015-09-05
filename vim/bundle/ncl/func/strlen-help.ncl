THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/strlen.shtml
THE_TITLE:strlen
   NCL Home > Documentation > Functions > String manipulation

strlen

   Returns the length of a string variable.

Prototype

        function strlen (
                str  : string
        )

        return_val [dimsizes(str)] :  integer

Arguments

   str

   A variable of type string. It may have any dimensionality.

Return value

   Returns integer value(s) dimensioned the same as the input containing
   the corresponding length of each input string argument(s).

Description

   This function determines the length of each string in its input, and
   returns those lengths dimensioned the same as the input. Note that
   uninitialized strings, which are assigned a value equal to the default
   missing value for strings, result in the length of such strings being
   set to the value of NCL's default missing value for variables of type
   integer, and the _FillValue attribute is set for the return value.

See Also

   isstring

Examples

   Example 1

  aString = "Hello, World!"
  aStringLen = strlen(aString)
  print(aStringLen)

Variable: aStringLen
Type: integer
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     13

   Example 2

  theStrings = (/"Hello", "Guten Tag", "Buenos Dias", "Bonjour"/)
  stringLens = strlen(theStrings)
  print(stringLens)

Variable: stringLens
Type: integer
Total Size: 16 bytes
            4 values
Number of Dimensions: 1
Dimensions and sizes:   [4]
Coordinates:
(0)     5
(1)     9
(2)     11
(3)     7


   Example 3

  theStrings = (/(/"Hello", "Guten Tag", "Bonjour"/), (/"Goodbye", "Auf Wiederse
hen", "Au Revoir"/)/)
  stringLens = strlen(theStrings)
  print(stringLens)

Variable: stringLens
Type: integer
Total Size: 24 bytes
            6 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [3]
Coordinates:
(0,0)   5
(0,1)   9
(0,2)   7
(1,0)   7
(1,1)   15
(1,2)   9


   Example 4

  newStrings = new(3, string)
  print(newStrings)

Variable: newStrings
Type: string
Total Size: 12 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
Number Of Attributes: 1
  _FillValue :  missing
(0)     missing
(1)     missing
(2)     missing

  stringLens = strlen(newStrings)
  print(stringLens)


Variable: stringLens
Type: integer
Total Size: 12 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
Number of Attributes: 1
  _FillValue : -999
(0)     -999
(1)     -999
(2)     -999



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

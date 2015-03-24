THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/charactertostring.shtml
THE_TITLE:charactertostring
   NCL Home > Documentation > Functions > Type converters, String
   manipulation

charactertostring

   Coerces values of type character to values of type string.

Prototype

        function charactertostring (
                char_val  : character
        )

        return_val  :  string  [see below for details]

Arguments

   char_val

   A character variable of any dimensionality.

Return value

   For a single character, or a singly-dimensioned array of characters,
   the returned value is a single string. A NULL byte terminator is
   appended to the resultant string. For character array arguments having
   n dimensions where n is greater than one, the return value is an array
   of strings of dimension n-1. The dimension size of the array of strings
   for dimension m less than n is the same as the dimension size for
   dimension m of the input array of characters. If this sounds
   complicated, running the example below should help you understand this.

Description

   For a singly-dimensioned array of characters this function converts the
   characters in that array to a single string.

   For a multiply-dimensioned array of characters, this function produces
   an array of strings using the sequence of characters in the final
   dimension of the input array to create the strings. The example below
   should clarify how this works.

   In any conversion using charactertostring a NULL byte is appended to
   the resultant string or strings. This means that the functions
   charactertostring and stringtocharacter are not strictly inverse
   functions.

   The sizeof function does not return the length of a string. To get the
   length of a string you can do the following:
    len_of_str = sizeof(stringtocharacter(str)) - 1

   Decrementing by one in the above is necessary to account for the NULL
   terminating byte in the string.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   The function chartostring is identical to this function, and can be
   used if you don't want to use the full charactertostring name. This
   alias name is included just for people who don't like to type (or like
   the shorter names).

   How non-default missing values are handled in this particular
   conversion function is non-intuitive and perhaps not helpful. See
   Example 2.

See Also

   stringtocharacter, charactertofloat, charactertointeger,
   charactertoshort, charactertolong, charactertodouble

Examples

   Example 1

   Convert various character arrays to strings.
begin

;
;  Convert an individual character (an ASCII 'a') to a string.
;
  ci = integertocharacter(97)
  si = charactertostring(ci)
  print(si)

;
;  Print the length of the string si just created.  In this
;  case it will be just one byte, accounting for the single
;  input character.  You can obtain the length of this string
;  by converting it back to its individual characters and
;  using dimsizes.  You will need to
;  subtract one from the result to account for the NULL byte
;  that has been appended to the string.  The dimsizes
;  function is used since the NCL  sizeof function will
;  not return a string length.  It is necessary to convert the string
;  back to its individual characters since an NCL string is a single object.
;  Notice from this that stringtocharacter
;  and charactertostring are not strictly inverse functions.
;
  szsi = dimsizes(stringtocharacter(si)) - 1
  print(szsi)

;
;  Define an array of characters.
;
  cc = new((/3,5/),character)
  cc(0,0) = integertocharacter(65)  ; 'A'
  cc(0,1) = integertocharacter(66)  ; 'B'
  cc(0,2) = integertocharacter(67)  ; 'C'
  cc(0,3) = integertocharacter(68)  ; 'D'
  cc(0,4) = integertocharacter(69)  ; 'E'
  cc(1,0) = integertocharacter(70)  ; 'F'
  cc(1,1) = integertocharacter(71)  ; 'G'
  cc(1,2) = integertocharacter(72)  ; 'H'
  cc(1,3) = integertocharacter(73)  ; 'I'
  cc(1,4) = integertocharacter(74)  ; 'J'
  cc(2,0) = integertocharacter(75)  ; 'K'
  cc(2,1) = integertocharacter(76)  ; 'L'
  cc(2,2) = integertocharacter(77)  ; 'M'
  cc(2,3) = integertocharacter(78)  ; 'N'
  cc(2,4) = integertocharacter(79)  ; 'O'
;
;  Print the array of characters.
;
  print(cc)
;
;  Convert to strings.  The returned array will have
;  three strings with each string being of length
;  five (actually six if you count the terminating NULL
;  byte).
;
  ss = charactertostring(cc)
;
;  Print out the string array.
;
  print(ss)

;
;  A larger array.
;
  cl = new((/2,3,5/),character)
  cl(0,0,0) = integertocharacter( 65)  ; 'A'
  cl(0,0,1) = integertocharacter( 66)  ; 'B'
  cl(0,0,2) = integertocharacter( 67)  ; 'C'
  cl(0,0,3) = integertocharacter( 68)  ; 'D'
  cl(0,0,4) = integertocharacter( 69)  ; 'E'
  cl(0,1,0) = integertocharacter( 70)  ; 'F'
  cl(0,1,1) = integertocharacter( 71)  ; 'G'
  cl(0,1,2) = integertocharacter( 72)  ; 'H'
  cl(0,1,3) = integertocharacter( 73)  ; 'I'
  cl(0,1,4) = integertocharacter( 74)  ; 'J'
  cl(0,2,0) = integertocharacter( 75)  ; 'K'
  cl(0,2,1) = integertocharacter( 76)  ; 'L'
  cl(0,2,2) = integertocharacter( 77)  ; 'M'
  cl(0,2,3) = integertocharacter( 78)  ; 'N'
  cl(0,2,4) = integertocharacter( 79)  ; 'O'
  cl(1,0,0) = integertocharacter( 97)  ; 'a'
  cl(1,0,1) = integertocharacter( 98)  ; 'b'
  cl(1,0,2) = integertocharacter( 99)  ; 'c'
  cl(1,0,3) = integertocharacter(100)  ; 'd'
  cl(1,0,4) = integertocharacter(101)  ; 'e'
  cl(1,1,0) = integertocharacter(102)  ; 'f'
  cl(1,1,1) = integertocharacter(103)  ; 'g'
  cl(1,1,2) = integertocharacter(104)  ; 'h'
  cl(1,1,3) = integertocharacter(105)  ; 'i'
  cl(1,1,4) = integertocharacter(106)  ; 'j'
  cl(1,2,0) = integertocharacter(107)  ; 'k'
  cl(1,2,1) = integertocharacter(108)  ; 'l'
  cl(1,2,2) = integertocharacter(109)  ; 'm'
  cl(1,2,3) = integertocharacter(110)  ; 'n'
  cl(1,2,4) = integertocharacter(111)  ; 'o'
;
;  Print the array of characters.
;
  print(cl)
;
;  Convert to strings.  The returned array will have
;  six (2 x 3) strings with each string being of length
;  five (six if you include the terminating NULL byte that
;  is appended to each string).
;
  sl = charactertostring(cl)
;
;  Print out the string array.
;
  print(sl)

end

   Example 2

   Shows how some missing values are handled.

begin
  a = new(3,character)
  a = (/integertocharacter(66),integertocharacter(67),integertocharacter(65)/)
  a@_FillValue = integertocharacter(65)
  b = charactertostring(a)
  print (b)
  delete(a)
  delete(b)
;
  b = new(2,string,"A")
  b = (/"BCA","AA"/)
  print (b)
  delete(b)
;
  a = new(3,character)
  a = (/integertocharacter(66),integertocharacter(67),integertocharacter(65)/)
  a@_FillValue = integertocharacter(65)
  b = new(1,string)
  b = charactertostring(a)
  print (b)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

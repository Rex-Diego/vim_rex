THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/stringtochar.shtml
THE_TITLE:stringtochar
   NCL Home > Documentation > Functions > Type converters, String
   manipulation

stringtochar

   Coerces values of type string to values of type character.

Prototype

        function stringtochar (
                string_val  : string
        )

        return_val  :  character  [see below for details]

Arguments

   string_val

   A string variable of any dimensionality.

Return value

   Returns an array of characters. For details, refer to the description
   section below.

Description

   For a single string, this function returns an array of characters that
   make up the string plus a NULL character. Thus the length of the
   returned array of characters will be one plus the number of characters
   in the string in order to accommodate the NULL byte that terminates
   every NCL string.

   For a singly-dimensioned array of strings, stringtochar finds the
   string of maximum length in the array of strings and returns a
   two-dimensional array. The dimension size of the first dimension of the
   returned array equals the number of strings in the input array, and the
   dimension size of the second dimension will be one greater than the
   length of the longest string in the array of strings (the increment of
   one being to accommodate the terminating NULL byte for strings).

   For arrays of strings with dimensionality greater than one,
   stringtochar returns an array of characters of dimensionality one
   greater than the dimensionality of the array of strings. The final
   dimension of the array of characters will have dimension size one
   greater than the length of the longest string in the array of strings
   (the increment of one being to accommodate the terminating NULL byte
   for strings).

   See the example for clarification.

   The sizeof function does not return the length of a string. To get the
   length of a string you can do the following:
    len_of_str = sizeof(stringtochar(str)) - 1

   Decrementing by one in the above is necessary to account for the NULL
   terminating byte in the string.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   This function is an alias for the function stringtocharacter. It is
   identical to that function and is included just for people who don't
   like to type (or like the shorter names).

   Unless you go way out of your way, the missing value for the target
   variable will be the default missing value for a character (0x00 hex).
   String missing values in the original variable will result in character
   missing values in the target.

   Important notes:

     * When converting a string to character array using stringtochar,
       there is an ending NULL character (appears as '\0' in C program
       language) at end of the array.
     * When converting a string to character array using tochar, there is
       no ending NULL character at the end of the array.
     * The NCL developers generally recommend using tochar to convert
       strings to character arrays.

See Also

   tochar, charactertostring, stringtofloat, stringtointeger,
   stringtoshort, stringtolong, stringtodouble

Examples

   Example 1

   Convert various string variables to character arrays.

begin

;
;  A single string.
;
  a = "ABCDE"
  b = stringtochar(a)
  print(b)

;
;  Find a substring of a.
;
  print(b(1:3))

;
;  Print the length of the string in a (have to use the array of characters).
;
  print("length of string = " + (sizeof(b)-1) )

;
;  A singly-dimensioned array of strings.
;
  c = (/ "A", "AB", "ABC", "abc", "ab", "a" /)
  d = stringtochar(c)
  print(d)

;
;  A multiply-dimensioned array of strings.
;
  e = new((/2,3/),string)
  e(0,0) = "A"
  e(0,1) = "AB"
  e(0,2) = "ABC"
  e(1,0) = "d"
  e(1,1) = "de"
  e(1,2) = "defg"
  f = stringtochar(e)
  print(f)

end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

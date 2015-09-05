THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_fields_count.shtml
THE_TITLE:str_fields_count
   NCL Home > Documentation > Functions > String manipulation

str_fields_count

   Counts the number of fields separated by the given delimiters in an
   array of strings.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function str_fields_count (
                string_val    : string,
                delimiter [1] : string
        )

        return_val [dimsizes(string_val)] :  integer

Arguments

   string_val

   A string array of any dimensionality.
   delimiter

   A string containing the delimiters that separate each field, such as
   TABs, spaces, colons, semicolons, commas, etc. It can be a combination
   of delimiters.

Description

   For each string in the input array, this function counts the number of
   fields separated by the given delimiter(s). The C-based function strtok
   is used to get the number of fields in a string.

   If one or more delimiters appear side-by-side in a string, then they
   are treated as if they were just one delimiter.

   TABs and spaces are recognized as valid delimiters. If your fields are
   separated by a combination of TABs and spaces, then use a delimiter
   string with a tab and a space to correctly count the fields.

   There are some special cases to be aware of:
     * Empty ("") input strings will return 0 for the field count.
     * An empty delimiter string will return 1 for the field count.
     * Missing input strings or delimiter will return a missing value for
       the field count.

See Also

   str_get_cols, str_get_field

Examples

   Example 1

 a = "This;is.a:test:of=the/string\tokenizer-function."

 delim = "\/:;=-"
 fa = str_fields_count(a, delim)
 print(fa)                            ; fa = 8

 b = "I am a string."
 fb = str_fields_count(b, " ")
 print(fb)                            ; fb = 4

 fc = str_fields_count(b, ",")
 print(fc)                            ; fc = 1

 strs = (/"ID,LAT,LON,ELEV,SOURCE,FLAGS",\
         "4,-27.75,152.45,-999,ADAM,0", \
         "5,-27.03,152.02,-999,MARY,0",\
         "6,-26.76,148.82,-999,DAVE,1", \
         "7,-26.58,148.77,-999,RICK,0",\
         "8,-26.48,148.68,1000,DENNIS,0", \
         "9,-26.30,148.52,900,TIM,0",\
         "10,-26.25,148.41,-999,SPONGEBOB,0"/)

 fs = str_fields_count(strs, ",")
 print(fs)                            ; fs = (/6,6,6,6,6,6,6,6/)

 d = ""
 fd = str_fields_count(d, ",")
 print(fd)                            ; fd = 0

 g = new((/2,2/), string)
 fg = str_fields_count(g, ",")
 print(fg)                            ; fg = (/(/-999,-999/), (/-999,-999/)/)


   Example 2

   This array of strings has fields separated by varying amounts of
   spaces. Any number of consecutive spaces in the string will be
   considered a single delimiter:
 strs = (/"ID    LAT    LON    ELEV     SOURCE   FLAGS",  \
          " 4  -27.75  152.45  -999       ADAM     0  ",    \
          " 5  -27.03  152.02  -999       MARY     0  ",    \
          " 6  -26.76  148.82  -999       DAVE     1  ",    \
          " 7  -26.58  148.77  -999       RICK     0  ",    \
          " 8  -26.48  148.68  1000     DENNIS     0  ",    \
          " 9  -26.30  148.52   900        TIM     0  ",    \
          "10  -26.25  148.41  -999  SPONGEBOB     0  " /)

 fs = str_fields_count(strs, " ")
 print(fs)                           ; fs = (/6,6,6,6,6,6,6,6/)

   Example 3

   An example with consecutive delimiters in a string:
 str = "This::is,a string  :with,,multiple.delimiters."
 fs  = str_fields_count(str, ".:, ")
 print(fs)                           ; fs = 7


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

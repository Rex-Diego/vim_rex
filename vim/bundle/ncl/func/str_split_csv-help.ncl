THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/str_split_csv.shtml
THE_TITLE:str_split_csv
   NCL Home > Documentation > Functions > String manipulation

str_split_csv

   Splits strings into an array of strings using the given delimiter.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function str_split_csv (
                string_val [*] : string,
                delimiter  [1] : string,
                option     [1] : integer
        )

        return_val [*][*] :  string

Arguments

   string_val

   The input strings to split.
   delimiter

   The delimiter to separate the strings (usually a comma).
   option

   An option on how to treat double or single quotes. There are four
   options:

   0 - ignores any delimiter inside quotes (single or double)

   1 - ignores any delimiter inside single quotes

   2 - ignores any delimiter inside double quotes

   3 - all delimiters are treated as separators

Return value

   A 2D array of strings, dimensioned # lines x # fields. The number of
   lines will be the same as the number of lines in the input array.

Description

   Note: In NCL V6.2.0 a bug was fixed in which delimiters inside of
   quotes were not handled correctly.

   This function splits strings based on a delimiter. If there are
   consecutive delimiters in a string, then a missing value is inserted.
   If you want consecutive delimiters ignored, then use str_split instead.

See Also

   str_split, str_concat

Examples

   Example 1

   Split a string according to a single space:

 str = "NCL has many features common to modern programming languages, including
types, variables, and more."
 strs = str_split_csv(str, ",", 0)
 print("'" + strs + "'")

   Output will be:

(0,0)   'NCL has many features common to modern programming languages'
(0,1)   ' including types'
(0,2)   ' variables'
(0,3)   ' and more.'

   Example 2

   Note that missing values are inserted between consecutive delimiters
   (in this case, comma). Also note that there are single quotes in the
   second string; opt=0 told the function to ignore the comma inside the
   quote. (The double quotes surrounding the actual strings are just NCL
   syntax characters for containg a string, so they are not "seen" by the
   parsing algorithm):
 str = (/"a0,a1,,,,a5,", \
         "c0,'c,1',,,c4,," /)

 opt = 0
 new_strs = str_split_csv(str, ",", opt)

 print(new_strs)

   Output will be:

(0,0)   a0
(0,1)   a1
(0,2)   missing
(0,3)   missing
(0,4)   missing
(0,5)   a5
(0,6)   missing
(1,0)   c0
(1,1)   'c,1'
(1,2)   missing
(1,3)   missing
(1,4)   c4
(1,5)   missing
(1,6)   missing

   Example 3

   In this example, opt=3 tells the function to treat the comma inside the
   quote as an actual delimiter:

 str = (/"a0,a1,,,,a5,", \
        "c0,'c,1',,,c4,," /)

 opt = 3
 new_strs = str_split_csv(str, ",", opt)

 print(new_strs)

   Output will be:
(0,0)   a0
(0,1)   a1
(0,2)   missing
(0,3)   missing
(0,4)   missing
(0,5)   a5
(0,6)   missing
(1,0)   c0
(1,1)   'c
(1,2)   1'
(1,3)   missing
(1,4)   missing
(1,5)   c4
(1,6)   missing

   Example 4

   Assume you have a CSV file (taken from a file on the budburst.org
   website) called "myfile.csv" with the following lines:
Obs ID,Obs Date,Species,Common Name,Phenophase ID,Phenophase Name,Obs Comment,St
ation ID,Station City,Station State,Station Zip,Elevation_m,Site Comment
11697,2011-02-19,Tradescantia ohiensis,Spiderwort,3,First Flower,,4377,Rockledge
,FL,32955,16,Not irrigated or fertilized directly
11701,2011-02-19,Acer rubrum,Red maple,3,First Flower,,4460,Knoxville,TN,37919,,
"large areas of lawn/field, but also many buildings, paved areas"
11702,2011-02-15,Forsythia xintermedia,Forsythia,3,First Flower,"Prior ""observa
tion"" of Feb 15, 2010 was a typo",4454,Knoxville,TN, ,,,
11715,2011-03-01,,American Arborvitae,11,50% Color,This did not lose it's leaves
 during the winter.,4480,Bloomington,IN,,,,
14012,2011-11-07,Rosa woodsii,Woods' rose,47,50% Color,,4752,Loveland,CO,80537,5
200,"near beginning of trail, mixture of grassland and shrubland"

   The following (very basic) script will read it in and print the various
   fields. This file contains a mix of double and single quotes, and
   commas inside the quotes, so you need to use opt=2:
  lines = asciiread("myfile.csv",-1,"string")
  split_lines = str_split_csv(lines,",",2)

  nlines  = dimsizes(split_lines(:,0))
  nfields = dimsizes(split_lines(0,:))

  header = split_lines(0,:)
  do nl=1,nlines-1
    print("==================================================")
    do nf=0,nfields-1
      print(header(nf) + " : " + str_join(split_lines(nl,nf),", "))
    end do
  end do

   The output will be:
  (0) ==================================================
  (0) Obs ID : 11697
  (0) Obs Date : 2011-02-19
  (0) Species : Tradescantia ohiensis
  (0) Common Name : Spiderwort
  (0) Phenophase ID : 3
  (0) Phenophase Name : First Flower
  (0) Obs Comment : missing
  (0) Station ID : 4377
  (0) Station City : Rockledge
  (0) Station State : FL
  (0) Station Zip : 32955
  (0) Elevation_m : 16
  (0) Site Comment : Not irrigated or fertilized directly
  (0) ==================================================
  (0) Obs ID : 11701
  (0) Obs Date : 2011-02-19
  (0) Species : Acer rubrum
  (0) Common Name : Red maple
  (0) Phenophase ID : 3
  (0) Phenophase Name : First Flower
  (0) Obs Comment : missing
  (0) Station ID : 4460
  (0) Station City : Knoxville
  (0) Station State : TN
  (0) Station Zip : 37919
  (0) Elevation_m : missing
  (0) Site Comment : "large areas of lawn/field, but also many buildings, paved
areas"
  (0) ==================================================
  (0) Obs ID : 11702
  (0) Obs Date : 2011-02-15
  (0) Species : Forsythia xintermedia
  (0) Common Name : Forsythia
  (0) Phenophase ID : 3
  (0) Phenophase Name : First Flower
  (0) Obs Comment : "Prior ""observation"" of Feb 15, 2010 was a typo"
  (0) Station ID : 4454
  (0) Station City : Knoxville
  (0) Station State : TN
  (0) Station Zip :
  (0) Elevation_m : missing
  (0) Site Comment : missing
  (0) ==================================================
  (0) Obs ID : 11715
  (0) Obs Date : 2011-03-01
  (0) Species : missing
  (0) Common Name : American Arborvitae
  (0) Phenophase ID : 11
  (0) Phenophase Name : 50% Color
  (0) Obs Comment : This did not lose it's leaves during the winter.
  (0) Station ID : 4480
  (0) Station City : Bloomington
  (0) Station State : IN
  (0) Station Zip : missing
  (0) Elevation_m : missing
  (0) Site Comment : missing
  (0) ==================================================
  (0) Obs ID : 14012
  (0) Obs Date : 2011-11-07
  (0) Species : Rosa woodsii
  (0) Common Name : Woods' rose
  (0) Phenophase ID : 47
  (0) Phenophase Name : 50% Color
  (0) Obs Comment : missing
  (0) Station ID : 4752
  (0) Station City : Loveland
  (0) Station State : CO
  (0) Station Zip : 80537
  (0) Elevation_m : 5200
  (0) Site Comment : "near beginning of trail, mixture of grassland and shrublan
d"


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isint64.shtml
THE_TITLE:isint64
   NCL Home > Documentation > Functions > Variable query

isint64

   Returns True if input is of type int64.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function isint64 (
                arg
        )

        return_val [1] :  logical

Arguments

   arg

   A variable of any type and dimensionality.

Description

   If the input is of type int64, then isint64 will return a single scalar
   value of True, and False otherwise. If arg is not a valid variable, an
   error message will be printed.

See Also

   Logical functions:
   isbyte, ischar, isdouble, isenumeric, isfile, isfloat, isgraphic,
   isint, isint64, isinteger, islogical, islong, isnumeric, isshort,
   issnumeric, isstring, isubyte, isuint, isuint64, isulong, isushort,
   isunsigned

   Conversion functions:
   tobyte, tochar, todouble, tofloat, toint, toint64, tointeger, tolong,
   toshort, tosigned, tostring, toubyte, touint, touint64, toulong,
   tounsigned, toushort

   Other useful functions:
   typeof, sizeof, ismissing, default_fillvalue, set_default_fillvalue

Examples

   The examples below show various ways you can create an NCL variable and
   how to use the isxxxx functions to test their types.

   The "numeric, enumeric, and snumeric" types are special and cannot be
   created.
     * numeric - includes all variables of type byte, short, integer,
       long, float, and double
     * enumeric - includes all variables of type ubyte, ushort, uint,
       ulong, int64, uint64
     * snumeric - includes all numeric and enumeric types

   Example 1a

   You can create a variable by assigning a value to it. The example below
   causes NCL to use automatic type assignment:

  i       = 38                       ; integer
  xscalar = 10000.                   ; float
  x1d     = (/1.,2.,3./)             ; float
  str     = "This is a string"       ; string
  IS_DONE = False                    ; logical

;---These are all False
  print(isbyte(i))
  print(isunsigned(i))
  print(ischar(str))
  print(isnumeric(str))
  print(islogical(IS_DONE))

;---These are all True
  print(isfloat(xscalar))
  print(isfloat(x1d))
  print(issigned(i))
  print(isstring(str))
  print(isnumeric(i))

   Example 1b

   You can force a variable to be a specific type by using a literal
   character:

  b   = 10b                          ; byte
  ub  = 100B                         ; unsigned byte
  l1d = (/10,100,10000l/)            ; long
  L1d = (/10000,100000L/)            ; ulong
  i64 = 4611686018427387904q         ; int64
  ui64 = 9223372036854775808Q        ; uint64

;---These are all True
  print(isbyte(b))
  print(isubyte(ub))
  print(isulong(L1d))
  print(isenumeric(ub))
  print(issnumeric(ub))
  print(isint64(i64))

;---These are all False
  print(isunsigned(b))
  print(ischar(b))
  print(isnumeric(ub))
  print(isint64(ui64))

   Example 1c

   You can use the special new command to create a variable without having
   to assign values:

  b   = new(1,byte)                      ; scalar byte
  s   = new(1,string)                    ; single string
  d   = new(10,double,"No_FillValue")    ; array of doubles

  ntim =  10
  nlat =  64
  nlon = 128
  x3d  = new((/ntim,nlat,nlon/),double)  ; 3D array of doubles

;---These are all False
  print(isuint(b))
  print(ischar(s))
  print(isfloat(d))

;---These are all True
  print(isnumeric(x3d))
  print(isdouble(x3d))

   Example 2

   Every print statement below should print True:
  b  = new(1,byte)
  c  = new(1,character)
  d  = 10000.d                 ; The "d" at the end forces a double variable
  fl = 1.0
  fi  = addfile("testfile.nc","c")
  g  = new(1,graphic)
  i  = 20
  is_unlim = (/True,False,False/)
  l2 = new(1,long)
  sh = new(1,short)
  st = "This is a string"
  i64 = 50000q   ; int64

;---Unsigned types
  ub = 20B       ; ubyte
  us = 50H       ; ushort
  ui = 500J      ; uint
  ul = 5000L     ; ulong
  ui64 = 500000Q ; uint64

  print(isbyte(b))
  print(ischar(c))
  print(isdouble(d))
  print(isfloat(fl))
  print(isfile(fi))
  print(isgraphic(g))
  print(isinteger(i))
  print(islogical(is_unlim))
  print(islong(l2))
  print(isshort(sh))
  print(isstring(st))
  print(isint64(i64))
  print(isuint64(ui64))
  print(isulong(ul))
  print(isuint(ui))
  print(isushort(us))

  print(isnumeric(b))
  print(isnumeric(sh))
  print(isnumeric(i))
  print(isnumeric(l2))
  print(isnumeric(fl))
  print(isnumeric(d))
  print(isenumeric(us))
  print(isenumeric(ui))
  print(isenumeric(ul))
  print(isenumeric(i64))
  print(isenumeric(ui64))
  print(issnumeric(us))
  print(issnumeric(ui))
  print(issnumeric(ul))
  print(issnumeric(i64))
  print(issnumeric(ui64))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

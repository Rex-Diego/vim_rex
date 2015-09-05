THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlGetNamedColorIndex.shtml
THE_TITLE:NhlGetNamedColorIndex
   NCL Home > Documentation > Functions > Color routines

NhlGetNamedColorIndex

   Returns color map indexes that match the given color names in the color
   maps of the given workstations.

Prototype

        function NhlGetNamedColorIndex (
                wks         : graphic,
                color_name  : string
        )

        return_val [dimsizes(wks)][dimsizes(color_name)] :  integer

Arguments

   wks

   An array of any dimensionality of NCL Workstation identifiers. The
   identifiers are ones returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   color_name

   An array of any dimensionality of named colors from the
   $NCARG_ROOT/lib/ncarg/database/rgb.txt file.

Return value

   The array returned will be dimensioned nwks x ncm, where nwks
   represents the dimensions of wks, and ncm represents the dimensions of
   color_name. If only one workstation is given, then the dimensions of
   the output will be equal to the dimensions of color_name.

Description

   The NhlGetNamedColorIndex function looks up the given color names in
   the color maps of the given workstations and returns an integer array
   of color indexes for each workstation id that represents the closest
   match to each color. If a bogus color name is given, then the color
   index returned will be negative.

   Note that you can not input "foreground" and "background" to this
   function, as they are not considered named colors. These two are just
   special keywords that are substitutes for color indices 1 and 0
   respectively.

See Also

   NhlFreeColor, NhlSetColor, NhlNewColor, NhlIsAllocatedColor,
   NhlPalGetDefined, namedcolor2rgb, span_named_colors

Examples

   Example 1

   If you have the following NCL script:
begin
  wks = create "workstation" ncgmWorkstationClass defaultapp
    "wkColorMap" : (/"white","black","red","green","blue","yellow",\
                     "cyan","magenta"/)
  end create

  i = NhlGetNamedColorIndex(wks,(/"red","yellow","blue","green",\
                                   "cyan","magenta"/))
  j = NhlGetNamedColorIndex(wks,(/"gray","brown"/))
  print(i)
  print(j)
end

   then i will be equal to (/2,5,4,3,6,7/) and j will be equal to (/0,2/).
   There's no gray or brown defined in the above color map, so when the
   color map is searched for the closest match to gray and brown, it comes
   up with white and red, which are color indexes 0 and 2.

   Example 2

   If you have the following NCL script, where the NCGM workstation uses
   the default color map, and the PS workstation uses the temp1 color map:
begin
  ncgm = create "workstation" ncgmWorkstationClass defaultapp
  end create

  ps = create "workstation" psWorkstationClass defaultapp
    "wkColorMap" : "temp1"
  end create

  i = NhlGetNamedColorIndex((/ncgm,ps/),(/"red","yellow","blue","green",\
                                   "cyan","magenta"/))
  print(i)
end

   then i will be equal to (/(/2,5,4,3,6,7/),(/62,38,16,31,24,6/)/).


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

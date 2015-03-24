THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlIsAllocatedColor.shtml
THE_TITLE:NhlIsAllocatedColor
   NCL Home > Documentation > Functions > Color routines

NhlIsAllocatedColor

   Queries a list of workstations to determine whether or not the given
   color indexes have been allocated.

Prototype

        function NhlIsAllocatedColor (
                workstations [*] : graphic,
                color_index  [*] : integer
        )

        return_val [dimsizes(workstations)][dimsizes(color_index)] :  logical

Arguments

   workstations

   An array of NCL Workstation identifiers. The identifiers are ones
   returned either from calling gsn_open_wks or calling create to create a
   Workstation object.

   color_index

   An array of one or more color indexes. The valid range is 0-255.

Return value

   The return array is dimensioned nwks x nci , where nwks is the length
   of workstations, and nci is the length of the color_index.

Description

   Each workstation in workstations is queried to see whether each of the
   elements of color_index is an allocated color or not. If an element of
   color_index is a missing value, then the corresponding output value is
   a missing value.

See Also

   NhlFreeColor, NhlSetColor, NhlNewColor, NhlGetNamedColorIndex

Examples

   Example 1

   In the example below, two workstations are created with different
   colormaps, so you can see the effect of NhlIsAllocatedColor. The first
   (default) colormap has 32 entries, and the second (rainbow) colormap
   has 190 entries.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  type = "x11"
  wks1 = gsn_open_wks(type,"example1")     ; Open a workstation with the
                                           ; default color map.
  type@wkColorMap = "rainbow"
  wks2 = gsn_open_wks(type,"example2")     ; Open a workstation with a
                                           ; different color map.
  frame(wks1)
  frame(wks2)

  is_color = NhlIsAllocatedColor((/wks1,wks2/),(/5,31,32,100,189,190,200/))

  do i=0,dimsizes(indexes)-1
    print("color index " + indexes(i) + ", wks1 : " + is_color(0,i) + " wks2 : "
 + is_color(1,i))
  end do
end

   The output values should be:
(0)     color index 5, wks1 : True wks2 : True
(0)     color index 31, wks1 : True wks2 : True
(0)     color index 32, wks1 : False wks2 : True
(0)     color index 100, wks1 : False wks2 : True
(0)     color index 189, wks1 : False wks2 : True
(0)     color index 190, wks1 : False wks2 : False
(0)     color index 200, wks1 : False wks2 : False


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

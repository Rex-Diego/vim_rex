THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_table.shtml
THE_TITLE:gsn_table
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_table

   Draws a table with text.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_table (
                wks      : graphic,
                dims [2] : integer,
                x    [2] : numeric,
                y    [2] : numeric,
                text     : string,
                res  [1] : logical
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   dims

   An integer array with 2 elements specifying the number of rows and
   columns for the table.
   x
   y

   Numeric arrays of two elements each, specifying the beginning and
   ending X and Y locations of the table in NDC coordinates.
   text

   An array of strings of dimensions dims(0) x dims(1).
   res

   A variable containing an optional list of resources to apply to the
   table, attached as attributes. Set to True if you want the attached
   attributes to be applied, and False if you either don't have any
   resources to set, or you don't want the resources applied.

Description

   This procedure draws a table with dims(0) rows and dims(1) columns. The
   values (x(0),y(0)) specify the NDC location of the lower left corner of
   the table, and (x(1),y(1)) the upper right corner of the table.

   Additionally, if text contains text strings, they will be put in the
   center of each cell of the box (by default), starting from
   top-to-bottom, left-to-right.

   If any tx resources are set, they will be applied to the text strings,
   if any. You can set resources for each text string individually by
   turning the resource value into an array of the same size as your text
   array. For example, if you have a 3 x 2 table and you want to apply a
   different justification to each of the six strings, you would use:

  res@txJust = (/(/"CenterCenter","CenterCenter"/), \
                 (/"CenterLeft","CenterLeft"/), \
                 (/"BottomCenter","BottomCenter"/)/)

   If any gsLine resources are set, like gsLineThicknessF or gsLineColor,
   they will be applied to the table grid lines.

   If any gsFill resources are set, like gsFillColor or gsFillIndex, they
   will be applied to the fill area for each cell. Again, like with the
   text resources above, you can specify a dims(0) x dims(1) array of
   values, if you want to apply a different resource value for each table
   cell.

See Also

   gsn_polygon_ndc, gsn_polyline_ndc, gsn_text_ndc, drawNDCGrid

Examples

   For more examples, see tables application page.

   Example 1

   Run the script below for a simple table with 4 rows and 3 columns:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  ncr = (/4,3/)     ; 4 rows, 3 columns

  wks = gsn_open_wks("ps","table")

  res = True      ; No resources desired.
;
; Array for text strings.  Must be dimensioned 4 x 3.
;
  text = (/ (/"Index 1", "Index 2", "Index 3"/), \
            (/"R2 C1",   "R2 C2",   "R2 C3"/), \
            (/"R3 C1",   "R3 C2",   "R3 C3"/), \
            (/"R4 C1",   "R4 C2",   "R4 C3"/) /)

  x = (/0.10,0.90/)         ; Start and end X
  y = (/0.005,0.995/)       ; Start and end Y

  gsn_table(wks,ncr,x,y,text,res)
  frame(wks)      ; Advance the frame.
end

   Example 2

   To change the cell fill color and the justification of the text in each
   cell, set the gsFillColor and txJust resources:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  ncr = (/4,3/)     ; 4 rows, 3 columns

  wks = gsn_open_wks("ps","table")

  res = True         ; Resources desired.
;
; Array for text strings.  Must be dimensioned 4 x 3.
;
  text = (/ (/"Index 1",  "Index 2",   "Index 3" /), \
            (/" LEFT1",   "CENTER12",  "RIGHT123 "/), \
            (/" LEFT12",  "CENTER123", "RIGHT12 " /), \
            (/" LEFT123", "CENTER1",   "RIGHT1 "  /) /)

  x = (/0.15,0.85/)         ; Start and end X
  y = (/0.20,0.80/)         ; Start and end Y

  res@txFontHeightF = 0.025       ; Font height

  res@txJust = (/ (/"CenterCenter","CenterCenter","CenterCenter"/), \
                  (/"CenterLeft",  "CenterCenter","CenterRight"/),  \
                  (/"CenterLeft",  "CenterCenter","CenterRight"/),  \
                  (/"CenterLeft",  "CenterCenter","CenterRight"/) /)

  res@gsFillColor = (/ \
          (/"Gray",      "Gray",      "Gray"      /), \
          (/"HotPink",   "HotPink",   "HotPink"   /), \
          (/"PaleGreen", "PaleGreen", "PaleGreen" /), \
          (/"Orange",    "Orange",    "Orange"    /) /)

  gsn_table(wks,ncr,x,y,text,res)
  frame(wks)      ; Advance the frame.
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

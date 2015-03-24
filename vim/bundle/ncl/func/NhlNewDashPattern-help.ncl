THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlNewDashPattern.shtml
THE_TITLE:NhlNewDashPattern
   NCL Home > Documentation > Functions > Graphics routines

NhlNewDashPattern

   Adds new dash patterns to the existing table of dash patterns.

Prototype

        function NhlNewDashPattern (
                wks           [*] : graphic,
                dash_patterns [*] : string
        )

        return_val  :  integer

Arguments

   wks

   An array of NCL Workstation identifiers. The identifiers are ones
   returned either from calling gsn_open_wks or calling create to create a
   Workstation object.

   dash_patterns

   A list of strings indicating the dash patterns to create.

Return value

   If nwks is the length of wks and npatterns is the length of
   dash_patterns, then the array returned will be dimensioned nwks x
   npatterns if there is more than one workstation. Otherwise, it will be
   an array of length npatterns.

Description

   Given a list of workstation objects and a list of strings that
   represent dash patterns, this function adds the given dashlines to the
   current dash pattern table, and returns a list of unique indexes that
   represent the locations of the new patterns in the table.

   You can use these new patterns in any resource that allows you to set a
   dash pattern index.

   The dash patterns strings can be any length, and should be generated
   using a combination of "$" and "_" characters. The "$" represents a
   pen-down, and the "_" represents a pen-up.

   The current dash pattern table is made up of the following string
   combinations. Note that the first pattern is a solid line:

   dash index                      dash pattern
   0          "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
   1          "$$$$__$$$$__$$$$__$$$$__$$$$__$$$$__$$$$__$$$$__"
   2          "$__$__$__$__$__$__$__$__$__$__$__$__$__$__$__$__"
   3          "$$$$__$__$$$$__$__$$$$__$__$$$$__$__$$$$__$__"
   4          "$$$$__$_$__$$$$__$_$__$$$$__$_$__$$$$__$_$__"
   5          "$$_$$_$$_$$_$$_$$_$$_$$_$$_$$_$$_$$_$$_$$_$$_$$_"
   6          "$$$_$$$_$$$_$$$_$$$_$$$_$$$_$$$_$$$_$$$_$$$_$$$_"
   7          "$_$$_$_$$_$_$$_$_$$_$_$$_$_$$_$_$$_$_$$_$_$$_$_$$_"
   8          "$_$$$_$_$$$_$_$$$_$_$$$_$_$$$_$_$$$_$_$$$_$_$$$_"
   9          "$$_$$$$_$$_$$$$_$$_$$$$_$$_$$$$_$$_$$$$_$$_$$$$_"
   10         "$$$$_$$_$_$$_$$$$_$$_$_$$_$$$$_$$_$_$$_$$$$_$$_$_$$_"
   11         "$$__$$__$$__$$__$$__$$__$$__$$__$$__$$__$$__$$__"
   12         "$$$$$$__$$$$$$__$$$$$$__$$$$$$__$$$$$$__$$$$$$__"
   13         "$$$_$$$__$$$_$$$__$$$_$$$__$$$_$$$__$$$_$$$__"
   14         "$$___$$___$$___$$___$$___$$___$$___$$___$$___$$___"
   15         "$_$___$_$___$_$___$_$___$_$___$_$___$_$___$_$___"
   16         "$$$$$_____$$$$$_____$$$$$_____$$$$$_____$$$$$_____"

See Also

   NhlNewMarker

Examples

   Example 1

   This example creates three new dash patterns and uses them in an XY
   plot:

load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
;
; Generate some dummy data.
;
  PI   = 3.14159
  PI2  = 2 * PI
  x = ispan(10,500,5)

  npts   = 99
  y      = new((/3,npts/),float)
  y(0,:) = sin(x*PI2/npts)
  y(1,:) = 3. + y(0,:)
  y(2,:) = 6. + y(0,:)
;
; Open an X11 window and set the foreground/background colors to
; black/white.
;
  wks = gsn_open_wks("x11","gsun01n")  ; Open an X11 workstation.
  setvalues wks
    "wkForegroundColor" : (/0.,0.,0./)
    "wkBackgroundColor" : (/1.,1.,1./)
  end setvalues

;
; Create three new dash patterns.
;
  dpats = (/"$_____$_____$$_____$$_____$$_____$$_____$$___", \
            "$$$$$$$$$$$$$$$$$$$$$$$______________________", \
            "$$$$$______________$$$$$$$_____"  /)
;
; Add these dash patterns to the current dash pattern table.
;
  new_indexes = NhlNewDashPattern(wks,dpats)
;
; Set up resources for an XY plot.
;
  xyres                   = True
  xyres@gsnMaximize       = True          ; Maximize plot in frame.
  xyres@xyLineColors      = (/2,3,4/)     ; Define line colors.
  xyres@xyLineThicknesses = (/3,3,3/)     ; Define line thicknesses.
  xyres@xyDashPatterns    = new_indexes   ; Define line patterns.
  xyres@tiMainString      = ":F21:Line plot with user-defined dashlines"
  plot = gsn_xy(wks,x,y,xyres)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

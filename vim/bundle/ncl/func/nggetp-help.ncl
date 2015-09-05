THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/nggetp.shtml
THE_TITLE:nggetp
   NCL Home > Documentation > Functions > Graphics routines

nggetp

   Retrieves values for various parameters for the NCAR ngezlogo
   procedure.

Prototype

        function nggetp (
                pnam [1] : string
        )

        return_val [1]

Arguments

   pnam

   Name of the parameter you want to retrieve. It can be all upper or
   lower case.

Description

   The procedure nggetp is used to retrieve values for various
   miscellaneous parameters, including those for ngezlogo. It returns a
   value that is of the type appropriate to the parameter type.

   The valid parameters recognized by the ngezlogo routine are:

   LB (integer, default=1)
          Specifies the secondary logo color (this is applicable only for
          logo type 5, in which case the secondary color is used for the
          text string "UCAR").

   LC (integer, default=1)
          Specifies the logo color (except in the case of an NCAR logo
          being plotted to a PostScript workstation, in which case you
          will get the full-color logo).

   LT (integer, default=1)
          Specify the logo type. The valid logo types are:

          + 1 - An NCAR logo. This logo will be drawn in a single color if
            the output is not going to a PostScript workstation. A full
            color logo will be put to a PostScript workstation.
          + 2 - A UCAR logo (just the UCAR star symbol).
          + 3 - The text "NCAR" in Bell Gothic Black font.
          + 4 - The text "UCAR" in Bell Gothic Black font.
          + 5 - UCAR star logo, plus "UCAR" in Bell Gothic font at half
            the height of the star. In this case, the coordinate (X,Y)
            specifies the center of the star part of the logo.

   OS (float, default=0.07)
          Specifies the logo size in normalized device coordinates (a
          number between 0. and 1.). For example, a size specification of
          0.1 would give a logo size one-tenth the maximum plot height.

   OX (float, default=0.93)
          Specify the logo X-coordinate position in normalized device
          coordinates.

   OY (float, default=0.05)
          Specify the logo Y-coordinate position in normalized device
          coordinates.

See Also

   ngsetp, ngezlogo

Examples

begin
  wks = create "x11" xWorkstationClass defaultapp end create

  ngsetp("os",0.1)      ; logo size
  ngsetp("ox",0.4)      ; X-coordinate position

  do i=1,5
    ngsetp("oy",0.9-i*.15)   ; Y-coordinate position

    ngsetp("lc",i+1)         ; color of the primary logo
    ngsetp("lt",i)           ; logo type
    if(i.eq.5) then
      ngsetp("lb",16)        ; secondary color, only when "LT=5"
    end if
    ngezlogo(wks)            ; draw logo
  end do

  frame(wks)                 ; advance frame

  lb = nggetp("lb")          ; should be 16
  os = nggetp("os")          ; should be 0.1
  ox = nggetp("ox")          ; should be 0.4
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

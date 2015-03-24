THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_open_wks.shtml
THE_TITLE:gsn_open_wks
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_open_wks

   Opens a workstation on which to draw graphics.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_open_wks (
                type [1] : string,
                name [1] : string
        )

        return_val [1] :  graphic

Arguments

   type

   The type of workstation to open.
   name

   The name of the workstation.

Return value

   A scalar id of the workstation is returned.

Description

   This function creates a workstation for drawing graphics, given a
   workstation type and name.

   A workstation type can be an NCGM file ("ncgm"), a PostScript file
   ("ps", "eps", or "epsi"), a PDF file ("pdf"), or an X11 window ("x11").
   The name will be used for the ouput file (if applicable) and with the
   appropriate extension appended.

   The new cairo workstation types added in NCL V5.2.0 ("newpdf", "newps",
   "png") are now the default in V6.1.0. If you specify "ps", "pdf", or
   "png", you will now be getting the new cairo workstation. In order to
   get the old PS and PDF workstations, use "oldps" or "oldpdf". The old
   "x11" driver has also been replaced with the cairo X11 driver. There
   are no "oldx11" or "oldpng" drivers.

   The new cairo "pdf" files are generally smaller than the old "pdf"
   files, but the opposite is not true for PS files. See below for using
   resources to alter the default PNG image size).

   If a resource file name.res exists, it will be loaded. name can have a
   directory path as part of its string, if the resource file you want to
   load is in a separate directory from where the NCL script resides.

   As of V6.1.0, the default color map associated with a workstation is
   "ncl_default". The default color map in V6.0.0 and older was "default".

   If you want to change the default color map that NCL uses, you can:
    1. Set an attribute of type called wkColorMap to one of the other
       predefined color maps.
    2. Create your own.
    3. Permanently change the default color map that is used by setting
       one in your .hluresfile file.

   In V6.1.0, you can now change the color map used by a color contour,
   vector, or streamline plot by setting one of the new resources:
   cnFillPalette, vcLevelPalette, and stLevelPalette. Note that these
   resources have nothing to do with the workstation color map.

   If you don't have gsnMaximize set to True (for when you draw your
   plots), then by default, all output going to a PS or PDF file will be
   in "portrait" mode. To change this to "landscape" mode, do the
   following:

   wks_type = "ps"        ; or "pdf"
   wks_type@wkOrientation = "landscape"
   wks = gsn_open_wks(wks_type,"example")

   In V5.2.0, you can now specify a paper size, or a paper width and
   height when you open any one of the PS or PDF workstations:
   wks_type = "pdf"
   wks_type@wkPaperSize = "A4"
   wks = gsn_open_wks(wks_type,"example")

   wks_type = "ps"
   wks_type@wkPaperWidthF  =  8.5  ; in inches
   wks_type@wkPaperHeightF = 14.0  ; in inches
   wks = gsn_open_wks(wks_type,"example")

   The default image resolution for PNG output is 1024x1024. If want to
   import images into a web page, presentation, or poster, you may want to
   increase this size for better resolution. To change this to 2500 x 2500
   for example, use the following:

   wks_type = "png"
   wks_type@wkWidth = 2500
   wks_type@wkHeight = 2500
   wks = gsn_open_wks(wks_type,"example")

   Note that NCL always draws its graphics to a square window. If you set
   these resources to a non-square, the resultant image will be resized to
   fit in the largest square of the given rectangle.

   You can have up to fifteen PostScript workstations open at one time,
   but you can only have one NCGM or PDF workstation open at one time.

See Also

   gsn_define_colormap, clear, update, frame, NhlUpdateWorkstation,
   NhlChangeWorkstation

Examples

   Try the following script with the resource files zero.res, one.res,
   two.res, three.res, and four.res in the same directory. Also, try
   running this script without the resource files to see the difference:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  xwks    = gsn_open_wks("x11", "zero")
  ps1wks  = gsn_open_wks("ps",  "one")
  ps2wks  = gsn_open_wks("ps",  "two")
  pdfwks  = gsn_open_wks("pdf", "three")
  ncgmwks = gsn_open_wks("ncgm","four")

  gsn_text_ndc(xwks,   "X workstation",0.5,0.5,False)
  gsn_text_ndc(ps1wks, "PS 1 workstation",0.5,0.5,False)
  gsn_text_ndc(ps2wks, "PS 2 workstation",0.5,0.5,False)
  gsn_text_ndc(pdfwks, "PDF workstation",0.5,0.5,False)
  gsn_text_ndc(ncgmwks,"NCGM workstation",0.5,0.5,False)

  frame(xwks)
  frame(ps1wks)
  frame(ps2wks)
  frame(pdfwks)
  frame(ncgmwks)
end


   For some other application examples, see:
     * "color_11.ncl" (view example)
     * "coads_2.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

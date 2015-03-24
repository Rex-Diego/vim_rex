THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/pdfxy_bin.shtml
THE_TITLE:pdfxy_bin
   NCL Home > Documentation > Functions > General applied math

pdfxy_bin

   Performs looping necessary to calculate the bivariate (joint)
   probability distribution (see pdfxy).

   [new.gif] Available in version 5.1.1 and later.

Prototype

        procedure pdfxy_bin (
                x           : numeric ,
                y           : numeric ,
                binxbnd [*] : numeric ,
                binybnd [*] : numeric ,
                opt     [1] : logical
        )

Arguments

   x
   y

   Arrays of any dimensionality. The arrays must be the same size.
   binxbnd
   binybnd

   One dimensional arrays containing the bin boundaries for the x and y
   arrays, respectively.
   opt

   If opt=False, then the PDF will be returned in units of percent (%). If
   opt=True and opt@fraction=True then the units will be 'fraction'.

Description

   This function is designed to be called by pdfxy located in the
   "contributed.ncl" library. However, it can be called as a stand-alone
   function.

   This function was added increase the efficiency of the multiple looping
   necessary to calculate the joint probability distribution function
   (PDF).

See Also

   pdfxy, pdfx, bin_sum, bin_avg

Examples

   Example 1

   This function was meant to be invoked by pdfxy. However, it can be
   invoked directly.


  x     = random_normal( 0,50, (/96,144/))
  y     = random_normal (40,25, dimsizes(x))

  binx  = fspan(-200,202,21)
  biny  = fspan( -50,144,19)

  pdf   = pdfxy_bin(x,y, binx,biny, False)

   If the PDF is to have units of 'fraction', use
  opt   = True
  opt@fraction = True
  pdf   = pdfxy_bin(x,y, binx,biny, opt)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

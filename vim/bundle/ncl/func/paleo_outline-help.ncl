THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/paleo_outline.shtml
THE_TITLE:paleo_outline
   NCL Home > Documentation > Functions > Graphics routines

paleo_outline

   Creates continental outlines from model orography data.

Prototype

        procedure paleo_outline (
                oro    [*][*] : numeric,
                lat       [*] : numeric,
                lon       [*] : numeric,
                landvalue [1] : float,
                basename      : string
        )

        return_val

Arguments

   oro

   A two-dimensional array of orography values. Dimensions are lat x lon.
   lat

   A one-dimensional array of latitudes. Must be the same size as the
   leftmost dimension of oro.
   lon

   A one-dimensional array of longitudes. Must be the same size as the
   rightmost dimension of oro.
   landvalue

   A scalar float that indicates the value of land in oro.
   basename

   A string equal to the base name for the two map files which will be
   created (i.e. "jurassic"). This can include the path where the files
   should be created (i.e. "./eocene").

Description

   This procedure creates continental outlines from model orography data
   for use in paleo-geographic plots, and writes the data to two files
   which can then be accessed via the mpDataSetName resource to draw the
   new outlines. The two files will be called basename.lines and
   basename.names.

   Once these files are created, you can put them in the directory
   $NCARG_ROOT/lib/ncarg/database, and then you can load them using the
   mpDataSetName resource, and you don't have to indicate the path to the
   files or regenerate the files every time.

Examples

   Example 1


  oro = f->ORO(0,:,:)         ; orography data
  lat = f->lat
  lon = f->lon
  landmask = 1                ; land value in oro
  basename = "./EOCENE"       ; files EOCENE.lines and EOCENE.names created

  paleo_outline (oro,lat,lon,landmask,basename)
  ...

  ; the following two resources are required to load and apply the
  ; paleo continental outline.
  res@mpDataBaseVersion = "Ncarg4_1"
  res@mpDataSetName     = basename

  plot = gsn_csm_contour_map_ce (wks,data,res)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

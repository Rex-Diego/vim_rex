THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/overlay.shtml
THE_TITLE:overlay
   NCL Home > Documentation > Functions > NCL object routines, Graphics
   routines

overlay

   Overlays one plot object on another.

Prototype

        procedure overlay (
                base_id      [1] : graphic,
                transform_id [1] : graphic
        )

Arguments

   base_id

   The base plot of the overlay chain of plots. The object referenced must
   support overlays.
   transform_id

   The graphical object to be overlaid on the base_id plot. The object
   must be one of the Transform objects; that is, an object that can go
   through a transformation to become part of the base_id plot. Examples
   of Transform objects include contour plots, XY plots, vector plots, and
   streamline plots.

Description

   The overlay procedure is used to set the transform_id object so it will
   be drawn over the base_id plot. The base_id plot must have the same
   workstation parent as the transform_id object, and it cannot already be
   an overlaid plot itself. The transform_id object will become a plot
   member of the base_id plot.

   The base plot will provide the coordinate transformation and data
   boundaries that together determine where the data coordinate space
   belonging to the overlay will appear, and how much of it will be
   visible. In addition, if the transform is a plot object, the base plot
   assumes management responsibilities for the plot object's plot members
   if it has any.

   It is possible to overlay multiple plots on the same base plot, but you
   need to call overlay for each plot you want to overlay. When a new plot
   is overlaid on a base plot that already has other overlaid members, the
   new plot will be drawn on top of all of the plots currently in the base
   plot's overlay list.

   Note that map plots cannot become overlay plots, although they can
   serve as base plots.

   Once you overlay transform_id plot, you can no longer draw it
   separately. You can only draw the base_id plot, which causes the base
   plot to be drawn along with all the plots that have been overlaid on
   it.

See Also

   NhlRemoveOverlay

Examples

   See examples 1 or 3 in the "Contours overlaid on contours" section, and
   example 1 in the "Meteogram" section.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

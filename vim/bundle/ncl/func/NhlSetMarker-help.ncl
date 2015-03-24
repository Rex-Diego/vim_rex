THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlSetMarker.shtml
THE_TITLE:NhlSetMarker
   NCL Home > Documentation > Functions > Graphics routines

NhlSetMarker

   Sets the markers for a given list of marker indexes and workstations.

Prototype

        function NhlSetMarker (
                wks            [*] : graphic,
                marker_indexes [*] : integer,
                marker_strings [*] : string,
                font_num       [*] : integer,
                xoffset        [*] : numeric,
                yoffset        [*] : numeric,
                aspect_ratio   [*] : numeric,
                size           [*] : numeric,
                angle          [*] : numeric
        )

Arguments

   wks

   An array of NCL Workstation identifiers. The identifiers are ones
   returned either from calling gsn_open_wks or calling create to create a
   Workstation object.

   marker_indexes

   An array of marker indexes (call the length nmarkers).
   marker_strings

   A list of strings of length nmarkers indicating the markers to create.
   font_num

   A scalar or 1D array of length nmarkers containing font table numbers
   indicating which font table to use for each marker string.
   xoffset
   yoffset

   Scalars or 1D arrays of length nmarkers that are the X and Y offsets of
   the markers. The values must be between -1 and 1. Set to 0.0 if you
   don't want to offset the marker.
   aspect_ratio

   A scalar or 1D array of length nmarkers that is the aspect ratio of
   each marker (must be greater than 0). A value greater than 1 stretches
   the marker in the vertical direction, and a value less than 1 stretches
   it in the horizontal direction. Set this to 1.0 to get the default
   aspect ratio.
   size

   A scalar or 1D array of length nmarkers that is a size multiplier for
   the default marker size (must be greater than 0). A value of 2 doubles
   the marker size, and value of 0.5 halves the marker size. Set this to
   1.0 to get the default size.
   angle

   A scalar or 1D array of length nmarkers that is the angle at which to
   rotate each marker counter-clockwise; it must be greater than or equal
   to 0. Set this to 0.0 for no rotation.

Description

   For the marker table of each workstation in wks, this procedure sets
   the given indexes to the marker defined for that index.

   We recommend that you use the NhlNewMarker function instead, as it
   doesn't require that you give it a list of marker indexes. It just adds
   the marker to the end of the current marker table, and returns a new
   list of indexes.

   For more information on how to create a new marker, see the description
   section for NhlNewMarker.

See Also

   NhlNewMarker, NhlNewDashPattern

Examples

   See the examples in NhlNewMarker.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

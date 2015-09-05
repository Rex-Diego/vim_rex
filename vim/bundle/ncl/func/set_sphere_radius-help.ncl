THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/set_sphere_radius.shtml
THE_TITLE:set_sphere_radius
   NCL Home > Documentation > Functions > Spherical harmonic routines

set_sphere_radius

   Sets the radius of a sphere used in spherical harmonic routines.

Prototype

        procedure set_sphere_radius (
                radius  : numeric
        )

Arguments

   radius

   radius of a sphere

Description

   set_sphere_radius sets the radius of a sphere to be used by the
   spherical harmonic routines.

   The default is the radius of the earth (6.37122e+6).

See Also

   get_sphere_radius

Examples

  set_sphere_radius(1.)       ; Set the radius to the unit sphere.
  r = get_sphere_radius       ; Retrieve the radius, should be 1.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

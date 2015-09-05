THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/get_sphere_radius.shtml
THE_TITLE:get_sphere_radius
   NCL Home > Documentation > Functions > Spherical harmonic routines

get_sphere_radius

   Retrieves the radius of a sphere used in spherical harmonic routines.

Prototype

        function get_sphere_radius (
        )

        return_val [1] :  double

Return value

   The returned value is of type double.

Description

   get_sphere_radius retrieves the radius of a sphere being used by the
   spherical harmonic routines.

   The default is the radius of the earth (6.37122e+6).

See Also

   set_sphere_radius

Examples

  set_sphere_radius(1.)       ; Set the radius to the unit sphere.
  r = get_sphere_radius       ; Retrieve the radius, should be 1.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

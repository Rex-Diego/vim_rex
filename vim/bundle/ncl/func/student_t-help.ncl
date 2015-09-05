THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/student_t.shtml
THE_TITLE:student_t
   NCL Home > Documentation > Functions > General applied math

student_t

   Calculates the two-tailed probability of the Student-t distribution.

Prototype

        function student_t (
                t   : numeric,
                df  : numeric
        )

        return_val  :  numeric

Arguments

   t

   A scalar or array containing t-values.
   df

   A scalar, or array of the same size as t, containing the number of
   degrees of freedom. If t is an array and df is a scalar, the df will be
   made to conform to the t array.

Return value

   An array of the same size as t. Double if any of the input arguments
   are double, float otherwise.

Description

   Calculates the two-tailed probability of the Student-t distribution. If
   for any (t,df), t=t_FillValue or df is less-than or equal-to zero, then
   the returned value will be t@_FillValue.

See Also

   cdft_t, betainc

Examples

   Example 1

     t  = 2.12
     df = 16
     P  = student_t(t, df)   ; P = 0.05

   Example 2

   Within roundoff the following should return 0.05 for all (t,df)
     t  = (/ 12.7, 2.572, 2.228,  2.12, 2.086, 1.980,  1.96 /)
     df = (/    1,     5,    10,    16,    20,   120,   500 /)
     P  = student_t(t, df)

   Example 3

     t  = (/ 1.77, 2.57, 1.33,  4.77, 1.87, 2.00, 1.5, 1e20 /)
     df = (/   13,    5,   23,     6,   70,  120,  25,   0  /)
     t@_FillValue = 1e20

     P  = student_t(t, df)  ; P=(/0.100, 0.050, 0.197, 0.003 \
                                 ,0.066, 0.048, 0.146, 1e20  /)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

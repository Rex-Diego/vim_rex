THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/get_cpu_time.shtml
THE_TITLE:get_cpu_time
   NCL Home > Documentation > Functions > System tools

get_cpu_time

   Returns the CPU time used by NCL.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function get_cpu_time (
        )

        return_val [1] :  float

Return value

   Returns the total CPU time in seconds used by the NCL process (user +
   system time) up to the point the function is called.

Description

   This function can be used to derive performance metrics of NCL scripts.
   The typical usage is to measure the execution time of "interesting"
   parts of the script; e.g., the time it takes to read data, or the time
   needed to perform a calculation, the time needed to generate a plot,
   etc.

   The model for using this function is to bracket the portion of interest
   in the script with calls to get_cpu_time(), and then difference the
   results (see examples below).

See Also

   wallClockElapseTime, print_clock

Examples

   Example 1

   Reporting the total CPU time used by a script:

   begin
     ...
     print("Total CPU time: " + get_cpu_time())
   end

   Example 2

   Measuring the CPU time required to generate a plot:
   begTime = get_cpu_time()

   wks = gsn_open_wks(wksType, "myPlot")
      ...
   frame(wks)

   print("Plot generation time: " + (get_cpu_time() - begTime))

   Example 3

   Measuring the CPU time required for an extensive computation:
   begTime = get_cpu_time()
   pi = myFunctionToCalcPiToOneTrillionDecimals()
   print("Calculated PI in " + (get_cpu_time() - begTime) + " seconds")


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

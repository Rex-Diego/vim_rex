THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlGetErrorObjectId.shtml
THE_TITLE:NhlGetErrorObjectId
   NCL Home > Documentation > Functions > NCL object routines

NhlGetErrorObjectId

   Returns a reference to the current Error object.

   [new.gif] Available in version 5.0.0 and later.

Prototype

        function NhlGetErrorObjectId (
        )

        return_val [1] :  object

Description

   The Error object controls NCL error reporting. This function returns a
   reference to the error object so the error resources may be configured
   by the user.

Examples

   The following code snippets show how to use the NhlGetErrorObjectId
   function to change error object resources:

  err = NhlGetErrorObjectId()

  setvalues err
    "errPrint" : "False"
  end setvalues

   This will turn off error message printing (typically not desirable). To
   set the error severity level for printing:

  setvalues err
    "errLevel" : "Fatal"
  end setvalues

   This will show only errors that are Fatal in nature. Errors of lesser
   severity (Warning and Info) would not be shown.

   To redirect all error reporting to a file:

  setvalues err
    "errFileName" : "/tmp/myErrors"
  end setvalues

   This will send all errors reported by NCL during execution to the file
   /tmp/myErrors.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

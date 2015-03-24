THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/reg_multlin.shtml
THE_TITLE:reg_multlin
   NCL Home > Documentation > Functions > General applied math

reg_multlin

   Performs basic multiple linear regression analysis.

Prototype

        function reg_multlin (
                y    [*] : numeric,
                x [*][*] : numeric,
                option   : logical
        )

        return_val [*] :  float or double

Arguments

   y

   A one-dimensional array of length N containing the dependent variable
   [y(N)].
   x

   A two-dimensional array of size [x(M+1,N)] where M is the number of
   independent variables.
   option

   A logical variable. Currently not used.

Return value

   The one-dimensional array, say b, returned is the same length as the
   leftmost dimension of x. This will contain the partial regression
   coefficients. The return values will be of type double if x or y is
   double, and float otherwise.

   Beginning with version a033, the standardized partial regression
   coefficients, say B, will be returned as attributes of the returned
   variable. These represent the partial regression coefficients.

Description

   reg_multlin performs a basic multiple linear regression. A one
   dimensional array (call it b(M+1), containing the partial regression
   coefficients is returned. These partial regression coefficients are
   sometimes called "b" or "beta" coefficients. They represent the rate of
   change in the dependent variable for a unit change in the independent
   variable, under the constraint that all other independent variables are
   held constant.

   Basically, the following system of equations is solved (here, three
   independent variables):
                   X0  X1  X2  X3            Y
                  _              _  _  _    _  _
               X0 |              |  |b0|    |  |
               X1 |              |  |b1| =  |  |
               X2 |              |  |b2|    |  |
               X3 |              |  |b3|    |  |
                  -              -  -  -    -  -

   where the X0 is a dummy variable equal to one (1.0) for every
   observation.

   The partial regression coefficients, b, can be used to calculate
   standardized regression coefficients, say B. The B represent the
   partial regression coefficients in units of standard deviation. The
   following illustrates the simple calculation needed make the
   transformation:
    B = b*standard_deviation(X)/standard_deviation(Y)

   Since the B are expressed in units of standard deviation they may be
   directly compared with each other to determine the most effective
   variables (see example 4).

   The user may wish to take into account the uncertainty associated with
   each estimated parameter. This is done by an analysis of variance
   [ANOVA] procedure. This can be done via NCL but is not a standard
   function.

   While missing values are allowed, it is recommended that users not
   input any missing independent values. It just confuses the results.
   Missing values should be indicated by the _FillValue attribute.

See Also

   reg_multlin_stats, regline, regline_stats

Examples

   Examples 1 and 2 use data from:
   Introductory Statistics for Business and Economics
   T.H. Wonnacott and R.J. Wonnacott
   John Wiley and Sons, 4th Ed, 1990

   Example 1

; pp 401-403:    Y  = 28 + 0.038*x1 + 0.83*x2

       y  = (/40,50,50,70,65,65,80/)
       N  = dimsizes(y)

       M  = 2
       x1 = (/100,200,300,400,500,600,700/)
       x2 = (/ 10, 20, 10, 30, 20, 20, 30/)
                                              ; create independent array
       X  = new ( (/M+1,N/), "float" )
       X(0,:) = 1.0                           ; constant term on rhs
       X(1,:) = x1
       X(2,:) = x2
                                              ; partial regression coef
       beta = reg_multlin (y,X,False)
       print(beta)

   The partial regression coefficients are:
       Variable: beta
       Type: float
       Total Size: 12 bytes
                   3 values
       Number of Dimensions: 1
       Dimensions and sizes:   [3]
       (0)     28.09524
       (1)     0.03809524
       (2)     0.8333333

   Example 2

   This is another very simple example that illustrates how to read in
   tabular data via asciiread. The asciifile "WONNACOTT.p436.TXT"
   contains:
    85  30  0
    95  40  1
    90  40  1
    75  20  0
   100  60  1
    90  40  0
    90  50  0
    90  30  1
   100  60  1
    85  30  1

; pp 436:    Y  = 69.5 + 0.442*x1 + 4.65*x2

       nRow = numAsciiRow("./WONNACOTT.p436.TXT")
       data = asciiread("./WONNACOTT.p436.TXT", (/nRow,3/), "float")
       y  = data(:,0)
       N  = dimsizes(y)                   ; same as nRow here

       M  = 2
       X  = new ( (/M+1,N/), typeof(data) )
       X(0,:) = 1.0
       X(1,:) = data(:,1)
       X(2,:) = data(:,2)
                                          ; partial regression coef
       b = reg_multlin (y,X,False)
       print(b)

   The partial regression coefficients are:
       Variable: b
       Type: float
       Total Size: 12 bytes
                   3 values
       Number of Dimensions: 1
       Dimensions and sizes:   [3]

       (0)     69.53488
       (1)     0.4418605
       (2)     4.651163

   Example 3

   This illustrates the use of readAsciiTable to read an ascii file with
   "header" information. The "header" portion of the file contains:
Source:
Statistics and Data Analysis in Geology
John C Davis
John Wiley and Sons: 2002:   3rd Edition:
Results: p 467 [typo b' in book 0.226 should be 0.0226]
b' = [-2.244  0.005  0.0226  -0.233   -0.063  -0.002  -0.117]

Y        X1      X2     X3       X4     X5      X6

   This example also illustrates the use of write_matrix to print the
   input data array.

       load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

       diri    = "./"
       fili    = "KENTUCKY.TXT"

       ncol    = 7
       data    = readAsciiTable( diri+fili, ncol, "float" , "Y")

       dimd    = dimsizes(data)
       N       = dimd(0)              ; number of rows        [50]
       M       = ncol-1               ; number of variables   [ 7]  Y and six "X
"

       write_matrix(data, "7f10.0", False)

       Y       = data(:,0)
       X       = new ( (/M+1,N/) , typeof(data))
       X(0,:)  = 1.0
       X(1,:)  = data(:,1)
       X(2,:)  = data(:,2)
       X(3,:)  = data(:,3)
       X(4,:)  = data(:,4)
       X(5,:)  = data(:,5)
       X(6,:)  = data(:,6)

       b       = reg_multlin(Y,X,False)
       print (b)

   The partial regression coefficients are:
       Variable: b
       Type: float
       Total Size: 28 bytes
                   7 values
       Number of Dimensions: 1
       Dimensions and sizes:   [7]

       (0)     -2.24446
       (1)      0.005091291
       (2)      0.0225729
       (3)     -0.2328043
       (4)      0.0626111
       (5)     -0.002037694
       (6)     -0.1165836

   The write_matrix(data, "7f10.0", False) output is:
       14.      720.      570.        7.      154.     2200.       61.
        6.      670.      610.        3.       80.     2667.       62.
        5.      860.      550.       11.       84.      763.       62.
        7.      870.      610.       11.      122.     1110.       63.
       11.      730.      570.       14.      185.     1321.       52.
       14.      690.      590.       12.      200.     1667.       50.
       12.      880.      640.       11.      170.     1545.       41.
       18.      760.      690.       28.      340.     1215.       57.
        6.      820.      600.        5.      100.     2000.       41.
        5.      720.      480.        3.       80.     2667.       60.
       17.      670.      670.       19.      290.     1526.       51.
        5.      660.      600.        5.       90.     1800.       53.
       22.      830.      660.       18.      260.     1444.       57.
        7.      780.      620.       17.      111.      652.       57.
       15.      750.      740.       15.      184.     1227.       67.
       17.      770.      630.       21.      227.     1080.       59.
        5.      750.      570.        4.       60.     1500.       55.
       18.      750.      580.       20.      259.     1295.       39.
       14.      740.      760.        9.       62.      689.       64.
       21.      750.      740.        6.       95.     1583.       53.
       22.      750.      760.       11.      105.      954.       64.
       23.      740.      770.       32.      350.     1094.       55.
       28.      940.      510.       21.      232.     1105.       52.
       42.      700.      600.       23.      266.     1156.       34.
       22.      810.      580.       44.      390.      886.       29.
       10.      920.      500.       13.      142.     1092.       65.
       11.      920.      490.       12.      145.     1208.       72.
       12.      790.      605.       33.      253.      766.       59.
       13.      860.      550.       23.      241.     1048.       76.
       31.      860.      630.       87.      702.      807.       55.
       18.      880.      520.       37.      288.      778.       51.
       13.      780.      460.       17.      162.      953.       40.
        4.      720.      440.        8.       67.      838.       60.
        5.      780.      300.        3.       52.     1733.       57.
        9.      700.      460.       10.      121.     1210.       50.
       13.      680.      520.       26.      220.      846.       41.
       10.      820.      520.        8.      123.     1537.       51.
       13.      710.      520.       24.      238.      992.       41.
       13.      800.      440.       19.      231.     1216.       51.
       11.      700.      510.       16.      178.     1113.       76.
       12.      675.      570.       18.      168.      933.       42.
        4.      740.      510.        8.       65.      812.       49.
       17.      740.      520.       31.      334.     1078.       67.
        9.      770.      600.       21.      184.      876.       47.
        8.      820.      520.       11.      136.     1237.       56.
       13.      850.      490.       22.      233.     1059.       74.
       22.      820.      629.       34.      410.     1206.       39.
       10.      820.      510.       11.      149.     1354.       60.
       19.      680.      640.       46.      348.      757.       55.
       27.      660.      789.       55.      382.      695.       38.

   Example 4

   This illustrates how to calculate the standard regression coefficients
   for example 3.
       Ystd      = stddev(Y)
       Xstd      = dim_stddev(X)
       XstdYstd  = Xstd/Ystd    ; array operation
       B         = b*XstdYstd   : standard regression coefficients
       B(0)      = 0.0          ; this corresponds to the constant term

       print(B)

   The standard regression coefficients are:
       Variable: B
       Type: float
       Total Size: 28 bytes
                   7 values
       Number of Dimensions: 1
       Dimensions and sizes:   [7]

       (0)     0
       (1)     0.0485438
       (2)     0.2841468
       (3)    -0.4579774
       (4)     0.9748371
       (5)    -0.1198416
       (6)    -0.1625881


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF

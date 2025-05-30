
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SDS111: Introduction to Data Display and Analysis

<!-- badges: start -->

<!-- badges: end -->

Class material and functions for S&DS 111: Introduction to Data Display
and Analysis

## Installing the SDS111 package

To install the SDS111 package that contains functions that are useful
for the class run the function below

Note: we recommend you cut and paste all these commands to avoid typos.

``` r
install.packages("devtools")
devtools::install_github("emeyers/SDS111")
```

## Initial setup using the SDS111 package

Once you have installed the SDS111 package, you can use this package to
install other packaged required by the class as well as LaTeX using the
`SDS111:::initial_setup()` function shown below.

Notes:

1.  If any dialog boxes pop up, just click “ok” on them to proceed.
2.  This function might take several minutes to run so please be
    patient.
3.  If it asks you to update any existing package you can do so
    (recommended) or you can skip this.
4.  When the function is done running, if it asks you to restart R,
    please close and then reopen R Studio.

``` r
SDS111:::initial_setup()
```

#### Testing LaTeX has been installed

To test that LaTeX has correctly installed on your system you can run
the following command:

``` r
tinytex:::is_tinytex()
## [1] TRUE
```

If the function returns TRUE, then you have successfully installed
LaTeX.

## Class material

All class material is in the
[ClassMaterial](https://github.com/emeyers/SDS111/tree/main/ClassMaterial)
directory. In particular the
[ClassMaterial/slides](https://github.com/emeyers/SDS111/tree/main/ClassMaterial/slides)
directory contains the class slides which can be useful to review what
was covered in class.

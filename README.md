## Description

This depository includes the data and the Matlab code used in Ioannidis K., Karagrigoriou A. & Lekkas D.F. (2015). [Analysis and Modeling of Rainfall Events](http://nonlinearstudies.com/index.php/mesa/article/view/1237). *Mathematics in Engineering, Science and Aerospace*, 6(4):607-614

### Abstract

The purpose of this study is the statistical analysis of rainfall events to explore patterns and dependencies that would allow the generalization in cases of missing or truncated data. More specifically, in this paper we estimate intensity-duration-frequency (IDF) curves, which are widely used to model rainfall. We use data from a meteorological station in Eresos, Greece and estimate the parameters of the model for fixed return periods. Sensitivity analysis is conducted to check whether the estimates are optimal. Finally, a more general model is applied that allows for simultaneous modeling of rainfall duration, intensity and frequency (via return periods). 

### Software

The analysis was conducted using ```Matlab 8.4```.

### Files

The files are stored in two folders: Data, which contains data from the meteorological station, and Matlab, which contains the Matlab code to produce every result in the paper.

1. Data
   * Rainfall Data.csv (*The data from the meteorological station in csv format*)
   * Rainfall Codebook.md (*Codebook for ```Raifall Data.csv```*)
2. Stata
   * rainfall.m (*Calls and executes all other files*)
   * prepare_data.m (*Loads data and prepares it for analysis*)
   * figure_1.m (*Produces Figure 1*)
   * figure_2.m (*Produces Figure 2*)
   * figure_3.m (*Produces Figure 3*)
   * figure_4.m (*Produces Figure 4*)
   * table_1.m (*Produces Table 1*)
   * table_2.m (*Produces Table 2*)
   * table_3.m (*Produces Table 3*)

### Instructions
To run the code, you only need to run **rainfall.m**.

## Contributing

**[Konstantinos Ioannidis](http://konstantinosioannidis.com/)** 
For any questions, please email me here **ioannidis.a.konstantinos@gmail.com**.

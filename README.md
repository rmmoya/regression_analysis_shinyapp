# Shiny app for regression analysis
Developed for the assignment of course Developing Data Products of Johns Hopkins University, I have created this shiny app to perform a regression analysis of fuel consumption (mpg) versus the transmission mode (am), based on the popular data set mtcars.

mtcars is based on the data extracted from 1974 Motor Trend US magazine, which comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles.

In order to determine if there is a direct relationship between transmission mode and fuel consumption, additional variables can be incorporated in the linear regression model by just selecting them in the checkboxes. Multi-variate analysis is then performed and visible in the charts and tables.

Initially it can be observed that manual tranmission cars have less fuel consumption than manual cars, but if gross horse power(hp), weight (wt) and number of cylinders (cyl) is be added to the regression analysis, the difference can be correctly estimated rather than just comparing transmission type.

Based on the adjusted regression model that is developed in this document, **manual transmission cars have an additional autonomy of approx 2 miles per gallon, compared to automatic transmission cars**. If compared with a simple regression model of transmission type vs fuel consumption, it is a lower value. On the **simple regression model**, the expected increase in miles per gallon is **approx 7.25**.

## How to use it

In order to determine if there is a direct relationship between transmission mode and fuel consumption, additional variables can be incorporated in the linear regression model by just selecting them in the checkboxes. 

Multi-variate analysis is then performed and visible in the charts and tables.

Browse the tabs of 'Correlation' and 'Table'.

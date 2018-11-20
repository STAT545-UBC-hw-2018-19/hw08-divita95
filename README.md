## Homework#8- Making a shiny app
This is the homework#8 repository of **Divita Pal**. This repository contains the following files:
1. [bcl](https://github.com/STAT545-UBC-students/hw08-divita95/tree/master/bcl) : It is the folder that consists of the code of the shiny app that was developed in R studio and the data used fot the app
2. [README](https://github.com/STAT545-UBC-students/hw08-divita95/blob/master/README.md) : A brief description of the repository and the relevant informations pertaining to it.
3. [BC_liqour_data](https://github.com/STAT545-UBC-students/hw08-divita95/blob/master/bcl/bcl-data.csv) : The data set used as reference to develope the R. 

#### Overview
The objective of the homework was to work on the BC Liqour shiny app developed using [STAT545_Classroom](http://stat545.com/Classroom/notes/cm107.nb.html) by exploring and incorporating some additional features some additional features.

#### Features of the Shiny App developed

**Task1:** Add an option to sort the results table by price.
In this task, the `checkboxinput()` widget was used to create a check box so that the table can be sorted according to price. Check the app (*link provided above*) to see the code for developing this widget.

**Task2:** Use the DT package to turn the current results table into an interactive table.
In this task,  DT package was installed firstly into Rstudio. The following code can be used:
```{r}
install.packages("DT")
library(DT)
```
After installation is done, the package was loaded using library fucntion and tableOutput() was replaces with dataTableOutput() and renderTable() was replaced with renderDataTable().

**Task3:** Add parameters to the plot
For this task, `colorinput()` function was used to change the color of the plot. The select color box appears on the side bar panel and can be set to any color by dragging the cursor around the palette.

#### Link to the website where the app was hosted
You can get the shiny app developed [here]()
